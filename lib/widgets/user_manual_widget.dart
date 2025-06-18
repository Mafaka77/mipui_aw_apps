import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/home_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';
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
        sizedBoxHeight(20),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 3 / 3, crossAxisSpacing: 10),
          shrinkWrap: true,
          itemCount: controller.pdfList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (c, i) {
            var data = controller.pdfList[i];
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    if (i != 0) {
                      // downloadFile(context, data['url'], data['file_name']);
                    } else {
                      openYouTube('l_cHrrMkILc');
                    }
                  },
                  child: Container(
                    height: Get.height * 0.09,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
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
}
