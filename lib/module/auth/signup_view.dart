import 'package:chaty/extension/padding_extension.dart';
import 'package:chaty/module/auth/components/custom_icon_button.dart';
import 'package:chaty/utils/common/app_colors.dart';
import 'package:chaty/utils/common/app_text_style.dart';
import 'package:chaty/utils/common/gradial_button.dart';
import 'package:chaty/utils/common/custom_field.dart';
import 'package:chaty/utils/common/space.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/images/signin_balls.png'),
              const Text(
                'Sign up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              verticalSpace(30),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Create your Account',
                  style: AppTextStyle.popin15W400
                      .copyWith(color: AppColors.whiteColor),
                ),
              ).paddingOnly(left: 10),

              const SizedBox(height: 15),
              const CustomField(hintText: 'Email'),
              const SizedBox(height: 15),
              const CustomField(hintText: 'Username'),
              const SizedBox(height: 15),
              const CustomField(hintText: 'Password'),
              const SizedBox(height: 20),
              GradientButton(title: 'Sign up'),
              const SizedBox(height: 20),

              Text('- Or sign in with -'),
              verticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    iconPath: 'assets/svgs/g_logo.svg',
                  ),
                  horizontalSpace(20),
                  CustomIconButton(
                    iconPath: 'assets/svgs/f_logo.svg',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
