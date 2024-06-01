import 'package:chaty/extension/padding_extension.dart';
import 'package:chaty/module/auth/login_view.dart';
import 'package:chaty/services/otp_repository/otp_repository.dart';
import 'package:chaty/utils/common/app_colors.dart';
import 'package:chaty/utils/common/custom_field.dart';
import 'package:chaty/utils/common/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpView extends ConsumerWidget {
  OtpView({super.key});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpState = ref.watch(otpVerifyProvider);
    ref.listen(
      otpVerifyProvider,
      (previous, next) {
        if (next == OtpVerifyState.success) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LoginView(),
          ));
        } else if (next == OtpVerifyState.error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  Text(ref.read(otpVerifyProvider.notifier).errorMessage)));
        }
      },
    );
    return Scaffold(
      backgroundColor: AppColors.blueColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Verification Code',
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              verticalSpace(15),
              const Text(
                'Please type the verification code sent to *XXXXXXX@gmail.com',
                style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              verticalSpace(10),
              // CustomField(
              //   hintText: 'Email',
              //   controller: _emailController,
              // ).paddingSymmetric(horizontal: 35),
              // verticalSpace(15),
              OtpTextField(
                  fieldWidth: 20,
                  styles: const [
                    TextStyle(color: AppColors.whiteColor),
                    TextStyle(color: AppColors.whiteColor),
                    TextStyle(color: AppColors.whiteColor),
                    TextStyle(color: AppColors.whiteColor),
                    TextStyle(color: AppColors.whiteColor),
                    TextStyle(color: AppColors.whiteColor),
                  ],
                  handleControllers: (controllers) => _otpController,
                  mainAxisAlignment: MainAxisAlignment.center,
                  numberOfFields: 6,
                  // fillColor: Colors.white,
                  // filled: true,
                  onSubmit: (code) {
                    print("OTP is => $code");
                  }),
              verticalSpace(15),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(otpVerifyProvider.notifier)
                      .otpVerify(_emailController.text, _otpController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.whiteColor,
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(color: AppColors.blueColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
