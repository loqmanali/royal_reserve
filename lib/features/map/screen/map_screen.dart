import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_reserve/core/core.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: true,
          title: const Text('الخريطة'),
          centerTitle: true,
          surfaceTintColor: AppColors.backgroundColor,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(AppImages.mapImage),
                  ),
                ),
                const Gap(8),
                Divider(
                  color: AppColors.primaryColor.withOpacity(0.5),
                ),
                const Gap(8),
                const CardWithImage(
                  imagePath: AppImages.ummQalidaArea,
                  title: 'منطقة أم قليدة',
                ),
                const Gap(16),
                const CardWithImage(
                  imagePath: AppImages.alSammanArea,
                  title: 'منطقة الصمان',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CardWithImage extends StatelessWidget {
  const CardWithImage({
    super.key,
    required this.imagePath,
    required this.title,
    this.borderRadius,
  });

  final String imagePath;
  final String title;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        child: Stack(
          children: [
            // Image
            Image.asset(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
            ),
            // Title
            Positioned(
              bottom: 16,
              right: 16,
              child: Text(
                title,
                style: AppTextStyles.bodyText.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
