import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mipuiaw_apps/controllers/grievance_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:mipuiaw_apps/services/grievance_services.dart';

class GrievanceController extends GetxController {
  GrievanceServices services = Get.find(tag: 'grievanceServices');
  final grievanceFormState = GlobalKey<FormState>();
  var isMizo = false.obs;
  var isStep1Checked = false.obs;
  var activeStep = 1.obs;
  var isStep2Checked = false.obs;

  var departmentId = 0.obs;
  var grievanceText = TextEditingController();
  var priorityId = 0.obs;
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
      var response = await services.getAllGrievance();
      grievanceList.assignAll(response.data['grievances']);
      isLoading.value = false;
    } catch (ex) {
      isLoading.value = false;
      print(ex);
    }
  }

  void getGrievanceById(
      Function onLoading, Function onSuccess, Function onError) async {
    try {} catch (ex) {}
  }

  void submitGrievance(
      Function onLoading, Function onSuccess, Function onError) async {
    try {
      final formData = dio.FormData.fromMap({
        'department_id': departmentId.value,
        'grievance': grievanceText.text,
        'files': attachment!.path.isEmpty
            ? null
            : await dio.MultipartFile.fromFile(attachment!.path,
                filename: attachment!.name),
        'priority': priorityId.value,
      });
      var response = await services.submitGrievance(formData);
    } catch (ex) {}
  }
}
