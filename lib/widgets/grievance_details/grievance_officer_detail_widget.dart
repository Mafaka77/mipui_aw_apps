import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/grievance_details_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';

class GrievanceOfficerDetailWidget extends GetView<GrievanceDetailsController> {
  const GrievanceOfficerDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      dense: true,
      title: Text(''),
      leading: Text(
        'Grievance Officer Details',
        style: TextStyle(color: MyColor.red),
      ),
      children: [
        ListTile(
          minTileHeight: 10,
          dense: true,
          leading: Text(
            'Officer Name: ',
            style: TextStyle(),
          ),
          title: Text(
            controller.grievanceDetails['officer_name'] ?? 'N/A',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          minTileHeight: 10,
          dense: true,
          leading: Text(
            'Designation: ',
            style: TextStyle(),
          ),
          title: Text(
            controller.grievanceDetails['officer_designation'] ?? 'N/A',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          minTileHeight: 10,
          dense: true,
          leading: Text(
            'Phone: ',
            style: TextStyle(),
          ),
          title: Text(
            controller.grievanceDetails['officer_mobile'] ?? 'N/A',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          minTileHeight: 10,
          dense: true,
          leading: Text(
            'Email: ',
            style: TextStyle(),
          ),
          title: Text(
            controller.grievanceDetails['officer_email'] ?? 'N/A',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
