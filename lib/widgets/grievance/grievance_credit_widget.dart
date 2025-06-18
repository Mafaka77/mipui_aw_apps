import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/grievance_controller.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';

class GrievanceCreditWidget extends GetView<GrievanceController> {
  const GrievanceCreditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'You can sent a maximum of ${controller.credit['monthlyLimit']} per month'),
              sizedBoxHeight(10),
              Text('Total Sent : ${controller.credit['grievanceCount']}'),
              sizedBoxHeight(10),
              Text('Remaining Credit : ${controller.credit['credit']}')
            ],
          ),
        ),
      ),
    );
  }
}
