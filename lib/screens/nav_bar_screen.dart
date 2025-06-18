import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/nav_bar_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(
      init: NavBarController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: MyColor.red,
            leadingWidth: 100,
            leading: const Image(
              image: AssetImage('images/mipui_aw_logo.png'),
              color: Colors.white,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed('/profile');
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ],
            actionsIconTheme: const IconThemeData(
              size: 24,
              color: Colors.white,
            ),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              items: controller.navBarList,
              backgroundColor: Colors.white,
              currentIndex: controller.selectedIndex.value,
              enableFeedback: true,
              selectedItemColor: MyColor.red,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              useLegacyColorScheme: true,
              selectedIconTheme: IconThemeData(color: MyColor.red, fill: 1),
              onTap: (value) {
                controller.selectedIndex.value = value;
              },
            ),
          ),
          body: Obx(
            () => controller.widgetOptions
                .elementAt(controller.selectedIndex.value),
          ),
        );
      },
    );
  }
}
