import 'package:chaty/utils/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  const CustomField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //  ConstrainedBox(
        //   constraints: const BoxConstraints(
        //     minWidth: 200,
        //     maxWidth: 400,
        //   ),
        TextFormField(
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
            color: AppColors.gradient2,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
      ),
    );
  }
}
