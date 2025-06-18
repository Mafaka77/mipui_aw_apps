import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/auth_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';

class RegisterScreen extends GetView<AuthController> {
  const RegisterScreen({super.key});

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
                  height: Get.height * 0.2,
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
                            letterSpacing: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      // reusableWidget.twoLine(),
                    ],
                  ),
                ),
              ],
            ),
            Form(
              key: controller.registerFormKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required';
                        }
                        return null;
                      },
                      controller: controller.fullNameText,
                      decoration: InputDecoration(
                        border: textBoxFocusBorder(),
                        enabledBorder: textBoxFocusBorder(),
                        focusedBorder: textBoxFocusBorder(),
                        labelText: 'Full Name',
                        isDense: true,
                      ),
                    ),
                    sizedBoxHeight(10),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required';
                        }
                        return null;
                      },
                      controller: controller.emailText,
                      decoration: InputDecoration(
                        border: textBoxFocusBorder(),
                        enabledBorder: textBoxFocusBorder(),
                        focusedBorder: textBoxFocusBorder(),
                        labelText: 'Email',
                        isDense: true,
                      ),
                    ),
                    sizedBoxHeight(10),
                    DropdownSearch<String>(
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'Required';
                        }
                        return null;
                      },
                      items: (f, cs) => ["Male", 'Female'],
                      selectedItem: controller.genderText.value,
                      popupProps: PopupProps.menu(
                          disabledItemFn: (item) => item == 'Item 3',
                          fit: FlexFit.loose),
                      decoratorProps: DropDownDecoratorProps(
                        decoration: InputDecoration(
                          border: textBoxFocusBorder(),
                          enabledBorder: textBoxFocusBorder(),
                          focusedBorder: textBoxFocusBorder(),
                          isDense: true,
                          hintText: 'Gender',
                          labelText: 'Gender',
                        ),
                      ),
                      onChanged: (value) {
                        controller.genderText.value = value!;
                      },
                    ),
                    sizedBoxHeight(10),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                          return 'Enter a valid 10-digit number';
                        }
                        return null;
                      },
                      maxLength: 10,
                      readOnly: true,
                      initialValue: controller.mobileText.text,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        counterText: '',
                        border: textBoxFocusBorder(),
                        enabledBorder: textBoxFocusBorder(),
                        focusedBorder: textBoxFocusBorder(),
                        labelText: 'Mobile',
                        isDense: true,
                      ),
                    ),
                    sizedBoxHeight(10),
                    DropdownSearch<String>(
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'Required';
                        }
                        return null;
                      },
                      items: (f, cs) => [
                        "Aizawl",
                        "Lunglei",
                        "Champhai",
                        "Mamit",
                        "Kolasib",
                        "Serchhip",
                        "Lawngtlai",
                        "Saiha",
                        "Saitual",
                        "Khawzawl",
                        "Hnahthial"
                      ],
                      selectedItem: controller.districtText.value,
                      popupProps: PopupProps.menu(
                          disabledItemFn: (item) => item == 'Item 3',
                          fit: FlexFit.loose),
                      decoratorProps: DropDownDecoratorProps(
                        decoration: InputDecoration(
                          border: textBoxFocusBorder(),
                          enabledBorder: textBoxFocusBorder(),
                          focusedBorder: textBoxFocusBorder(),
                          isDense: true,
                          hintText: 'District',
                          labelText: 'District',
                        ),
                      ),
                      onChanged: (value) {
                        controller.districtText.value = value!;
                      },
                    ),
                    sizedBoxHeight(10),
                    TextFormField(
                      controller: controller.addressText,
                      decoration: InputDecoration(
                        border: textBoxFocusBorder(),
                        enabledBorder: textBoxFocusBorder(),
                        focusedBorder: textBoxFocusBorder(),
                        labelText: 'Address',
                        isDense: true,
                      ),
                    ),
                    sizedBoxHeight(10),
                    Obx(
                      () => TextFormField(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter Password';
                          }
                          return null;
                        },
                        controller: controller.passwordText,
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          isDense: true,
                          border: textBoxFocusBorder(),
                          focusedBorder: textBoxFocusBorder(),
                          enabledBorder: textBoxFocusBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.isPasswordHidden.value =
                                  !controller.isPasswordHidden.value;
                              controller.update();
                            },
                            icon: controller.isPasswordHidden.isTrue
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                        ),
                      ),
                    ),
                    sizedBoxHeight(10),
                    Obx(
                      () => TextFormField(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter Password';
                          }
                          return null;
                        },
                        controller: controller.confirmPasswordText,
                        obscureText: controller.isConfirmPasswordHidden.value,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          isDense: true,
                          border: textBoxFocusBorder(),
                          focusedBorder: textBoxFocusBorder(),
                          enabledBorder: textBoxFocusBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.isConfirmPasswordHidden.value =
                                  !controller.isConfirmPasswordHidden.value;
                              controller.update();
                            },
                            icon: controller.isConfirmPasswordHidden.isTrue
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
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
                          color: MyColor.lightBlack,
                          minWidth: Get.width * 0.5,
                          onPressed: () {
                            if (controller.registerFormKey.currentState!
                                .validate()) {
                              controller.register(() {
                                showLoader(context);
                              }, (String? message) {
                                hideLoader();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    mySuccessSnackBar('Success', message!));
                              }, (String? message) {
                                hideLoader();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    myWarningSnackBar('Warning', message!));
                              });
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Register',
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
                    sizedBoxHeight(20)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
