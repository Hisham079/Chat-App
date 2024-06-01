import 'package:chaty/extension/padding_extension.dart';
import 'package:chaty/main.dart';
import 'package:chaty/module/auth/components/custom_icon_button.dart';
import 'package:chaty/module/auth/signup_view.dart';
import 'package:chaty/module/home/home_view.dart';

import 'package:chaty/services/auth_repository/auth_repository.dart';
import 'package:chaty/utils/common/gradial_button.dart';
import 'package:chaty/utils/common/custom_field.dart';
import 'package:chaty/utils/common/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerWidget {
  LoginView({super.key});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authenticationProvider);
    ref.listen(authenticationProvider, (previous, next) {
      if (next == AuthenticationState.success) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomeView(),
        ));
      } else if (next == AuthenticationState.error) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                  ref.read(authenticationProvider.notifier).errorMessage ??
                      'An unknown error occurred',
                  style: TextStyle(color: Colors.black))),
        );
      }
    });

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            verticalSpace(30),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Login to your Account',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ).paddingOnly(left: 10),

            verticalSpace(15),
            CustomField(controller: _emailController, hintText: 'Email'),
            verticalSpace(15),
            CustomField(controller: _passwordController, hintText: 'Password'),
            verticalSpace(20),
            GradientButton(
                title: authState == AuthenticationState.loading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        'Sign in',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Theme.of(context).primaryColorLight),
                      ),
                onPressed: () {
                  // to call the "addTodo" method.
                  ref
                      .read(authenticationProvider.notifier)
                      .login(_emailController.text, _passwordController.text);
                  // ref.read(authenticationProvider(
                  //     _emailController.text, _passwordController.text).);
                }),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignupView(),
                      ));
                    },
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
