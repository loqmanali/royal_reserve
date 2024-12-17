import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reserve/core/extensions/animation_extension.dart';
import 'package:royal_reserve/core/style/app_colors.dart';
import 'package:royal_reserve/core/widgets/custom_button.dart';
import 'package:royal_reserve/core/widgets/custom_text.dart';
import 'package:royal_reserve/core/widgets/text_field_component.dart';

import '../../../../core/widgets/gap.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          const TextFieldComponentWithLabel(
            labelName: 'البريد الإلكتروني',
            labelColor: AppColors.white,
            formField: TextFieldComponent(
              keyName: 'email',
              hintText: 'ادخل بريدك الإلكتروني',
              hintColor: AppColors.white,
              backgroundColor: Colors.transparent,
            ),
          ).animatedWidget(delay: 500.ms),
          const Gap(18),
          const TextFieldComponentWithLabel(
            labelName: 'كلمة المرور',
            labelColor: AppColors.white,
            formField: TextFieldComponent(
              keyName: 'password',
              hintText: 'ادخل كلمة المرور',
              hintColor: AppColors.white,
              backgroundColor: Colors.transparent,
              suffixIcon: Icon(
                Icons.remove_red_eye_outlined,
                color: AppColors.white,
              ),
            ),
          ).animatedWidget(delay: 600.ms),
          const Gap(20),
          const Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: 'نسيت كلمة المرور؟',
              style: BodyTextStyle(
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ),
          ).animatedWidget(delay: 700.ms),
          const Gap(35),
          CustomButton(
            label: 'تسجيل الدخول',
            onPressed: () {
              context.pushReplacementNamed('/home');
            },
          ).animatedWidget(
            delay: 800.ms,
          ),
        ],
      ),
    );
  }
}
