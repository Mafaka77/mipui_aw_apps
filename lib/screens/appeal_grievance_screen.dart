import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:mipuiaw_apps/controllers/appeal_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';

class AppealGrievanceScreen extends GetView<AppealController> {
  const AppealGrievanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: Get.height * 0.07,
                width: Get.width,
                color: Colors.yellow[100],
                padding: const EdgeInsets.all(20),
                child: Marquee(
                  text:
                      'Please Note : This option can be used to lodge appeal for the grievances which are closed during last 30 days where the feedback has been provided as "POOR" and option to file appeal was not selected.',
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
              Row(
                children: [
                  headingLine(),
                  sizedBoxWidth(10),
                  const Text('Lodge Apeal'),
                ],
              ),
              sizedBoxHeight(20),
              DropdownSearch<String>(
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Required';
                  }
                  return null;
                },
                items: (f, cs) => ["Male", 'Female'],
                // selectedItem: controller.gender.value,
                popupProps: PopupProps.menu(
                    disabledItemFn: (item) => item == 'Item 3',
                    fit: FlexFit.loose),
                decoratorProps: DropDownDecoratorProps(
                  decoration: textDecoration('Registration Number'),
                ),
                onChanged: (value) {
                  // controller.gender.value = value!;
                },
              ),
              sizedBoxHeight(10),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required field';
                  }
                  return null;
                },
                controller: controller.appealReason,
                maxLines: 6,
                maxLength: 2000,
                decoration: textDecoration('Reason for Appeal'),
              ),
              sizedBoxHeight(10),
              MaterialButton(
                elevation: 0,
                minWidth: Get.width,
                color: MyColor.green,
                onPressed: () {},
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
