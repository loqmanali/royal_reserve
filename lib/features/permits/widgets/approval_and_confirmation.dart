import 'package:flutter/material.dart';
import 'package:royal_reserve/core/core.dart';

class ApprovalAndConfirmation extends StatefulWidget {
  const ApprovalAndConfirmation({super.key});

  @override
  State<ApprovalAndConfirmation> createState() =>
      _ApprovalAndConfirmationState();
}

class _ApprovalAndConfirmationState extends State<ApprovalAndConfirmation> {
  String? _approvalStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRadioMenuButton(
          value: 'approved',
          groupValue: _approvalStatus,
          onChanged: (value) {
            setState(() {
              _approvalStatus = value;
            });
          },
          child: Text(
            'أقر بقراءة الشروط والضوابط والعمل بها',
            style: AppTextStyles.smallText.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(150, 40),
            ),
            child: Text(
              'تسجيل',
              style: AppTextStyles.buttonText.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
