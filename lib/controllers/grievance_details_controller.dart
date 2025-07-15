import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/models/grievance_model.dart';
import 'package:mipuiaw_apps/services/grievance_services.dart';

class GrievanceDetailsController extends GetxController {
  GrievanceServices services = Get.find(tag: 'grievanceServices');
  final grievanceId = ''.obs;
  var isLoading = false.obs;
  var grievanceDetails = {}.obs;
  RxList<String> attachments = <String>[].obs;
  var downloadPercentage = 0.obs;
  var feedbackPriority = 0.obs;
  var feedbackComment = TextEditingController();
  @override
  void onInit() {
    grievanceId.value = Get.parameters['id'] ?? '';
    getGrievanceDetails(grievanceId.value);
    super.onInit();
  }

  void getGrievanceDetails(String grievanceId) async {
    grievanceDetails.clear();
    isLoading.value = true;
    try {
      var response = await services.getGrievanceDetails(grievanceId);
      if (response.statusCode == 200) {
        grievanceDetails.value = response.data['grievance'];
        attachments.value = grievanceDetails['grievance_attachment'] != null &&
                grievanceDetails['grievance_attachment'].toString().isNotEmpty
            ? grievanceDetails['grievance_attachment']
                .toString()
                .split(',')
                .map((e) => e.trim())
                .toList()
            : [];
        isLoading.value = false;
      } else {
        isLoading.value = false;
        Get.snackbar('Error', 'Failed to load grievance details');
      }
    } catch (ex) {
      isLoading.value = false;

      return Future.error(ex);
    }
  }

  void submitFeedback(int id, String regNo, Function onLoading,
      Function onSuccess, Function onError) async {
    try {
      var response = await services.submitFeedback(
          id, regNo, feedbackPriority.value, feedbackComment.text);
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          onSuccess(response.data['message']);
        }
      } else {
        onError('Something went wrong, please try again later.');
      }
    } catch (ex) {
      onError('Something went wrong, please try again later.');
    }
  }

  Future getFeedbackPriority(String priority) async {
    try {
      var response = await services.getFeedbackPriority(priority);
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
