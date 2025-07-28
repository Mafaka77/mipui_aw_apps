import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/home_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class UserManualWidget extends GetView<HomeController> {
  const UserManualWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            headingLine(),
            sizedBoxWidth(10),
            const Text(
              'USER MANUAL',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        sizedBoxHeight(30),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1, // 1:1 makes it square
          ),
          shrinkWrap: true,
          itemCount: controller.pdfList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            var data = controller.pdfList[i];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    if (i != 0) {
                      downloadFile(context, data['url'], data['file_name']);
                    } else {
                      openYouTube('l_cHrrMkILc');
                    }
                  },
                  child: AspectRatio(
                    aspectRatio: 3 / 2, // Ensures it's square
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle, // Ensures it's a circle
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(14),
                      child: Center(
                        child: SvgPicture.asset(
                          color: MyColor.green,
                          data['icon']!,
                        ),
                      ),
                    ),
                  ),
                ),
                sizedBoxHeight(10),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(data['name']!),
                )
              ],
            );
          },
        )

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     MaterialButton(
        //       padding: const EdgeInsets.all(10),
        //       elevation: 0,
        //       minWidth: Get.width * 0.4,
        //       color: Colors.pink[100],
        //       onPressed: () {},
        //       child: Row(
        //         children: [
        //           const Icon(Icons.picture_as_pdf),
        //           sizedBoxWidth(5),
        //           const Text('Mizo Tawngin'),
        //         ],
        //       ),
        //     ),
        //     MaterialButton(
        //       padding: const EdgeInsets.all(10),
        //       elevation: 0,
        //       minWidth: Get.width * 0.4,
        //       color: Colors.pink[100],
        //       onPressed: () {},
        //       child: Row(
        //         children: [
        //           const Icon(Icons.picture_as_pdf),
        //           sizedBoxWidth(5),
        //           const Text('In English'),
        //         ],
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }

  void openYouTube(String videoId) async {
    final Uri youtubeAppUrl = Uri.parse("vnd.youtube:$videoId");
    final Uri browserUrl =
        Uri.parse("https://www.youtube.com/watch?v=$videoId");

    if (await canLaunchUrl(youtubeAppUrl)) {
      await launchUrl(youtubeAppUrl, mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(browserUrl)) {
      await launchUrl(browserUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch YouTube video';
    }
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
