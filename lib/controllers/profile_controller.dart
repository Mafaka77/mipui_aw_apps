import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/main.dart';
import 'package:mipuiaw_apps/models/nodal_officer_model.dart';
import 'package:mipuiaw_apps/models/user_model.dart';
import 'package:mipuiaw_apps/services/profile_services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfileController extends GetxController {
  ProfileServices services = Get.find(tag: 'profileServices');
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final registerFormKey = GlobalKey<FormState>();
  var fullNameText = TextEditingController();
  var mobileText = TextEditingController();
  var emailText = TextEditingController();
  var genderText = ''.obs;
  var addressText = TextEditingController();
  var districtText = ''.obs;
  var nodalOfficers = <NodalOfficerModel>[].obs;
  var offset = 0.obs;
  var limit = 10.obs;
  var isLoading = false.obs;
  var profile = Rxn<UserModel>();
  @override
  void onInit() {
    me();
    super.onInit();
  }
  //CODE

  void logout(Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.logout();
      if (response.statusCode == 200) {
        if (response.data['status'] == 200) {
          await storage.erase();
          onSuccess();
        } else {
          await storage.erase();
          Get.offAllNamed('/');
        }
      }
    } catch (ex) {
      print(ex);
      onError();
    }
  }

  void me() async {
    isLoading.value = true;
    try {
      var response = await services.me();
      profile.value = response;
      fullNameText.text = profile.value!.name;
      emailText.text = profile.value!.email;
      mobileText.text = profile.value!.mobile;
      addressText.text = profile.value!.address;
      genderText.value = profile.value!.gender;
      districtText.value = profile.value!.district;
      isLoading.value = false;
    } catch (ex) {
      isLoading.value = false;
    }
  }

  void getNodalOfficer(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    nodalOfficers.clear();
    try {
      var response = await services.getNodalOfficers(offset.value, limit.value);
      nodalOfficers.assignAll(response);
      onSuccess();
    } catch (ex) {
      onError();
    }
  }

  void onRefresh() async {
    offset.value = 0;
    nodalOfficers.clear();
    var response = await services.getNodalOfficers(offset.value, limit.value);
    nodalOfficers.assignAll(response);
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    offset.value += limit.value;
    try {
      var response = await services.getNodalOfficers(offset.value, limit.value);
      nodalOfficers.addAll(response);
      refreshController.loadComplete();
    } catch (ex) {
      refreshController.loadFailed();
    }
  }
}
