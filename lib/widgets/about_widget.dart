import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/home_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AboutWidget extends GetView<HomeController> {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                headingLine(),
                sizedBoxWidth(10),
                const Text(
                  'ABOUT MIPUI-AW',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Obx(
              () => ToggleSwitch(
                minWidth: 80.0,
                minHeight: 35,
                initialLabelIndex: controller.isMizo.isTrue ? 0 : 1,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                inactiveFgColor: Colors.blue,
                totalSwitches: 2,
                labels: const ['Mizo', 'English'],
                activeBgColors: [
                  [MyColor.green],
                  [MyColor.green]
                ],
                onToggle: (index) {
                  if (index == 0) {
                    controller.isMizo.value = true;
                  } else {
                    controller.isMizo.value = false;
                  }
                },
              ),
            )
          ],
        ),
        sizedBoxHeight(20),
        Obx(
          () => controller.isMizo.isTrue
              ? const Text(
                  'Mipui Aw hi online platform a ni a, mipuiten service pek kaihhnawih thupui eng'
                  ' pawhah vantlang thuneitute hnenah an lungawi lohna an thehluh theihna tur online platform a ni. '
                  ' Department tin hian he system ah hian role-based access an nei vek a ni. '
                  'Mipui Aw-a grievance thehluh dinhmun chu complainant-in registration a tih laia a pek chhuah unique registration ID '
                  'hmangin a enfiah theih a ni. Mipui Aw ah hian Grievance Officer-in thutlukna a siamah mipuite an lungawi loh chuan appeal '
                  ' facility a pe bawk. Complainant-in resolution-a a lungawi loh chuan grievance khar hnuah feedback a pe thei ang. '
                  'Rating ‘Poor’ a nih chuan appeal file theihna option chu enable a ni.')
              : const Text(
                  'Mipui Aw is an online platform where citizens can lodge complaints with public authorities on any topic related to service delivery. Each department has role-based access to this system. The status of a grievance submitted to Mipui Aw can be checked using the unique registration ID provided by the complainant at the time of registration. Mipui Aw also provides an appeal facility if people are not satisfied with the decision of the Grievance Officer. If the complainant is not satisfied with the resolution, he or she may provide feedback after the grievance is closed. If the rating is ‘Poor’, the option to file an appeal is enabled.'),
        )
      ],
    );
  }
}
