import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:mipuiaw_apps/controllers/home_controller.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';
import 'package:mipuiaw_apps/widgets/about_widget.dart';
import 'package:mipuiaw_apps/widgets/carousel_widget.dart';
import 'package:mipuiaw_apps/widgets/designed_by_widget.dart';
import 'package:mipuiaw_apps/widgets/tutorial_widget.dart';
import 'package:mipuiaw_apps/widgets/user_manual_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CarouselWidget(),
                    sizedBoxHeight(10),
                    Container(
                      height: Get.height * 0.07,
                      width: Get.width,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(20),
                      child: Marquee(
                        text:
                            'Any Grievance sent by email will not be attended to / entertained. Please lodge your grievance at the website.',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        blankSpace: 20.0,
                        velocity: 50.0,
                        pauseAfterRound: const Duration(seconds: 1),
                        startPadding: 10.0,
                        accelerationDuration: const Duration(seconds: 1),
                        accelerationCurve: Curves.linear,
                        decelerationDuration: const Duration(milliseconds: 500),
                        decelerationCurve: Curves.easeOut,
                      ),
                    ),
                    sizedBoxHeight(10),
                    // const TutorialWidget(),
                    const AboutWidget(),
                    sizedBoxHeight(10),
                    const UserManualWidget(),
                    sizedBoxHeight(20),
                    const Image(
                        image: AssetImage('images/mipuiaw_helpline.png')),
                    sizedBoxHeight(40),
                    const DevelopedByWidget(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
