import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/profile_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';

class MyProfileScreen extends GetView<ProfileController> {
  const MyProfileScreen({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingLine(),
                  sizedBoxWidth(10),
                  const Text(
                    'My Profile',
                  ),
                ],
              ),
              sizedBoxHeight(20),
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
                              // if (controller.registerFormKey.currentState!
                              //     .validate()) {
                              //   controller.register(() {
                              //     showLoader(context);
                              //   }, (String? message) {
                              //     hideLoader();
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //         mySuccessSnackBar('Success', message!));
                              //   }, (String? message) {
                              //     hideLoader();
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //         myWarningSnackBar('Warning', message!));
                              //   });
                              // }
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Update',
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
      ),
    );
  }
}
