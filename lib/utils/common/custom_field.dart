import 'package:chaty/utils/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  TextEditingController? controller;
  CustomField({Key? key, required this.hintText, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //  ConstrainedBox(
        //   constraints: const BoxConstraints(
        //     minWidth: 200,
        //     maxWidth: 400,
        //   ),
        TextFormField(
      controller: controller,
      style: TextStyle(color: AppColors.whiteColor),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.greyColor,
              // width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.whiteColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.whiteColor)),
    );
  }
}
