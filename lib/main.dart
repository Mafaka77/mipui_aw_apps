import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/router.dart';
import 'package:mipuiaw_apps/services/appeal_services.dart';
import 'package:mipuiaw_apps/services/auth_services.dart';
import 'package:mipuiaw_apps/services/grievance_services.dart';
import 'package:mipuiaw_apps/services/home_services.dart';
import 'package:mipuiaw_apps/services/profile_services.dart';

final storage = GetStorage();
void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Get.put(AuthServices(), tag: 'authServices');
  Get.put(ProfileServices(), tag: 'profileServices');
  Get.put(HomeServices(), tag: 'homeServices');
  Get.put(GrievanceServices(), tag: 'grievanceServices');
  Get.put(AppealServices(), tag: 'appealServices');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mipui Aw',
      theme: _buildTheme(),
      initialRoute: '/',
      getPages: getPage,
    );
  }

  ThemeData _buildTheme() {
    var baseTheme = ThemeData();
    return baseTheme.copyWith(
      scaffoldBackgroundColor: MyColor.lightGreen,
      textTheme: GoogleFonts.robotoMonoTextTheme(baseTheme.textTheme).copyWith(
        bodyLarge: const TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        bodyMedium: const TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        bodySmall: const TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }
}
