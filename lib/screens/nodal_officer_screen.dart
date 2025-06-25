import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/profile_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NodalOfficerScreen extends GetView<ProfileController> {
  const NodalOfficerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nodal Officers',
          style: TextStyle(
              fontSize: 11.0, fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
        backgroundColor: MyColor.limeGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () => SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              height: Get.height - 100,
              child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: const WaterDropHeader(),
                onRefresh: controller.onRefresh,
                onLoading: controller.onLoading,
                controller: controller.refreshController,
                child: ListView.builder(
                  itemCount: controller.nodalOfficers.length,
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final official = controller.nodalOfficers[index];
                    return Card(
                      color: Colors.white,
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        title: Text(official.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(official.department!.organizationName!),
                            Text("Phone: ${official.mobile}"),
                            Text("Email: ${official.email}"),
                            Text(
                                "Status: ${official.active == 1 ? 'Active' : 'Inactive'}",
                                style: TextStyle(
                                  color: official.active == 1
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                        isThreeLine: true,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
