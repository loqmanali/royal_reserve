import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_reserve/core/core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _CustomSliverAppBarDelegate(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'عن المحمية',
                    style: AppTextStyles.subtitle,
                  ),
                  const Gap(8),
                  const Text(
                    '''تأسست محمية الملك عبد العزيز الملكية في عام 2018؛ بهدف حفظ الطبيعة والحياة الفطرية وتنميتها وتحقيق الاستدامة البيئية.
تقع في شمال مدينة الرياض على مساحة تقارب 28 ألف كيلومتر مربع، وتضم في مناطقها (روضات: الخفس والتنهاة ونورة، وجزءاً من هضبة الصمان، وصحراء الدهناء)، وهي مناطق تحتوي على إرث تاريخي عريق، وتزخر المحمية بالعديد من المقومات الطبيعية، حيث تضم أنواع مختلفة من الحيوانات والنباتات والأحياء الدقيقة التي تتعايش مع بعضها في بيئة ذات معالم وتضاريس متنوعة، ويمنع فيها الصيد والتخييم والاحتطاب والرعي الجائر؛ للحفاظ على الغطاء النباتي وزيادته وإعادة التنوع الأحيائي للأنـواع المتوطنة والهشة والمهـددة بالانقراض''',
                    style: AppTextStyles.smallText,
                    textAlign: TextAlign.justify,
                  ),
                  const Gap(16),
                  Divider(
                    color: AppColors.smallText.withOpacity(0.5),
                  ),
                  const Gap(16),
                  const Text(
                    'جولتنا',
                    style: AppTextStyles.subtitle,
                  ),
                  const Gap(16),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SafariCard(),
                        SafariCard(),
                        SafariCard(),
                      ],
                    ),
                  ),
                  const Gap(16),
                  const Text(
                    'الأكثر انتشارا',
                    style: AppTextStyles.subtitle,
                  ),
                  const Gap(16),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SafariCard(),
                        SafariCard(),
                        SafariCard(),
                      ],
                    ),
                  ),
                  const Gap(16),
                  Divider(
                    color: AppColors.smallText.withOpacity(0.5),
                  ),
                  const BannerWithTextButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SafariCard extends StatelessWidget {
  const SafariCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 160,
        child: Stack(
          children: [
            // Image
            Container(
              height: 240,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.safariImage),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Gradient overlay
            Container(
              height: 240,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),

            // Heart icon
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),

            // Arabic text
            Positioned(
              bottom: 10,
              right: 10,
              left: 10,
              child: Text(
                'جولة حرة بالمحمية',
                style: AppTextStyles.bodyText.copyWith(
                  color: AppColors.white,
                ),
                textAlign: TextAlign.right,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight = 400.h;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double percentage = shrinkOffset / expandedHeight;
    // final bool isContentVisible =
    //     shrinkOffset < (expandedHeight - kToolbarHeight);
    final double topPadding = MediaQuery.paddingOf(context).top;

    return Stack(
      fit: StackFit.expand,
      children: [
        /// Background Image
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            image: const DecorationImage(
              image: AssetImage(AppImages.appBarImage),
              fit: BoxFit.cover,
            ),
            boxShadow: shrinkOffset > 0
                ? [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(0, 3),
                    )
                  ]
                : [],
          ),
        ),

        /// Logo and Menu Icon - Always Visible with SafeArea Padding
        Positioned(
          top: topPadding + 8.w, // Safe area padding
          left: 16.w,
          right: 16.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppImages.logoWithText,
                width: 100.w,
              ),
              const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ],
          ),
        ),

        /// Text in Center
        Positioned(
          top: (expandedHeight / 2) - shrinkOffset * 0.5,
          left: 16.w,
          right: 16.w,
          child: Opacity(
            opacity: (1 - percentage).clamp(0.0, 1.0),
            child: Text(
              'بيئة برية جذابة و مستدامة',
              style: AppTextStyles.heading1.copyWith(
                color: const Color(0xFFFCF5DC),
                fontSize: 24.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        /// Search near Bottom
        Positioned(
          bottom: 35,
          left: 16.w,
          right: 16.w,
          child: Opacity(
            opacity: (1 - percentage).clamp(0.0, 1.0),
            child: const TextFieldComponent(
              keyName: 'search',
              hintText: 'ابحث',
              suffixIcon: Icon(Icons.search, color: AppColors.grey),
              backgroundColor: Colors.black38,
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class BannerWithTextButton extends StatelessWidget {
  const BannerWithTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        /// Background Image
        Container(
          height: 140.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.bannerBg),
              fit: BoxFit.cover,
            ),
          ),
        ),

        /// Centered Text
        Positioned(
          top: 40.h,
          left: 16.w,
          right: 16.w,
          child: Text(
            '''
ساهم في تلقيح ٩٠٪ من النباتات البرية المزهرة
و ٨٧٪ من المحاصيل الزراعية في العالم
''',
            style: AppTextStyles.bodyText.copyWith(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        /// Button Positioned at Bottom
        Positioned(
          bottom: 8.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryContainer,
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () {
              // Button action
            },
            child: Text(
              'إصدار تصريح',
              style: AppTextStyles.bodyText.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
