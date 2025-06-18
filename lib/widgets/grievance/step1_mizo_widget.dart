import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/grievance_controller.dart';

class Step1MizoWidget extends GetView<GrievanceController> {
  const Step1MizoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'A hnuaia mi ho hi Vuivaina anga ngiah theih loh ho.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text('-> RTI lam'),
        const Text('-> Court lam thil'),
        const Text('-> Sakhuana lam'),
        const Text('-> Mimal ngaihdan'),
        const Text(
          '-> Lungawilohna nei Sawrkar hnathawk te chuan a ruat channel DoPT OM No. 11013/08/2013-Estt.(A-III) dated 31.08.2015 ngaihtuah reng chungin a hman zawh tawh loh chuan Sawrkar hnathawk te Vuivaina, rawngbawlna chungchangah, disciplinary proceedings etc. te telin.',
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
                  'Ka vuina hi a chunga tarlan zingah hian a tel lo tih hi ka pawm a ni'),
            ),
          ],
        )
      ],
    );
  }
}
