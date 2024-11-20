import 'package:flutter/material.dart';
import 'package:royal_reserve/core/widgets/custom_text.dart';

import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_styles.dart';
import '../../../../core/widgets/logo_with_text.dart';
import '../../../splash/widgets/background_image.dart';
import '../widgets/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWithText(),
            const SizedBox(height: 25),
            const CustomText(
              text: 'التسجيل',
              style: Heading1Style(),
            ),
            const SizedBox(height: 35),
            const SignInForm(),
            const SizedBox(height: 35),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'ليس لديك حساب؟ ',
                    style: AppTextStyles.instance.bodyText.copyWith(
                      color: AppColors.disabledColor,
                    ),
                  ),
                  TextSpan(
                    text: 'حساب جديد',
                    style: AppTextStyles.instance.bodyText.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
