import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/home_controller.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TutorialWidget extends GetView<HomeController> {
  const TutorialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            headingLine(),
            sizedBoxWidth(10),
            const Text(
              'Video Tutorial',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        sizedBoxHeight(10),
        YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: controller.youtubePlayerController,
            showVideoProgressIndicator: true,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
          ),
          builder: (context, player) {
            return Column(
              children: [
                player,
                // other widgets below
              ],
            );
          },
        ),
      ],
    );
  }
}
