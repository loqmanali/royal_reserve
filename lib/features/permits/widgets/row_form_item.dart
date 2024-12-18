import 'package:flutter/material.dart';
import 'package:royal_reserve/core/core.dart';

class RowFormItem extends StatelessWidget {
  const RowFormItem({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFieldComponentWithLabel(
        labelName: label,
        labelColor: AppColors.white,
        formField: const TextFieldComponent(
          keyName: 'beneficiaryName',
          hintText: '',
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
