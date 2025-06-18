import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/grievance_controller.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';
import 'package:mipuiaw_apps/widgets/grievance/grievance_credit_widget.dart';
import 'package:mipuiaw_apps/widgets/grievance/grievance_step1_widget.dart';
import 'package:mipuiaw_apps/widgets/grievance/grievance_step2_widget.dart';

class LodgeGrievanceScreen extends GetView<GrievanceController> {
  const LodgeGrievanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => controller.activeStep.value == 1
                    ? const GrievanceCreditWidget()
                    : Container(),
              ),
              sizedBoxHeight(20),
              Obx(
                () => controller.activeStep.value == 1
                    ? const GrievanceStep1Widget()
                    : const GrievanceStep2Widget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
