import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mipuiaw_apps/controllers/grievance_details_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';
import 'package:mipuiaw_apps/routes.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class GrievanceDetailsWidget extends GetView<GrievanceDetailsController> {
  const GrievanceDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      dense: true,
      leading: Text(
        'Grievance Details',
        style: TextStyle(color: MyColor.red),
      ),
      title: const Text(''),
      children: [
        ListTile(
          dense: true,
          minTileHeight: 10,
          leading: const Text('Registration No: '),
          title: Text(
            controller.grievanceDetails['registration_number'] ?? 'N/A',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          minTileHeight: 10,
          dense: true,
          leading: const Text('Name: '),
          title: Text(
            controller.grievanceDetails['applicant_name'] ?? 'N/A',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          minTileHeight: 10,
          dense: true,
          leading: const Text('Date of Receipt: '),
          title: Text(
            DateFormat('dd MMM yyyy, hh:mm a').format(
              DateTime.parse(
                controller.grievanceDetails['date_of_receipt'] ??
                    DateTime.now().toString(),
              ),
            ),
          ),
        ),
        ListTile(
          minTileHeight: 10,
          dense: true,
          leading: const Text('Address: '),
          title: Text(
            controller.grievanceDetails['applicant_address'] ?? 'N/A',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          minTileHeight: 10,
          dense: true,
          leading: const Text('District: '),
          title: Text(
            controller.grievanceDetails['applicant_district'] ?? 'N/A',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          minTileHeight: 10,
          dense: true,
          leading: const Text('Mobile Number: '),
          title: Text(
            controller.grievanceDetails['applicant_mobile'] ?? 'N/A',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          minTileHeight: 10,
          dense: true,
          leading: const Text('Email: '),
          title: Text(
            controller.grievanceDetails['applicant_email'] ?? 'N/A',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          minTileHeight: 10,
          dense: true,
          leading: const Text('Department: '),
          title: Text(
            controller.grievanceDetails['department']['organization_name'] ??
                'N/A',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ExpansionTile(
          leading: const Text(
            'Grievance Description',
          ),
          title: Container(),
          tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
          initiallyExpanded: false,

          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                controller.grievanceDetails['grievance_description'] ?? 'N/A',
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ], // Set true if you want it expanded by default
        ),
        Obx(
          () => controller.attachments.isEmpty
              ? Container()
              : ExpansionTile(
                  leading: const Text(
                    'Grievance Attachment',
                  ),
                  title: Container(),
                  tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  initiallyExpanded: false,

                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: controller.attachments.map((e) {
                          return TextButton(
                              onPressed: () {
                                downloadFile(
                                    context, '${Routes.IMAGE_URL}files/$e', e);
                              },
                              child: Text(e));
                        }).toList(),
                      ),
                    ),
                  ], // Set true if you want it expanded by default
                ),
        )
      ],
    );
  }

  void downloadFile(BuildContext context, String? url, String? fileName) async {
    // try {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    final Directory directory = await getApplicationDocumentsDirectory();
    // final Directory directory = Directory('/storage/emulated/0/Download/Rti');
    String filePath = '${directory.path}/$fileName';
    Dio dio = Dio();
    // ignore: use_build_context_synchronously
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'File Downloading...');
    await dio.download(
      url!,
      filePath,
      onReceiveProgress: (count, total) {
        if (total != -1) {
          controller.downloadPercentage.value = ((count / total * 100).toInt());
          pd.update(value: controller.downloadPercentage.value);
        }
      },
    );

    OpenFile.open(filePath);
    showDownloadSuccessSnackBar(
        'Success',
        'File downloaded successfully',
        const Icon(
          Icons.check,
          color: Colors.blue,
        ),
        filePath);
    // } catch (ex) {}
  }
}
