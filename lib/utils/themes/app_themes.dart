import 'package:chaty/utils/common/app_colors.dart';
import 'package:chaty/utils/common/app_text_style.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primeryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    textTheme: const TextTheme(
        bodyText1: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 50,color:AppColors.blueColor),
        bodyText2: TextStyle(color: Colors.black87),
        headline6: TextStyle(color: Colors.black, fontSize: 20),
        subtitle1: TextStyle(color: Colors.black)),
    buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primeryColor,
        textTheme: ButtonTextTheme.primary),
    appBarTheme:  AppBarTheme(
      color: AppColors.primeryColor,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: AppTextStyle.nunito12w400
    ),
  );
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor:
        AppColors.primeryColor, // Define your primary color in AppColors
    scaffoldBackgroundColor: Colors.black,
    primaryColorLight: Colors.white,
    textTheme: TextTheme(
        bodyText1: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 50,color: Colors.white),
        bodyText2: TextStyle(color: Colors.white70),
        headline6: TextStyle(color: Colors.white, fontSize: 20),
        subtitle1: TextStyle(color: Colors.white)),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.primary,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      // textTheme: TextTheme(
      //   headline6: TextStyle(color: Colors.white, fontSize: 20),
      // ),
    ),
  );
}
