import 'package:flutter/material.dart';

import '../core.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.isLoading = false,
    this.isDisabled = false,
    this.onPressed,
    required this.label,
    this.labelColor,
    this.backgroundColor,
  });

  final bool isLoading;
  final bool isDisabled;
  final Function()? onPressed;
  final String label;
  final Color? labelColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryContainer,
          minimumSize: const Size(0, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                label,
                style: AppTextStyles.bodyText.copyWith(
                  color: labelColor ?? AppColors.white,
                ),
              ),
      ),
    );
  }
}
