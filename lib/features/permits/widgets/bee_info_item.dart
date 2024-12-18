import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_reserve/core/core.dart';

class BeeInfoItem extends StatelessWidget {
  final String text;
  final bool hasBackground;

  const BeeInfoItem({
    super.key,
    required this.text,
    this.hasBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppImages.beeIcon),
        const Gap(8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: hasBackground ? AppColors.smallText3 : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              text,
              style: AppTextStyles.smallText.copyWith(
                color: AppColors.darkTextColor,
                fontSize: 10.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
