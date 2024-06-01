import 'package:chaty/extension/padding_extension.dart';
import 'package:chaty/module/auth/components/custom_icon_button.dart';
import 'package:chaty/module/auth/otp_view.dart';
import 'package:chaty/services/register_repository/register_repository.dart';
import 'package:chaty/utils/common/app_colors.dart';
import 'package:chaty/utils/common/app_text_style.dart';
import 'package:chaty/utils/common/gradial_button.dart';
import 'package:chaty/utils/common/custom_field.dart';
import 'package:chaty/utils/common/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupView extends ConsumerWidget {
  SignupView({super.key});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _roleController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(registerProvider);
    ref.listen(
      registerProvider,
      (previous, next) {
        if (next == RegisterState.success) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  OtpView(),
          ));
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Success')));
        } else if (next == RegisterState.error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(ref.read(registerProvider.notifier).errorMessage)));
        }
      },
    );
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/images/signin_balls.png'),
            Text(
              'Sign up',
              style: Theme.of(context).textTheme.bodyLarge,
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
            CustomField(
              hintText: 'Email',
              controller: _emailController,
            ),
            const SizedBox(height: 15),
            CustomField(
              hintText: 'Username',
              controller: _usernameController,
            ),
            const SizedBox(height: 15),
            CustomField(
              hintText: 'Password',
              controller: _passwordController,
            ),
            const SizedBox(height: 15),
            CustomField(
              hintText: 'Full name',
              controller: _fullnameController,
            ),
            const SizedBox(height: 15),
            CustomField(
              hintText: 'Role',
              controller: _roleController,
            ),
            const SizedBox(height: 20),
            GradientButton(
              title: Text(
                'Sign up',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Theme.of(context).primaryColorLight),
              ),
              onPressed: () => ref.read(registerProvider.notifier).register(
                  _emailController.text,
                  _usernameController.text,
                  _passwordController.text,
                  _fullnameController.text,
                  _roleController.text),
            ),
            const SizedBox(height: 20),

            const Text('- Or sign in with -'),
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
        ).paddingSymmetric(horizontal: 20)),
      ),
    );
  }
}
