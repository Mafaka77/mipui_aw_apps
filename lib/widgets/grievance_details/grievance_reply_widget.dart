import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/grievance_details_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';

class GrievanceReplyWidget extends GetView<GrievanceDetailsController> {
  const GrievanceReplyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      dense: true,
      leading: Text(
        'Grievance Reply',
        style: TextStyle(color: MyColor.red),
      ),
      title: const Text(''),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Replied from the concerned department:',
                style: TextStyle(
                    color: MyColor.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              const SizedBox(height: 10),
              Text(
                controller.grievanceDetails['final_remark'] ??
                    'No reply available',
                style: const TextStyle(color: Colors.black87, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
