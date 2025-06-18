import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/grievance_controller.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';

class GrievanceDetailsScreen extends GetView<GrievanceController> {
  const GrievanceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
