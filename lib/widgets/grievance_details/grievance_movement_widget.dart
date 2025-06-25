import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mipuiaw_apps/controllers/grievance_details_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';

class GrievanceMovementWidget extends GetView<GrievanceDetailsController> {
  const GrievanceMovementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      dense: true,
      title: Text(''),
      leading: Text(
        'Grievance Movement',
        style: TextStyle(color: MyColor.red),
      ),
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.grievanceDetails['grievance_movement'] != null
                ? controller.grievanceDetails['grievance_movement'].length
                : 0,
            itemBuilder: (c, i) {
              var data = controller.grievanceDetails['grievance_movement'][i];
              return Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 0,
                  color: Colors.grey[100],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        minTileHeight: 10,
                        dense: true,
                        leading: const Text(
                          'Date of Action: ',
                          style: TextStyle(fontSize: 10),
                        ),
                        title: Text(
                          data['date_of_action'] != null
                              ? DateFormat('dd MMM yyyy, hh:mm a').format(
                                  DateTime.parse(data['date_of_action']))
                              : 'N/A',
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        minTileHeight: 10,
                        dense: true,
                        leading: const Text(
                          'Department Action: ',
                          style: TextStyle(fontSize: 10),
                        ),
                        title: Text(
                          data['action']['label'],
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        minTileHeight: 10,
                        dense: true,
                        leading: const Text(
                          'Action Taken By: ',
                          style: TextStyle(fontSize: 10),
                        ),
                        title: Text(
                          data['action_taken_by'] ?? 'N/A',
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        minTileHeight: 10,
                        dense: true,
                        leading: const Text(
                          'From: ',
                          style: TextStyle(fontSize: 10),
                        ),
                        title: Text(
                          data['from']['name'] ??
                              data['from']['organization_name'] ??
                              'N/A',
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        minTileHeight: 10,
                        dense: true,
                        leading: const Text(
                          'To: ',
                          style: TextStyle(fontSize: 10),
                        ),
                        title: Text(
                          data['to']['organization_name'] ??
                              data['to']['name'] ??
                              'N/A',
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
      ],
    );
  }
}
