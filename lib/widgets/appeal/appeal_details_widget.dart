import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mipuiaw_apps/controllers/appeal_details_controller.dart';

class AppealDetailsWidget extends GetView<AppealDetailsController> {
  const AppealDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ExpansionTile(
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        onExpansionChanged: (bool expanded) {
          controller.isTileExpanded.value = expanded;
        },
        collapsedShape: RoundedRectangleBorder(
          side: BorderSide(
            color:
                controller.isTileExpanded.value ? Colors.white : Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color:
                controller.isTileExpanded.value ? Colors.white : Colors.white,
          ),
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        dense: true,
        title: Text(
          '${controller.appealDetails['appeal_number'] ?? 'N/A'}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Card(
            elevation: 0,
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  dense: true,
                  title: const Text(
                    'Appeal Reason:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  subtitle: Text(
                    controller.appealDetails['appealQuestion'] ?? 'N/A',
                  ),
                ),
                ListTile(
                  dense: true,
                  title: const Text(
                    'Appeal Date:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  subtitle: Text(
                    DateFormat('dd-MM-yyyy').format(
                      DateTime.tryParse(
                              controller.appealDetails['date_of_action'] ??
                                  '') ??
                          DateTime.now(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
