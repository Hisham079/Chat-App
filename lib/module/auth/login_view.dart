import 'package:chaty/extension/padding_extension.dart';
import 'package:chaty/main.dart';
import 'package:chaty/module/auth/components/custom_icon_button.dart';
import 'package:chaty/module/auth/signup_view.dart';
import 'package:chaty/module/home/home_view.dart';
import 'package:chaty/utils/common/gradial_button.dart';
import 'package:chaty/utils/common/custom_field.dart';
import 'package:chaty/utils/common/space.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          'Login',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              themeNotifier.value = themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/images/signin_balls.png'),
            Text(
              'Sign in',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            verticalSpace(30),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Login to your Account',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ).paddingOnly(left: 10),

            const SizedBox(height: 15),
            const CustomField(hintText: 'Email'),
            const SizedBox(height: 15),
            const CustomField(hintText: 'Password'),
            const SizedBox(height: 20),
            GradientButton(
              title: 'Sign in',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  )),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupView(),
                        )),
                    child: const Text('Sign up'))
              ],
            ),
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
