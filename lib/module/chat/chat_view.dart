import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
import 'package:chaty/module/chat/components/custom_app_bar.dart';
import 'package:chaty/utils/common/app_colors.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        body: Column(
          children: [
            // BubbleNormalAudio(
            //   color: Color(0xFFE8E8EE),
            //   duration: duration.inSeconds.toDouble(),
            //   position: position.inSeconds.toDouble(),
            //   isPlaying: isPlaying,
            //   isLoading: isLoading,
            //   isPause: isPause,
            //   onSeekChanged: _changeSeek,
            //   onPlayPauseButtonClick: _playAudio,
            //   sent: true,
            // ),
            BubbleNormal(
              text: 'Hey!',
              isSender: false,
              color: AppColors.chatGrey,
              tail: true,
              textStyle: const TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            BubbleNormalImage(
              id: 'id001',
              image: Image.asset('assets/images/signin_balls.png'),
              color: AppColors.chatGrey,
              tail: true,
              delivered: true,
            ),
            BubbleNormal(
              text: 'bubble normal with tail',
              isSender: true,
              color: AppColors.chatGrey,
              tail: true,
              sent: true,
              textStyle: const TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}
