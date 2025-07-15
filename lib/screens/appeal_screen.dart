import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mipuiaw_apps/controllers/appeal_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppealScreen extends StatelessWidget {
  const AppealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppealController>(
        init: AppealController(),
        builder: (controller) {
          return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              elevation: 0,
              backgroundColor: MyColor.red,
              onPressed: () {
                Get.toNamed('/appeal-grievance');
              },
              label: const Text(
                'Appeal Grievance',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(
                () => controller.isLoading.isTrue
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: SizedBox(
                          height: Get.height - 210,
                          child: SmartRefresher(
                            enablePullDown: true,
                            enablePullUp: true,
                            header: const WaterDropHeader(),
                            controller: controller.refreshController,
                            // onRefresh: controller.onRefresh,
                            // onLoading: controller.onLoading,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  sizedBoxHeight(10),
                              shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.appealList.length,
                              itemBuilder: (c, i) {
                                var data = controller.appealList[i];
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                      '/appeal-details/${data['id']}',
                                    );
                                  },
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(data['department']
                                                  ['organization_name'])
                                            ],
                                          ),
                                          Divider(),
                                          sizedBoxHeight(10),
                                          Row(
                                            children: [
                                              Text('Description: ' +
                                                  data['grievance_text']),
                                            ],
                                          ),
                                          sizedBoxHeight(10),
                                          Container(
                                            width: Get.width,
                                            color: data['action']['label'] ==
                                                    'CLOSED'
                                                ? MyColor.lightBlack
                                                : MyColor.deepBlue,
                                            padding: const EdgeInsets.all(10),
                                            child: Center(
                                                child: Text(
                                              data['action']['label'],
                                              style: TextStyle(
                                                  color: data['action']
                                                              ['label'] ==
                                                          'CLOSED'
                                                      ? Colors.white
                                                      : Colors.black),
                                            )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                                // ListTile(
                                //   dense: true,
                                //   tileColor: Colors.white,
                                //   title: Text(
                                //       data['department']['organization_name']),
                                //   subtitle: Text(data['registration_number']),
                                // );
                              },
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          );
        });
  }
}
