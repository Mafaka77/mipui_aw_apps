import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/auth_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';

class RegisterOtpScreen extends GetView<AuthController> {
  const RegisterOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.elliptical(400, 140)),
                    color: MyColor.red,
                  ),
                  height: Get.height * 0.25,
                ),
                const Positioned(
                  bottom: 30,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            letterSpacing: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      // reusableWidget.twoLine(),
                    ],
                  ),
                ),
              ],
            ),
            Form(
              key: controller.registerOtpFormKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Obx(
                      () => TextFormField(
                        readOnly: controller.isOtpSent.isTrue ? true : false,
                        controller: controller.mobileText,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter valid email/phone';
                          }
                          return null;
                        },
                        decoration: textDecoration('Enter Valid Phone No'),
                      ),
                    ),
                    Obx(() => controller.isOtpSent.isTrue
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  controller.isOtpSent.value = false;
                                  controller.mobileText.clear();
                                  controller.otpText.clear();
                                },
                                child: const Text('Reset'),
                              ),
                            ],
                          )
                        : Container()),
                    sizedBoxHeight(10),
                    Obx(
                      () => controller.isOtpSent.isTrue
                          ? TextFormField(
                              maxLength: 6,
                              controller: controller.otpText,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter OTP';
                                }
                                return null;
                              },
                              decoration: textDecoration('Enter OTP'),
                            )
                          : Container(),
                    ),
                    sizedBoxHeight(20),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            height: Get.height * 0.06,
                            elevation: 0,
                            color: MyColor.green,
                            minWidth: Get.width * 0.5,
                            onPressed: () {
                              controller.isOtpSent.isTrue
                                  ? verifyOtp(context)
                                  : sentOtp(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                controller.isOtpSent.isTrue
                                    ? const Text(
                                        'Verify OTP',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )
                                    : const Text(
                                        'Send OTP',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                const SizedBox(
                                  width: 50,
                                ),
                                const Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBoxHeight(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  verifyOtp(BuildContext context) {
    if (controller.registerOtpFormKey.currentState!.validate()) {
      controller.verifyOtp(
        () {
          showLoader(context);
        },
        (String message) {
          hideLoader();
          ScaffoldMessenger.of(context)
              .showSnackBar(mySuccessSnackBar('Success', message));
          Get.toNamed('/register');
        },
        (String message) {
          hideLoader();
          ScaffoldMessenger.of(context)
              .showSnackBar(myWarningSnackBar('Warning', message));
        },
      );
    }
  }

  sentOtp(BuildContext context) async {
    if (controller.registerOtpFormKey.currentState!.validate()) {
      controller.sendOtp(
        () {
          showLoader(context);
        },
        (String message) {
          hideLoader();
          ScaffoldMessenger.of(context)
              .showSnackBar(mySuccessSnackBar('Success', message));
          controller.isOtpSent.value = true;
        },
        (String message) {
          hideLoader();
          ScaffoldMessenger.of(context)
              .showSnackBar(myWarningSnackBar('Warning', message));
        },
      );
    }
  }
}
