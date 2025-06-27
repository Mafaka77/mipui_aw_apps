import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:mipuiaw_apps/services/grievance_services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GrievanceController extends GetxController {
  GrievanceServices services = Get.find(tag: 'grievanceServices');
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final grievanceFormState = GlobalKey<FormState>();
  var isMizo = false.obs;
  var isStep1Checked = false.obs;
  var activeStep = 1.obs;
  var isStep2Checked = false.obs;
  var offset = 0.obs;
  var limit = 10.obs;

  var departmentId = 0.obs;
  var grievanceText = TextEditingController();
  var priority = ''.obs;
  var attachmentName = TextEditingController();
  var isAttachment = false.obs;

  XFile? attachment = XFile('');
  var credit = {}.obs;
  var grievanceList = [].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    getCredit();
    getAllGrievance();
    super.onInit();
  }
  //----------------------------------------------------

  Future getDepartment(String filter) async {
    var response = await services.getDepartment(filter);
    return response;
  }

  Future getCredit() async {
    try {
      var response = await services.getCredit();
      credit.value = response.data;
    } catch (ex) {}
  }

  void getAllGrievance() async {
    isLoading.value = true;
    grievanceList.clear();
    try {
      var response = await services.getAllGrievance(offset.value, limit.value);
      grievanceList.assignAll(response.data['grievances']);
      isLoading.value = false;
    } catch (ex) {
      isLoading.value = false;
    }
  }

  void submitGrievance(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      final formData = dio.FormData.fromMap({
        'department_id': departmentId.value,
        'grievance': grievanceText.text,
        'files': attachment!.path.isEmpty
            ? null
            : await dio.MultipartFile.fromFile(attachment!.path,
                filename: attachment!.name),
        'priority': priority.value,
      });
      var response = await services.submitGrievance(formData);
      if (response.statusCode == 200) {
        onSuccess(response.data['message']);
      } else {
        onError(response.data);
      }
    } catch (ex) {
      onError('Something went wrong, please try again later.');
    }
  }

  void onRefresh() async {
    offset.value = 0;
    grievanceList.clear();
    getAllGrievance();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    offset.value += limit.value;
    try {
      var response = await services.getAllGrievance(offset.value, limit.value);
      grievanceList.addAll(response.data['grievances']);
      refreshController.loadComplete();
    } catch (ex) {
      refreshController.loadFailed();
    }
  }
}
