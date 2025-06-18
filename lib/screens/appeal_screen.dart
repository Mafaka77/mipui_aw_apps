import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/appeal_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';

class AppealScreen extends StatelessWidget {
  const AppealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppealController>(
        init: AppealController(),
        builder: (controller) {
          return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              elevation: 0,
              backgroundColor: MyColor.red,
              onPressed: () {
                Get.toNamed('/appeal-grievance');
              },
              label: const Text(
                'Appeal Grievance',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }
}
