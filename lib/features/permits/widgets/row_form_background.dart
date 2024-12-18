import 'package:flutter/material.dart';

import '../../../core/core.dart';

class RowFormBackground extends StatelessWidget {
  const RowFormBackground({
    super.key,
    required this.formItems,
  });

  final List<Widget> formItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: const AssetImage(AppImages.bannerBg),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor.withOpacity(0.5),
            BlendMode.srcOver,
          ),
        ),
      ),
      child: Column(
        children: formItems,
      ),
    );
  }
}
