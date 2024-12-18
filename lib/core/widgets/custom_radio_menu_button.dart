import 'package:flutter/material.dart';

import '../core.dart';

class CustomRadioMenuButton extends StatelessWidget {
  const CustomRadioMenuButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.child,
    this.fillColor,
  });

  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic) onChanged;
  final Widget child;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(
            fillColor ?? AppColors.white,
          ),
        ),
      ),
      child: RadioMenuButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        child: child,
      ),
    );
  }
}
