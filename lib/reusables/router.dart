import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/grievance_details_controller.dart';
import 'package:mipuiaw_apps/middleware/auth_middleware.dart';
import 'package:mipuiaw_apps/screens/appeal_grievance_screen.dart';
import 'package:mipuiaw_apps/screens/feedback_screen.dart';
import 'package:mipuiaw_apps/screens/grievance_details_screen.dart';
import 'package:mipuiaw_apps/screens/lodge_grievance_screen.dart';
import 'package:mipuiaw_apps/screens/login_screen.dart';
import 'package:mipuiaw_apps/screens/my_profile_screen.dart';
import 'package:mipuiaw_apps/screens/nav_bar_screen.dart';
import 'package:mipuiaw_apps/screens/nodal_officer_screen.dart';
import 'package:mipuiaw_apps/screens/profile_screen.dart';
import 'package:mipuiaw_apps/screens/register_otp_screen.dart';
import 'package:mipuiaw_apps/screens/register_screen.dart';
import 'package:mipuiaw_apps/screens/terms_screen.dart';

final getPage = [
  GetPage(
    name: '/login',
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: '/register-otp',
    page: () => const RegisterOtpScreen(),
  ),
  GetPage(
    name: '/register',
    page: () => const RegisterScreen(),
  ),
  GetPage(
    name: '/',
    page: () => const NavBarScreen(),
    middlewares: [
      AuthMiddleware(),
    ],
    children: [
      GetPage(
        name: '/lodge-grievance',
        page: () => const LodgeGrievanceScreen(),
      ),
      GetPage(
        name: '/appeal-grievance',
        page: () => const AppealGrievanceScreen(),
      ),
      GetPage(
        name: '/grievance-details/:id',
        page: () => GrievanceDetailsScreen(),
        transition: Transition.downToUp,
        binding: BindingsBuilder(
          () {
            Get.lazyPut<GrievanceDetailsController>(
              () => GrievanceDetailsController(),
            );
          },
        ),
      ),
      GetPage(
        name: '/profile',
        page: () => const ProfileScreen(),
        transition: Transition.downToUp,
        children: [
          GetPage(
            name: '/my-profile',
            page: () => const MyProfileScreen(),
          ),
          GetPage(
            name: '/feedback',
            page: () => const FeedbackScreen(),
          ),
          GetPage(
            name: '/nodal-officer',
            page: () => const NodalOfficerScreen(),
          ),
          GetPage(
            name: '/terms',
            page: () => const TermsScreen(),
          ),
        ],
      ),
    ],
  ),
];
// 9612376936
