import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/appeal_details_controller.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';
import 'package:mipuiaw_apps/widgets/appeal/appeal_answer_widget.dart';
import 'package:mipuiaw_apps/widgets/appeal/appeal_details_widget.dart';

class AppealDetailsScreen extends StatelessWidget {
  AppealDetailsScreen({super.key});
  final controller = Get.find<AppealDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.appealDetails.isEmpty
              ? const Center(child: Text('No appeal details found'))
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppealDetailsWidget(),
                        const SizedBox(height: 10),
                        AppealAnswerWidget(),
                      ],
                    ),
                  ),
                )),
    );
  }
}
