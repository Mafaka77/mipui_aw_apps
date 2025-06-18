import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mipuiaw_apps/controllers/auth_controller.dart';
import 'package:mipuiaw_apps/main.dart';

class AuthMiddleware extends GetMiddleware {
  var token = storage.read('token');

  @override
  RouteSettings? redirect(String? route) {
    print(token);
    Get.put(AuthController());
    final authController = Get.find<AuthController>();
    if (!authController.isUserAuthenticated) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }
}
