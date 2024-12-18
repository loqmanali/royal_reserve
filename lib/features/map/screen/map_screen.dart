import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reserve/core/core.dart';

import '../../../core/widgets/card_with_image.dart';

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
                GestureDetector(
                  onTap: () {
                    context.goNamed(AppRoutes.alSammanAreaLogin);
                  },
                  child: const CardWithImage(
                    imagePath: AppImages.alSammanArea,
                    title: 'منطقة الصمان',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
