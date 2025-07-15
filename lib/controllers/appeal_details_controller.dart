import 'package:get/get.dart';
import 'package:mipuiaw_apps/services/appeal_services.dart';

class AppealDetailsController extends GetxController {
  AppealServices services = Get.find(tag: 'appealServices');
  final grievanceId = ''.obs;
  var appealDetails = {}.obs;
  var isLoading = false.obs;
  var isTileExpanded = false.obs;
  var isAppealAnswerExpanded = false.obs;
  var downloadPercentage = 0.obs;

  @override
  void onInit() {
    grievanceId.value = Get.parameters['id'] ?? '';
    getAppealDetails(grievanceId.value);
    super.onInit();
  }

  void getAppealDetails(String value) async {
    isLoading.value = true;
    try {
      var response = await services.getAppealDetails(int.parse(value));
      appealDetails.value = response;
      isLoading.value = false;
    } catch (ex) {
      isLoading.value = false;
      Get.snackbar('Error', 'Failed to load appeal details');
    }
  }
}
