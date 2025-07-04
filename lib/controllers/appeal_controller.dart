import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/services/appeal_services.dart';

class AppealController extends GetxController {
  AppealServices services = Get.find(tag: 'appealServices');
  var appealReason = TextEditingController();

  Future getAppealRegistration(String filter) async {
    try {
      var response = await services.getAppealRegistration(filter);
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
