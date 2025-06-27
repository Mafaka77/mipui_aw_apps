import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mipuiaw_apps/controllers/grievance_controller.dart';
import 'package:mipuiaw_apps/controllers/grievance_details_controller.dart';
import 'package:mipuiaw_apps/main.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/list_loader.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';
import 'package:mipuiaw_apps/routes.dart';
import 'package:mipuiaw_apps/services/base_services.dart';
import 'package:mipuiaw_apps/widgets/grievance_details/grievance_details_widget.dart';
import 'package:mipuiaw_apps/widgets/grievance_details/grievance_feedback_widget.dart';
import 'package:mipuiaw_apps/widgets/grievance_details/grievance_movement_widget.dart';
import 'package:mipuiaw_apps/widgets/grievance_details/grievance_officer_detail_widget.dart';
import 'package:mipuiaw_apps/widgets/grievance_details/grievance_reply_widget.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class GrievanceDetailsScreen extends StatelessWidget {
  GrievanceDetailsScreen({super.key});
  final controller = Get.find<GrievanceDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: SingleChildScrollView(
          child: Obx(
        () => controller.isLoading.isTrue
            ? const Center(
                child: ShimmerListLoader(),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Card(
                            color: Colors.white,
                            elevation: 0,
                            child: GrievanceDetailsWidget(),
                          ),
                          Obx(
                            () => controller.grievanceDetails['final_remark'] !=
                                    null
                                ? const Card(
                                    color: Colors.white,
                                    elevation: 0,
                                    child: GrievanceReplyWidget(),
                                  )
                                : Container(),
                          ),
                          Obx(
                            () => controller.grievanceDetails['officer_id'] !=
                                    null
                                ? const Card(
                                    color: Colors.white,
                                    elevation: 0,
                                    child: GrievanceOfficerDetailWidget(),
                                  )
                                : Container(),
                          ),
                          Obx(() => controller
                                      .grievanceDetails['applicant_feedback'] !=
                                  null
                              ? const Card(
                                  color: Colors.white,
                                  elevation: 0,
                                  child: GrievanceFeedbackWidget(),
                                )
                              : Container()),
                          Obx(
                            () => controller.grievanceDetails[
                                        'grievance_movement'] ==
                                    []
                                ? Container()
                                : const Card(
                                    color: Colors.white,
                                    elevation: 0,
                                    child: GrievanceMovementWidget(),
                                  ),
                          ),
                          sizedBoxHeight(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              MaterialButton(
                                elevation: 0,
                                color: MyColor.red,
                                minWidth: Get.width * 0.4,
                                onPressed: () {
                                  downloadFile(
                                      context,
                                      Routes.PRINT_GRIEVANCE(
                                          controller.grievanceDetails['id']),
                                      controller.grievanceDetails[
                                              'registration_number'] +
                                          '.pdf');
                                },
                                child: Text(
                                  'PRINT',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              sizedBoxWidth(20),
                              controller.grievanceDetails[
                                          'applicant_feedback'] ==
                                      null
                                  ? MaterialButton(
                                      elevation: 0,
                                      color: Colors.amber,
                                      minWidth: Get.width * 0.4,
                                      onPressed: () {
                                        openFeedbackDialog(
                                          context,
                                          controller.grievanceDetails['id'],
                                          controller.grievanceDetails[
                                              'registration_number'],
                                        );
                                      },
                                      child: Text(
                                        'FEEDBACK',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  : Container(),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
      )),
    );
  }

  void openFeedbackDialog(
      BuildContext context, grievanceDetail, grievanceDetail2) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'How satisfied are you?',
              style: TextStyle(fontSize: 12),
            ),
            content: SizedBox(
              height: Get.height * 0.4,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: grievanceDetail2,
                    decoration: textDecoration('Registration No'),
                    readOnly: true,
                  ),
                  const SizedBox(height: 10),
                  DropdownSearch<String>(
                    validator: (value) {
                      if (value == '' || value == null) {
                        return 'Required';
                      }
                      return null;
                    },
                    items: (f, cs) =>
                        ["Poor", 'Average', 'Good', 'Very Good', 'Excellent'],
                    // selectedItem: controller.gender.value,
                    popupProps: PopupProps.menu(
                        disabledItemFn: (item) => item == 'Item 3',
                        fit: FlexFit.loose),
                    decoratorProps: DropDownDecoratorProps(
                      decoration: textDecoration('Priority'),
                    ),
                    onChanged: (value) {
                      controller.feedbackPriority.value = value!;
                    },
                  ),
                  sizedBoxHeight(10),
                  TextFormField(
                    maxLines: 6,
                    maxLength: 60000,
                    decoration: textDecoration('Comments'),
                    controller: controller.feedbackComment,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Submit'),
                onPressed: () {
                  controller.submitFeedback(grievanceDetail, grievanceDetail2,
                      () {
                    showLoader(context);
                  }, (String message) {
                    Get.back();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(mySuccessSnackBar('Success', message));
                    hideLoader();
                  }, (String message) {
                    Get.back();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(myErrorSnackBar('Error', message));
                    hideLoader();
                  });
                },
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Get.back(); // Close the dialog
                },
              ),
            ],
          );
        });
  }

  Future<void> downloadFile(
      BuildContext context, String url, String fileName) async {
    try {
      // Request storage permission
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

      // Fetch response from Laravel API
      final dio = Dio();
      var token = storage.read('token');
      dio.options.headers['Authorization'] = 'Bearer $token';
      ProgressDialog pd = ProgressDialog(context: context);
      pd.show(max: 100, msg: 'File Downloading...');
      await Future.delayed(const Duration(milliseconds: 500));
      final response = await dio.get(
        url,
        onReceiveProgress: (count, total) {
          if (total != -1) {
            controller.downloadPercentage.value =
                ((count / total * 100).toInt());
            pd.update(value: controller.downloadPercentage.value);
          }
        },
      );
      // Simulate fake progress update
      for (int i = 0; i <= 100; i += 20) {
        await Future.delayed(const Duration(milliseconds: 100));
        controller.downloadPercentage.value = i;
        pd.update(value: i);
      }
      pd.close();
      if (response.statusCode == 200 && response.data['pdf_base64'] != null) {
        // Decode base64 string
        final base64String = response.data['pdf_base64'].toString();
        final bytes = base64Decode(base64String);

        // Save PDF to local file
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/$fileName';
        final file = File(filePath);
        await file.writeAsBytes(bytes);

        // Print and open

        OpenFile.open(filePath);

        showDownloadSuccessSnackBar(
            'Success',
            'File downloaded successfully',
            const Icon(
              Icons.check,
              color: Colors.blue,
            ),
            filePath);
      } else {
        throw Exception('No PDF data in response');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }
}
