  import 'package:chaty/utils/common/app_text_style.dart';
import 'package:chaty/utils/common/space.dart';
import 'package:flutter/material.dart';

AppBar customAppBar() {
    return AppBar(
      leadingWidth: 30,
      title: Row(
        children: [
          CircleAvatar(
            child: Icon(Icons.person),
          ),
          horizontalSpace(10),
          Text('Ayesha Pawar', style: AppTextStyle.popin20W500),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.videocam_outlined),
          iconSize: 30,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.call_outlined,
          ),
          iconSize: 27,
        )
      ],
    );
  }
