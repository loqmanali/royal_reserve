import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_reserve/core/core.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
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
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.sizeOf(context).height * 0.3,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: _buildContentInImage(context),
                    ),
                  ),
                ],
              ),
              const Gap(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: OverlappingAvatars(
                            imageUrls: [
                              AppImages.logo,
                              AppImages.logo,
                              AppImages.logo,
                            ],
                            text: '134+ منضمين',
                          ),
                        ),
                        Text(
                          '200 ر.س',
                          style: AppTextStyles.bodyText.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    Divider(
                      color: AppColors.primaryColor.withOpacity(0.2),
                      thickness: 1,
                      indent: 10.w,
                      endIndent: 10.w,
                    ),
                    const Gap(16),
                    Text(
                      'عن الجولة',
                      style: AppTextStyles.bodyText.copyWith(
                        color: AppColors.title,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(16),
                    Text(
                      '''
تأسست محمية الملك عبد العزيز الملكية في عام 2018؛ بهدف حفظ الطبيعة والحياة الفطرية وتنميتها وتحقيق الاستدامة البيئية.
تقع في شمال مدينة الرياض على مساحة تقارب 28 ألف كيلومتر مربع، وتضم في مناطقها (روضات: الخفس والتنهاة ونورة، وجزءاً من هضبة الصمان، وصحراء الدهناء)، وهي مناطق تحتوي على إرث تاريخي عريق، وتزخر المحمية بالعديد من المقومات الطبيعية، حيث تضم أنواع مختلفة من الحيوانات والنباتات والأحياء الدقيقة التي تتعايش مع بعضها في بيئة ذات معالم وتضاريس متنوعة، ويمنع فيها الصيد والتخييم والاحتطاب والرعي الجائر؛ للحفاظ على الغطاء النباتي وزيادته وإعادة التنوع الأحيائي للأنـواع المتوطنة والهشة والمهـددة بالانقراض
''',
                      style: AppTextStyles.smallText.copyWith(
                        color: AppColors.smallText,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const Gap(16),
                    Divider(
                      color: AppColors.primaryColor.withOpacity(0.2),
                      thickness: 1,
                      indent: 10.w,
                      endIndent: 10.w,
                    ),
                    const Gap(16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimalIconWidget(
                          icon: AppImages.almihaIcon,
                          name: 'المها العربي',
                        ),
                        AnimalIconWidget(
                          icon: AppImages.alnamirIcon,
                          name: 'النمر العربي',
                        ),
                        AnimalIconWidget(
                          icon: AppImages.monkeysIcon,
                          name: 'قرود الرباح',
                        ),
                        AnimalIconWidget(
                          icon: AppImages.wolfIcon,
                          name: 'الذئب العربي',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(Size(150.w, 40.h)),
                ),
                child: Text(
                  'تسجيل',
                  style: AppTextStyles.bodyText.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '200 ر.س',
                style: AppTextStyles.bodyText.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
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
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
          fit: BoxFit.cover,
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
          "تفاصيل",
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

  Widget _buildContentInImage(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'جولة على الأقدام',
              style: AppTextStyles.bodyText.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '06:30 - 09:30',
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const Gap(12),
                Text(
                  '16-12-2024',
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Icon(
          Icons.favorite_border,
          color: AppColors.white,
        ),
      ],
    );
  }
}

class AnimalIconWidget extends StatelessWidget {
  const AnimalIconWidget({
    super.key,
    required this.icon,
    required this.name,
  });

  final String icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50.w,
          height: 50.h,
          decoration: const BoxDecoration(
            color: AppColors.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
        const Gap(8),
        Text(
          name,
          style: AppTextStyles.smallText.copyWith(
            color: AppColors.smallText,
          ),
        ),
      ],
    );
  }
}

class OverlappingAvatars extends StatelessWidget {
  final List<String> imageUrls;
  final double avatarRadius;
  final double overlap;
  final String? text;

  const OverlappingAvatars({
    super.key,
    required this.imageUrls,
    this.avatarRadius = 18,
    this.overlap = 18,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: (avatarRadius * 2) + (overlap * (imageUrls.length - 1)),
          height: avatarRadius * 2,
          child: Stack(
            clipBehavior: Clip.none,
            children: List.generate(
              imageUrls.length,
              (index) => Positioned(
                right: index * overlap,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(avatarRadius),
                    border: Border.all(
                      color: AppColors.primaryContainer,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(avatarRadius),
                    child: Container(
                      width: avatarRadius * 2,
                      height: avatarRadius * 2,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            imageUrls[index],
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (text != null) ...[
          const Gap(16),
          Text(
            text!,
            style: AppTextStyles.smallText.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ],
    );
  }
}
