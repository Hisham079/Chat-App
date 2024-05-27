import 'package:chaty/extension/padding_extension.dart';
import 'package:chaty/utils/common/app_colors.dart';
import 'package:chaty/utils/common/app_text_style.dart';
import 'package:chaty/utils/common/space.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: AppColors.blueColor,
      child: Column(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Chaty', style: AppTextStyle.popin20W500),
                Row(
                  children: [
                    const Icon(Icons.search),
                    horizontalSpace(10),
                    const Icon(Icons.more_vert),
                  ],
                )
              ],
            ).paddingAll(15),
          ),
          Align(
                  alignment: Alignment.topLeft,
                  child: Text('Message', style: AppTextStyle.popin20W500))
              .paddingOnly(left: 15),
        ],
      ),
    );
  }
}
