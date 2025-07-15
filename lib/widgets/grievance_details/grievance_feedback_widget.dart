import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:mipuiaw_apps/controllers/grievance_details_controller.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';

class GrievanceFeedbackWidget extends GetView<GrievanceDetailsController> {
  const GrievanceFeedbackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      dense: true,
      title: Text(''),
      leading: Text(
        'Grievance Feedback',
        style: TextStyle(color: MyColor.red),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                dense: true,
                title: Text(
                  'Comments: ',
                  style: TextStyle(color: MyColor.red, fontSize: 12),
                ),
                subtitle: Text(
                  controller.grievanceDetails['applicant_feedback'],
                  style: TextStyle(fontSize: 13),
                ),
              ),
              ListTile(
                dense: true,
                title: Text(
                  'Ratings: ',
                  style: TextStyle(color: MyColor.red, fontSize: 12),
                ),
                subtitle: Text(
                  controller.grievanceDetails['applicant_rating'] == '1'
                      ? 'Poor'
                      : controller.grievanceDetails['applicant_rating'] == '2'
                          ? 'Average'
                          : controller.grievanceDetails['applicant_rating'] ==
                                  '3'
                              ? 'Good'
                              : controller.grievanceDetails[
                                          'applicant_rating'] ==
                                      '4'
                                  ? 'Very Good'
                                  : controller.grievanceDetails[
                                              'applicant_rating'] ==
                                          '5'
                                      ? 'Excellent'
                                      : '',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
