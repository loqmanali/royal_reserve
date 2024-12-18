import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reserve/core/core.dart';

import '../../../core/widgets/card_with_image.dart';

class AlSammanAreaLoginScreen extends StatelessWidget {
  const AlSammanAreaLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(
            title: 'تسجيل دخول منطقة الصمان',
            bgImage: AppImages.alSammanArea,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Gap(16),
                  CardWithImage(
                    imagePath: AppImages.alSammanArea,
                    title: 'تسجيل دخول منطقة الصمان',
                    onTap: () {
                      context.goNamed(AppRoutes.alSammanAreaLoginForm);
                    },
                  ),
                  const Gap(16),
                  CardWithImage(
                    imagePath: AppImages.alSammanArea,
                    title: 'تصريح العمل خارج أوقات العمل الرسمية',
                    onTap: () {
                      context.goNamed(AppRoutes.offDutyWorkPermit);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
