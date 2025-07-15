import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/services/appeal_services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppealController extends GetxController {
  final formKey = GlobalKey<FormState>();
  AppealServices services = Get.find(tag: 'appealServices');
  var appealReason = TextEditingController();
  var grievanceId = 0.obs;
  var appealList = <dynamic>[].obs;
  var isLoading = false.obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllAppeal();
  }

  void getAllAppeal() async {
    isLoading.value = true;
    try {
      var response = await services.getAllAppeal();
      if (response != null) {
        appealList.value = response;
        isLoading.value = false;
      }
    } catch (ex) {
      isLoading.value = false;
    }
  }

  Future getAppealRegistration(String filter) async {
    try {
      var response = await services.getAppealRegistration(filter);
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  void submitAppeal(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.submitAppeal(
        grievanceId: grievanceId.value,
        reason: appealReason.text,
      );
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          appealReason.clear();
          grievanceId.value = 0;
          onSuccess(
              response.data['message'] ?? 'Appeal submitted successfully');
        }
      } else {
        onError(response.data['message'] ?? 'Something went wrong');
      }
    } catch (ex) {
      // Handle error
      onError('Error occurred');
    }
  }
}
