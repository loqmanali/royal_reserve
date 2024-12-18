import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_reserve/core/core.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TicketWidget();
  }
}

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            children: [
              _buildBackgroundImage(context),
              Column(
                children: [
                  _buildAppBar(context),
                  Divider(
                    color: AppColors.primaryContainer,
                    thickness: 1,
                    indent: 10.w,
                    endIndent: 10.w,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                  _buildTicketContent(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.38,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        image: DecorationImage(
          image: const AssetImage(AppImages.alSammanArea),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "التذكرة",
          style: AppTextStyles.heading2.copyWith(
            color: AppColors.white,
            fontWeight: AppFonts.bold,
          ),
        ),
        centerTitle: true,
        leading: const Icon(Icons.menu, color: AppColors.white),
        actions: const [
          Icon(Icons.arrow_forward, color: AppColors.white),
        ],
      ),
    );
  }

  Widget _buildTicketContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CustomPaint(
            painter: TicketPainter(
              cutoutPosition: 0.75,
              ticketHeight: constraints.maxHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTicketImage(),
                  const Gap(8),
                  _buildTicketTitle(),
                  const Gap(8),
                  _buildDivider(),
                  const Gap(8),
                  _buildTicketDetails(),
                  const Gap(16),
                  _buildShareButton(),
                  const Gap(24),
                  _buildBarcode(),
                  const Gap(16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTicketImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        AppImages.alSammanArea,
        height: 200.h,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTicketTitle() {
    return Text(
      'جولة على الأقدام',
      style: AppTextStyles.heading2.copyWith(
        color: AppColors.primaryColor,
        fontWeight: AppFonts.medium,
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: AppColors.primaryContainer.withOpacity(0.5),
      thickness: 1,
      indent: 10.w,
      endIndent: 10.w,
    );
  }

  Widget _buildTicketDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const TicketInfo(
            title: 'الاسم',
            value1: 'ريهام هشام المصري',
            title2: 'اليوم',
            value2: '16-3-2025',
          ),
          SizedBox(height: 12.h),
          const TicketInfo(
            title: 'الوقت',
            value1: '6:30 - 9:10',
            title2: 'المكان',
            value2: 'منطقة الصمان',
          ),
        ],
      ),
    );
  }

  Widget _buildShareButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppImages.shareIcon),
        const SizedBox(width: 4),
        Text(
          'مشاركة',
          style: AppTextStyles.smallText.copyWith(
            color: AppColors.darkTextColor,
            fontWeight: AppFonts.semiBold,
          ),
        ),
      ],
    );
  }

  Widget _buildBarcode() {
    return BarcodeWidget(
      barcode: Barcode.code128(),
      data: '12331567',
      width: 200,
      height: 100,
    );
  }
}

class TicketInfo extends StatelessWidget {
  const TicketInfo({
    super.key,
    required this.title,
    required this.value1,
    required this.title2,
    required this.value2,
  });

  final String title;
  final String value1;
  final String title2;
  final String value2;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1.5),
        1: FlexColumnWidth(1),
      },
      children: [
        _buildTableRow(
          title,
          title2,
          style: AppTextStyles.bodyText.copyWith(
            color: AppColors.title,
            fontWeight: AppFonts.bold,
          ),
        ),
        _buildTableRow(
          value1,
          value2,
          style: AppTextStyles.bodyText.copyWith(
            color: AppColors.darkTextColor,
            fontWeight: AppFonts.regular,
          ),
        ),
      ],
    );
  }

  TableRow _buildTableRow(String text1, String text2, {TextStyle? style}) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 4.h),
          child: Text(text1, style: style),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 4.h),
          child: Text(text2, style: style),
        ),
      ],
    );
  }
}

class TicketPainter extends CustomPainter {
  final Color backgroundColor;
  final Color borderColor;
  final Color dashColor;
  final double cornerRadius;
  final double cutoutRadius;
  final double dashWidth;
  final double dashSpace;
  final double cutoutPosition;
  final double ticketHeight;

  const TicketPainter({
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.brown,
    this.dashColor = AppColors.primaryColor,
    this.cornerRadius = 20.0,
    this.cutoutRadius = 15.0,
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
    this.cutoutPosition = 0.75,
    required this.ticketHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke;

    final dashPaint = Paint()
      ..color = dashColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = _createTicketPath(size);

    // Draw main shape and border
    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);

    // Draw dashed line
    _drawDashedLine(canvas, size, dashPaint);
  }

  Path _createTicketPath(Size size) {
    final path = Path();
    final cutoutY = size.height * cutoutPosition;

    // Top left corner
    path.moveTo(cornerRadius, 0);
    path.lineTo(size.width - cornerRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);

    // Right side to cutout
    path.lineTo(size.width, cutoutY - cutoutRadius);
    path.arcToPoint(
      Offset(size.width, cutoutY + cutoutRadius),
      radius: Radius.circular(cutoutRadius),
      clockwise: false,
    );

    // Bottom right corner
    path.lineTo(size.width, size.height - cornerRadius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - cornerRadius,
      size.height,
    );

    // Bottom left corner
    path.lineTo(cornerRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);

    // Left side with cutout
    path.lineTo(0, cutoutY + cutoutRadius);
    path.arcToPoint(
      Offset(0, cutoutY - cutoutRadius),
      radius: Radius.circular(cutoutRadius),
      clockwise: false,
    );

    // Complete the path
    path.lineTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    return path;
  }

  void _drawDashedLine(Canvas canvas, Size size, Paint dashPaint) {
    final startX = cornerRadius + 15;
    final endX = size.width - cornerRadius - 15;
    final cutoutY = size.height * cutoutPosition;

    double currentX = startX;
    while (currentX < endX) {
      canvas.drawLine(
        Offset(currentX, cutoutY),
        Offset(currentX + dashWidth, cutoutY),
        dashPaint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
