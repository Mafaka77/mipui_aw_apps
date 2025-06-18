import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mipuiaw_apps/controllers/profile_controller.dart';
import 'package:mipuiaw_apps/main.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: MyColor.limeGreen,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height * 0.13,
                      padding: const EdgeInsets.all(20),
                      color: MyColor.red,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // controller.isMeLoading.isTrue
                            //     ? nameLoader()
                            //     :
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Welcome,',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Obx(() {
                                  final user = controller.profile.value;
                                  return Container(
                                    padding: const EdgeInsets.only(left: 30),
                                    width: 250.0,
                                    child: DefaultTextStyle(
                                      style: GoogleFonts.lilitaOne(
                                        fontSize: 20,
                                        letterSpacing: 2,
                                      ),
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                              user?.name ?? ""),
                                        ],
                                        onTap: () {
                                          print("Tap Event");
                                        },
                                      ),
                                    ),
                                  );
                                })
                              ],
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  openLogoutDialog(context, controller);
                                },
                                icon: Icon(
                                  Icons.logout,
                                  color: MyColor.green,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    sizedBoxHeight(30),
                    ListTile(
                      onTap: () {
                        Get.toNamed('/profile/my-profile');
                      },
                      tileColor: Colors.white,
                      leading: SvgPicture.asset('images/person.svg'),
                      title: const Text('My Profile'),
                      trailing: IconButton(
                        onPressed: () {
                          Get.toNamed('/profile/my-profile');
                        },
                        icon: const Icon(
                          Icons.arrow_right,
                        ),
                      ),
                    ),
                    sizedBoxHeight(10),
                    ListTile(
                      onTap: () {
                        Get.toNamed('/profile/feedback');
                      },
                      tileColor: Colors.white,
                      leading: SvgPicture.asset('images/feedback.svg'),
                      title: const Text('Feedback'),
                      trailing: IconButton(
                        onPressed: () {
                          Get.toNamed('/profile/feedback');
                        },
                        icon: const Icon(
                          Icons.arrow_right,
                        ),
                      ),
                    ),
                    sizedBoxHeight(10),
                    ListTile(
                      onTap: () {
                        controller.getNodalOfficer(() {
                          showLoader(context);
                        }, () {
                          hideLoader();
                          Get.toNamed('/profile/nodal-officer');
                        }, () {
                          hideLoader();
                        });
                      },
                      tileColor: Colors.white,
                      leading: SvgPicture.asset('images/people.svg'),
                      title: const Text('Nodal PG Officers'),
                      trailing: IconButton(
                        onPressed: () {
                          Get.toNamed('/profile/nodal-officer');
                        },
                        icon: const Icon(
                          Icons.arrow_right,
                        ),
                      ),
                    ),
                    sizedBoxHeight(10),
                    ListTile(
                      onTap: () {
                        Get.toNamed('/profile/terms');
                      },
                      tileColor: Colors.white,
                      leading: SvgPicture.asset('images/terms.svg'),
                      title: const Text('Terms and Conditions'),
                      trailing: IconButton(
                        onPressed: () {
                          Get.toNamed('/profile/terms');
                        },
                        icon: const Icon(
                          Icons.arrow_right,
                        ),
                      ),
                    ),
                    sizedBoxHeight(10),
                    ListTile(
                      tileColor: Colors.white,
                      leading: SvgPicture.asset('images/delete_account.svg'),
                      title: const Text('Delete Account'),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_right,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void openLogoutDialog(BuildContext context, ProfileController controller) {
    showDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: const Column(
              children: [
                Image(
                  height: 40,
                  image: AssetImage('images/logout.png'),
                ),
                Text('Come back soon!'),
              ],
            ),
            content: const Text('Are you sure you want to Log Out?'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('NO'),
              ),
              MaterialButton(
                onPressed: () {
                  // storage.erase();
                  controller.logout(() {
                    showLoader(context);
                  }, () {
                    storage.erase();
                    Get.offAllNamed('/');
                    hideLoader();
                  }, () {
                    hideLoader();
                  });
                },
                child: const Text('YES'),
              ),
            ],
          );
        });
  }
}
