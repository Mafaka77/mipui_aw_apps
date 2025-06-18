import 'package:get/get.dart';
import 'package:mipuiaw_apps/routes.dart';
import 'package:mipuiaw_apps/services/base_services.dart';
import 'package:dio/dio.dart' as dio;

class AuthServices extends BaseService {
  Future sendOtp(String mobile) async {
    try {
      var response = await client.post(Routes.SEND_OTP, data: {
        'mobile': mobile,
      });
      return response;
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }

  Future verifyOtp(String otp, String mobile) async {
    try {
      var response = await client.post(
        Routes.VERIFY_OTP,
        data: {
          'otp': otp,
          'mobile': mobile,
        },
      );
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future register(dio.FormData data) async {
    try {
      var response = await client.post(Routes.REGISTER, data: data);
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future login(String loginText, String password) async {
    print(password);
    try {
      var response = await client.post(Routes.LOGIN, data: {
        'login': loginText,
        'password': password,
      });
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
