import 'package:chaty/module/chat/chat_view.dart';
import 'package:chaty/module/home/components/chat_tile.dart';
import 'package:chaty/module/home/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          Flexible(
            child: ListView.separated(
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatView(),
                        )),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
