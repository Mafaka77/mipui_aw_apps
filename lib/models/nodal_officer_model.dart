import 'package:mipuiaw_apps/models/department_model.dart';

class NodalOfficerModel {
  final int id;
  final String name;
  final String email;
  final String mobile;
  final int active;
  final int departmentId;
  final DepartmentModel? department;

  NodalOfficerModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.active,
    required this.departmentId,
    this.department,
  });

  factory NodalOfficerModel.fromJson(Map<String, dynamic> json) {
    return NodalOfficerModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      active: json['active'],
      departmentId: json['department_id'],
      department: json['department'] != null
          ? DepartmentModel.fromJson(json['department'])
          : null,
    );
  }
  static List<NodalOfficerModel> fromJsonList(List list) {
    return list.map((e) => NodalOfficerModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'active': active,
      'department_id': departmentId,
      'department': department?.toJson(),
    };
  }
}
