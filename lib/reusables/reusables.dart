import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:open_file/open_file.dart';

termsHeadingStyle() {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
}

textBoxFocusBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: MyColor.lightBlack,
      width: 1,
    ),
  );
}

sizedBoxHeight(double height) {
  return SizedBox(
    height: height,
  );
}

sizedBoxWidth(double width) {
  return SizedBox(
    width: width,
  );
}

headingLine() {
  return Container(
    height: 20,
    width: 5,
    color: MyColor.green,
  );
}

myAppbar() {
  return AppBar(
    backgroundColor: MyColor.red,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.white,
      ),
    ),
  );
}

textDecoration(String text) {
  return InputDecoration(
    isDense: true,
    counterText: '',
    hintText: text,
    border: const OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: MyColor.red),
    ),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
    ),
  );
}

showLoader(BuildContext context) {
  return Loader.show(context,
      overlayColor: Colors.transparent,
      progressIndicator: Platform.isIOS
          ? const CupertinoActivityIndicator(
              color: Colors.black,
              radius: 12,
            )
          : CircularProgressIndicator(
              color: MyColor.deepBlue,
            ),
      themeData: Theme.of(context).copyWith(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.green)));
}

hideLoader() {
  return Loader.hide();
}

mySuccessSnackBar(String title, String message) => SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,

      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.success,
      ),
    );
myErrorSnackBar(String title, String message) => SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,

      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.failure,
      ),
    );
myWarningSnackBar(String title, String message) => SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,

      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.warning,
      ),
    );

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

showDownloadSuccessSnackBar(
    String title, String message, Icon icon, String filePath) {
  return Get.rawSnackbar(
    title: title,
    message: message,
    icon: icon,
    shouldIconPulse: true,
    backgroundColor: MyColor.green,
    padding: const EdgeInsets.all(10),
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 5),
    margin: const EdgeInsets.all(20),
    mainButton: MaterialButton(
      onPressed: () {
        print(filePath);
        OpenFile.open(filePath);
      },
      child: const Text('VIEW'),
    ),
  );
}
