import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/grievance_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';
import 'package:mipuiaw_apps/widgets/grievance/step1_english_widget.dart';
import 'package:mipuiaw_apps/widgets/grievance/step1_mizo_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class GrievanceStep1Widget extends GetView<GrievanceController> {
  const GrievanceStep1Widget({super.key});

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
                  'Step 1',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Obx(
              () => ToggleSwitch(
                minWidth: 90.0,
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
        sizedBoxHeight(10),
        Obx(
          () => controller.isMizo.isTrue
              ? const Step1MizoWidget()
              : const Step1EnglishWidget(),
        ),
        sizedBoxHeight(10),
        Obx(
          () => MaterialButton(
            minWidth: Get.width * 0.4,
            elevation: 0,
            color: MyColor.green,
            onPressed: controller.isStep1Checked.isTrue
                ? () {
                    controller.activeStep.value = 2;
                  }
                : null,
            child: const Text('Next'),
          ),
        )
      ],
    );
  }
}
