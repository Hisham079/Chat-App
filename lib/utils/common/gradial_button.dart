import 'package:chaty/utils/common/app_colors.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  GradientButton({Key? key, required this.title, this.onPressed})
      : super(key: key);
  String title;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blueColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: Theme.of(context).primaryColorLight),
        ),
      ),
    );
  }
}
