import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mipuiaw_apps/controllers/grievance_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GrievanceScreen extends StatelessWidget {
  const GrievanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GrievanceController>(
        init: GrievanceController(),
        builder: (controller) {
          return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              elevation: 0,
              backgroundColor: MyColor.red,
              label: const Text(
                'Lodge Grievance',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Get.toNamed('/lodge-grievance');
              },
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
                            onRefresh: controller.onRefresh,
                            onLoading: controller.onLoading,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  sizedBoxHeight(10),
                              shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.grievanceList.length,
                              itemBuilder: (c, i) {
                                var data = controller.grievanceList[i];
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                      '/grievance-details/${data['id']}',
                                    );
                                  },
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Reg No: ' +
                                                    data['registration_number'],
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                DateFormat('dd-MM-yyyy').format(
                                                  DateTime.parse(
                                                    data['created_at'],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Divider(),
                                          Row(
                                            children: [
                                              Text('Dept: ' +
                                                  data['department']
                                                      ['organization_name'])
                                            ],
                                          ),
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
