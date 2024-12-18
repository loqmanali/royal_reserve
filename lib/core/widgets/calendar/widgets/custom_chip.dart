import 'package:flutter/material.dart';

import '../../../core.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.label,
    required this.onTap,
    required this.dateTypes,
    required this.selectedType,
    this.chipStyle = ChipStyle.outlined,
    this.borderRadius = 16,
  });

  final String label;
  final Function(int) onTap;
  final List<String> dateTypes;
  final int selectedType;
  final ChipStyle chipStyle;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(dateTypes.length, (index) {
        return InkWell(
          onTap: () {
            onTap(index);
          },
          child: Chip(
            side: chipStyle == ChipStyle.outlined
                ? BorderSide(
                    color: selectedType == index
                        ? AppColors.primaryColor
                        : AppColors.grey,
                    width: 1.5,
                  )
                : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            backgroundColor: chipStyle == ChipStyle.outlined
                ? (selectedType == index
                    ? AppColors.primaryColor
                    : AppColors.grey)
                : (selectedType == index
                    ? AppColors.primaryColor
                    : AppColors.grey),
            label: Text(
              dateTypes[index],
              style: AppTextStyles.smallText.copyWith(
                color: chipStyle == ChipStyle.outlined
                    ? (selectedType == index
                        ? AppColors.primaryColor
                        : AppColors.grey)
                    : (selectedType == index
                        ? AppColors.white
                        : AppColors.grey),
              ),
            ),
          ),
        );
      }),
    );
  }
}

enum ChipStyle {
  outlined,
  filled,
}
