import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:mipuiaw_apps/controllers/appeal_controller.dart';
import 'package:mipuiaw_apps/models/appeal_registration_model.dart';
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
              DropdownSearch<AppealRegistrationModel>(
                validator: (value) {
                  if (value == null) {
                    return 'Required';
                  }
                  return null;
                },
                onChanged: (value) {
                  // controller.departmentId.value = value!.id;
                  // controller.departmentId.value = value == null ? 0 : value.id;
                },
                suffixProps: DropdownSuffixProps(
                  clearButtonProps: const ClearButtonProps(
                    isSelected: true,
                    icon: Icon(
                      Icons.clear,
                    ),
                    isVisible: true,
                  ),
                  dropdownButtonProps: DropdownButtonProps(
                    iconClosed: Icon(
                      Icons.search,
                      color: MyColor.green,
                    ),
                    iconOpened: Icon(
                      Icons.search,
                      color: MyColor.green,
                    ),
                  ),
                ),
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    isDense: true,
                    border: textBoxFocusBorder(),
                    focusedBorder: textBoxFocusBorder(),
                    enabledBorder: textBoxFocusBorder(),
                    hintText: 'Select Registration Number',
                  ),
                ),
                items: (filter, loadProps) async =>
                    await controller.getAppealRegistration(filter),
                compareFn: (item1, item2) => item1.isEqual(item2),
                popupProps: PopupPropsMultiSelection.modalBottomSheet(
                    itemBuilder: (context, item, isDisabled, isSelected) {
                      return ListTile(
                        title: Text(
                            item.registration_number ?? ''), // Adjust as needed
                      );
                    },
                    showSelectedItems: true,
                    showSearchBox: true,
                    listViewProps: const ListViewProps(
                      padding: EdgeInsets.all(20),
                    ),
                    searchFieldProps: TextFieldProps(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      decoration: InputDecoration(
                        isDense: true,
                        border: textBoxFocusBorder(),
                        enabledBorder: textBoxFocusBorder(),
                        focusedBorder: textBoxFocusBorder(),
                        hintText: 'Search',
                        suffixIcon: const Icon(Icons.search),
                      ),
                    )
                    // itemBuilder: userModelPopupItem,
                    ),
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
