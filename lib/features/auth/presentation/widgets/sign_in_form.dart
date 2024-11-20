import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:royal_reserve/core/extensions/animation_extension.dart';
import 'package:royal_reserve/core/widgets/custom_button.dart';
import 'package:royal_reserve/core/widgets/custom_text.dart';
import 'package:royal_reserve/core/widgets/text_field_component.dart';

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
            formField: TextFieldComponent(
              keyName: 'email',
              hintText: 'ادخل بريدك الإلكتروني',
            ),
          ).animatedWidget(delay: 500.ms),
          const SizedBox(height: 20),
          const TextFieldComponentWithLabel(
            labelName: 'كلمة المرور',
            formField: TextFieldComponent(
              keyName: 'password',
              hintText: 'ادخل كلمة المرور',
              suffixIcon: Icon(Icons.remove_red_eye_outlined),
            ),
          ).animatedWidget(delay: 600.ms),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: 'نسيت كلمة المرور؟',
              style: BodyTextStyle(),
            ),
          ).animatedWidget(delay: 700.ms),
          const SizedBox(height: 35),
          CustomButton(
            text: 'تسجيل الدخول',
            onPressed: () {},
          ).animatedWidget(
            delay: 800.ms,
          ),
        ],
      ),
    );
  }
}
