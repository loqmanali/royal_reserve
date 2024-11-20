import 'package:flutter/material.dart';
import 'package:royal_reserve/core/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
      ),
      child: isLoading
          ? const CircularProgressIndicator()
          : CustomText(
              text: text,
              style: const ButtonTextStyle(),
            ),
    );
  }
}
