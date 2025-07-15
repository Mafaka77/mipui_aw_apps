import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mipuiaw_apps/controllers/appeal_details_controller.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';
import 'package:mipuiaw_apps/routes.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class AppealAnswerWidget extends GetView<AppealDetailsController> {
  const AppealAnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ExpansionTile(
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        onExpansionChanged: (bool expanded) {
          controller.isAppealAnswerExpanded.value = expanded;
        },
        collapsedShape: RoundedRectangleBorder(
          side: BorderSide(
            color: controller.isAppealAnswerExpanded.value
                ? Colors.white
                : Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: controller.isAppealAnswerExpanded.value
                ? Colors.white
                : Colors.white,
          ),
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        dense: true,
        title: Text(
          'Appeal Answer',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Card(
            elevation: 0,
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  dense: true,
                  title: const Text(
                    'Appeal Answer:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  subtitle: Text(
                    controller.appealDetails['appealReply'] ?? 'N/A',
                  ),
                ),
                ListTile(
                  dense: true,
                  title: const Text(
                    'Reply Date:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  subtitle: Text(
                    DateFormat('dd-MM-yyyy').format(
                      DateTime.tryParse(
                              controller.appealDetails['appealReplyDate'] ??
                                  '') ??
                          DateTime.now(),
                    ),
                  ),
                ),
                ListTile(
                    dense: true,
                    title: const Text(
                      'Attachment:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    subtitle: TextButton(
                        onPressed: () {
                          downloadFile(
                              context,
                              '${Routes.IMAGE_URL}files/${controller.appealDetails['daaAttachment']}',
                              controller.appealDetails['daaAttachment']);
                        },
                        child: Text(
                          controller.appealDetails['daaAttachment'] ?? 'N/A',
                          style: const TextStyle(color: Colors.blue),
                        ))),
                Divider(),
                ListTile(
                  dense: true,
                  title: const Text(
                    'Replied By:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.appealDetails['officer_name_daa'] ?? 'N/A',
                      ),
                      Text(
                        controller.appealDetails['officer_designation_daa'] ??
                            'N/A',
                      ),
                      Text(
                        controller.appealDetails['officer_mobile_daa'] ?? 'N/A',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
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
