import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/main.dart';
import 'package:mipuiaw_apps/services/auth_services.dart';
import 'package:dio/dio.dart' as dio;

class AuthController extends GetxController {
  AuthServices services = Get.find(tag: 'authServices');
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  final registerOtpFormKey = GlobalKey<FormState>();
  var loginText = TextEditingController();
  var loginPasswordText = TextEditingController();
  var isLoginPasswordHidden = true.obs;
  var isOtpSent = false.obs;
  var otpText = TextEditingController();
  //REGISTER
  var fullNameText = TextEditingController();
  var emailText = TextEditingController();
  var passwordText = TextEditingController();
  var confirmPasswordText = TextEditingController();
  var addressText = TextEditingController();
  var districtText = ''.obs;
  var genderText = ''.obs;
  var mobileText = TextEditingController();
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  //MIDDLEWARE
  var isAuthenticated = false.obs;

  //CODE

  void sendOtp(Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.sendOtp(mobileText.text);
      if (response.statusCode == 200) {
        if (response.data['status'] == 442) {
          onError(response.data['message']);
        } else if (response.data['status'] == 201) {
          print(response.data['otp']);
          onSuccess(response.data['message']);
        } else {
          onError('Error Occured');
        }
      }
    } catch (ex) {
      print(ex);
      onError('Error Occured');
    }
  }

  void verifyOtp(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.verifyOtp(otpText.text, mobileText.text);
      if (response.statusCode == 200) {
        if (response.data['status'] == 401) {
          onError(response.data['message']);
        } else if (response.data['status'] == 201) {
          onSuccess(response.data['message']);
        }
      } else {
        onError('Error Occured');
      }
    } catch (ex) {
      onError('Error Occured');
    }
  }

  void register(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      final formData = dio.FormData.fromMap({
        'name': fullNameText.text,
        'email': emailText.text,
        'mobile': mobileText.text,
        'gender': genderText.value,
        'district': districtText.value,
        'address': addressText.text,
        'password': passwordText.text,
      });
      var response = await services.register(formData);

      if (response.statusCode == 200) {
        if (response.data['status'] == 442) {
          onError(response.data['message']);
        } else if (response.data['status'] == 201) {
          isAuthenticated.value = true;
          await storage.write('token', response.data['token']);
          onSuccess(response.data['message']);
        }
      } else {
        onError('Error Occured');
      }
    } catch (ex) {
      onError('Error Occured');
    }
  }

  void login(Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response =
          await services.login(loginText.text, loginPasswordText.text);
      if (response.statusCode == 200) {
        if (response.data['status'] == 442) {
          onError(response.data['message']);
        } else if (response.data['status'] == 401) {
          onError(response.data['message']);
        } else if (response.data['status'] == 200) {
          isAuthenticated.value = true;
          await storage.write('token', response.data['token']);
          onSuccess(response.data['message']);
        }
      } else {
        onError('Error Occured');
      }
    } catch (ex) {
      onError('Error Occured');
    }
  }

  bool get isUserAuthenticated {
    var token = storage.read('token');
    if (token != null) {
      isAuthenticated.value = true;
      return true;
    }
    return false;
  }
}
