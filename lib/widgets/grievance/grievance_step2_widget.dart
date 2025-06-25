import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marquee/marquee.dart';
import 'package:mipuiaw_apps/controllers/grievance_controller.dart';
import 'package:mipuiaw_apps/models/department_model.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';

class GrievanceStep2Widget extends GetView<GrievanceController> {
  const GrievanceStep2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.grievanceFormState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                headingLine(),
                sizedBoxWidth(10),
                const Text(
                  'Step 2',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            sizedBoxHeight(10),
            Container(
              height: Get.height * 0.07,
              width: Get.width,
              color: Colors.yellow[100],
              padding: const EdgeInsets.all(20),
              child: Marquee(
                text:
                    'Note: Any grievances concerning the state government as a unified entity should be directed to the Department of Personnel and Administrative Reforms (DP&AR).',
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
            DropdownSearch<DepartmentModel>(
              validator: (value) {
                if (value == null) {
                  return 'Required';
                }
                return null;
              },
              onChanged: (value) {
                controller.departmentId.value = value!.id;
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
                  hintText: 'Department zawng rawh',
                ),
              ),
              items: (filter, loadProps) async =>
                  await controller.getDepartment(filter),
              compareFn: (item1, item2) => item1.isEqual(item2),
              popupProps: PopupPropsMultiSelection.modalBottomSheet(
                  itemBuilder: (context, item, isDisabled, isSelected) {
                    return ListTile(
                      leading: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: item.colorcode == 'green'
                              ? Colors.green
                              : Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      title: Text(item.label ?? ''), // Adjust as needed
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
              controller: controller.grievanceText,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required';
                }
                return null;
              },
              maxLength: 60000,
              decoration: textDecoration(
                  'Text of Grievance/ Vuivaina thu (Max: 60,000 characters)'),
              maxLines: 5,
            ),
            sizedBoxHeight(10),
            Obx(
              () => TextFormField(
                onTap: () => openPickerModal(context),
                controller: controller.attachmentName,
                readOnly: true,
                decoration: InputDecoration(
                  isDense: true,
                  border: textBoxFocusBorder(),
                  focusedBorder: textBoxFocusBorder(),
                  enabledBorder: textBoxFocusBorder(),
                  labelText: 'Attachment(Optional)',
                  suffixIcon: controller.isAttachment.isTrue
                      ? IconButton(
                          onPressed: () {
                            controller.attachment = XFile('');
                            controller.attachmentName.clear();
                            controller.isAttachment.value = false;
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : const Icon(Icons.attach_file),
                ),
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
              items: (f, cs) => ["Low", 'Medium', 'High Priority', 'Urgent'],
              // selectedItem: controller.gender.value,
              popupProps: PopupProps.menu(
                  disabledItemFn: (item) => item == 'Item 3',
                  fit: FlexFit.loose),
              decoratorProps: DropDownDecoratorProps(
                decoration: textDecoration('Priority'),
              ),
              onChanged: (value) {
                controller.priority.value = value!;
              },
            ),
            sizedBoxHeight(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Checkbox(
                    value: controller.isStep2Checked.value,
                    onChanged: (value) {
                      controller.isStep2Checked.value = value ?? false;
                    },
                  ),
                ),
                const Expanded(
                  child: Text(
                      'I agree to the rules and regulations of Mipui Aw, DP&AR Govt. of Mizoram'),
                ),
              ],
            ),
            sizedBoxHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  minWidth: Get.width * 0.4,
                  elevation: 0,
                  color: MyColor.white,
                  onPressed: () {
                    controller.activeStep.value = 1;
                  },
                  child: const Text(
                    'BACK',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Obx(
                  () => MaterialButton(
                    elevation: 0,
                    color: MyColor.green,
                    minWidth: Get.width * 0.5,
                    onPressed: controller.isStep2Checked.isTrue
                        ? () {
                            if (controller.grievanceFormState.currentState!
                                .validate()) {
                              controller.submitGrievance(() {
                                showLoader(context);
                              }, (String message) {
                                controller.getAllGrievance();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    mySuccessSnackBar('Success', message));
                                Get.back();
                                hideLoader();
                              }, (String message) {
                                hideLoader();
                              });
                            }
                          }
                        : null,
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void openPickerModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return SizedBox(
            height: Get.height * 0.15,
            width: Get.width,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              children: [
                InkWell(
                  onTap: () {
                    openGallery();
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_rounded),
                      Text('Gallery'),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    openCamera();
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.camera_alt_outlined), Text('Camera')],
                  ),
                ),
                InkWell(
                  onTap: () {
                    openFile();
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.file_copy_outlined), Text('File')],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void openGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (image != null) {
      controller.attachment = image;
      controller.attachmentName.text = image.name;
      controller.isAttachment.value = true;
      Get.back();
    } else {}
  }

  void openCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      controller.attachment = image;
      controller.attachmentName.text = image.name;
      controller.isAttachment.value = true;
      Get.back();
    }
  }

  void openFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: [
      'pdf',
    ]);

    if (result != null) {
      XFile file = XFile(result.files.single.path!);
      controller.attachment = file;
      controller.attachmentName.text = file.name;
      controller.isAttachment.value = true;
      Get.back();
    } else {
      // User canceled the picker
    }
  }
}
