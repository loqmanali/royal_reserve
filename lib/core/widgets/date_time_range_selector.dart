import 'package:flutter/material.dart';

import '../core.dart';

class DateTimeRangeSelector extends StatelessWidget {
  const DateTimeRangeSelector({
    super.key,
    this.onTap,
    required this.label,
    required this.icon,
    this.backgroundColor,
    this.hintText,
  });

  final Function()? onTap;
  final String label;
  final String? hintText;
  final IconData icon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTextStyles.smallText.copyWith(
              color: AppColors.white,
              fontSize: 15,
            ),
          ),
          const Gap(8),
          Container(
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.white),
            ),
            child: Row(
              children: [
                Text(
                  hintText ?? '',
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const Gap(8),
                const Spacer(),
                Icon(
                  icon,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
