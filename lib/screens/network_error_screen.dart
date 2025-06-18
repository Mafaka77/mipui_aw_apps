import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';

class NetworkErrorScreen extends StatelessWidget {
  String? message;
  NetworkErrorScreen({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  height: Get.height * 0.2,
                  image: const AssetImage('images/processing-error.png'),
                ),
                Text(message!),
                sizedBoxHeight(20),
                MaterialButton(
                  elevation: 0,
                  color: MyColor.green,
                  onPressed: () {
                    Get.offAllNamed('/');
                  },
                  child: const Text(
                    'Reload',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
