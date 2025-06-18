import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/grievance_controller.dart';

class Step1EnglishWidget extends GetView<GrievanceController> {
  const Step1EnglishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'List of subjects/topics which can not be treated as grievance.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text('-> RTI Matters'),
        const Text('-> Court related / Subjudice matters'),
        const Text('-> Religious matters'),
        const Text('-> Suggestions'),
        const Text(
          '-> Grievances of Government employees concerning their service matters including disciplinary proceedings etc. unless the aggrieved employee has already exhausted the prescribed channels keeping in view the DoPT OM No. 11013/08/2013-Estt.(A-III) dated 31.08.2015.',
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Checkbox(
                value: controller.isStep1Checked.value,
                onChanged: (value) {
                  controller.isStep1Checked.value = value ?? false;
                },
              ),
            ),
            const Expanded(
              child: Text(
                  ' I agree that my grievance does not fall in any of the above listed categories'),
            ),
          ],
        )
      ],
    );
  }
}
