import 'package:chaty/extension/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:chaty/utils/common/app_colors.dart';
import 'package:chaty/utils/common/app_text_style.dart';
import 'package:chaty/utils/common/space.dart';

class ChatTile extends StatelessWidget {
  ChatTile({super.key, this.onTap});
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.whiteColor,
                child: Icon(Icons.person),
              ),
              horizontalSpace(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Ayesha Pawar',
                    style: AppTextStyle.popin15W400
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  Text(
                    'Best one there is',
                    style: AppTextStyle.popin11W500
                        .copyWith(color: AppColors.greyColor),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Yesterday',
                style: AppTextStyle.nunito13w400
                    .copyWith(color: AppColors.greyColor),
              ),
              const CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.blueColor,
                child: Text(
                  '1',
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 13),
                ),
              )
            ],
          )
        ],
      ).paddingAll(10),
    );
  }
}
