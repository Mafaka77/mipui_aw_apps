import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/auth_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Scaffold(
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
                        height: Get.height * 0.35,
                      ),
                      const Positioned(
                        bottom: 30,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LOGIN',
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
                    key: controller.loginFormKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.loginText,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter valid email/phone';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                enabledBorder: textBoxFocusBorder(),
                                focusedBorder: textBoxFocusBorder(),
                                border: textBoxFocusBorder(),
                                isDense: true,
                                labelText: 'Enter Email'),
                          ),
                          sizedBoxHeight(10),
                          Obx(
                            () => TextFormField(
                              controller: controller.loginPasswordText,
                              obscureText:
                                  controller.isLoginPasswordHidden.value,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                isDense: true,
                                border: textBoxFocusBorder(),
                                enabledBorder: textBoxFocusBorder(),
                                focusedBorder: textBoxFocusBorder(),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.isLoginPasswordHidden.value =
                                        !controller.isLoginPasswordHidden.value;
                                  },
                                  icon: Icon(
                                    controller.isLoginPasswordHidden.isTrue
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          sizedBoxHeight(20),
                          Row(
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
                                  if (controller.loginFormKey.currentState!
                                      .validate()) {
                                    controller.login(() {
                                      showLoader(context);
                                    }, (String? message) {
                                      hideLoader();
                                      Get.offAllNamed('/');
                                    }, (String? message) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(myWarningSnackBar(
                                              'Warning', message!));
                                      hideLoader();
                                    });
                                  }
                                },
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          sizedBoxHeight(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.toNamed('/forgot-password-otp-screen');
                                },
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text("Don't have an account?"),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed('/register-otp');
                                },
                                child: const Text('Register'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
