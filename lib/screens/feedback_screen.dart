import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/profile_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';

class FeedbackScreen extends GetView<ProfileController> {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.limeGreen,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  headingLine(),
                  sizedBoxWidth(10),
                  const Text('Feedback'),
                ],
              ),
              sizedBoxHeight(20),
              TextFormField(
                readOnly: true,
                decoration: textDecoration('Name'),
              ),
              sizedBoxHeight(10),
              TextFormField(
                readOnly: true,
                decoration: textDecoration('Email'),
              ),
              sizedBoxHeight(10),
              TextFormField(
                readOnly: true,
                decoration: textDecoration('Phone'),
              ),
              sizedBoxHeight(10),
              TextFormField(
                decoration: textDecoration('Subject'),
              ),
              sizedBoxHeight(10),
              TextFormField(
                maxLines: 6,
                maxLength: 2000,
                decoration: textDecoration('Feedback'),
              ),
              sizedBoxHeight(20),
              MaterialButton(
                elevation: 0,
                minWidth: Get.width,
                color: MyColor.green,
                onPressed: () {},
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
