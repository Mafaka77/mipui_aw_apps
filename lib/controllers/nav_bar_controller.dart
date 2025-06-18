import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/screens/appeal_screen.dart';
import 'package:mipuiaw_apps/screens/grievance_screen.dart';
import 'package:mipuiaw_apps/screens/home_screen.dart';

class NavBarController extends GetxController {
  var selectedIndex = 0.obs;
  final navBarList = [
    BottomNavigationBarItem(
        icon: SvgPicture.asset('images/home.svg'), label: 'Home'),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('images/grievance.svg'), label: 'Grievance'),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('images/appeal.svg'), label: 'Appeal'),
  ];
  final List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const GrievanceScreen(),
    const AppealScreen(),
  ];
}
