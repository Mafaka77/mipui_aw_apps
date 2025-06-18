class UserModel {
  final int id;
  final int roleId;
  final String name;
  final String email;
  final String mobile;
  final String gender;
  final String address;
  final String district;
  final int active;
  final String? designation;
  final String? emailVerifiedAt;
  final String? departmentId;
  final String? subDepartmentId;
  final String? pincode;
  final String? alternateMobile;
  final String? notification;
  final String? lastLogin;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.address,
    required this.district,
    required this.active,
    this.designation,
    this.emailVerifiedAt,
    this.departmentId,
    this.subDepartmentId,
    this.pincode,
    this.alternateMobile,
    this.notification,
    this.lastLogin,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      roleId: json['role_id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      gender: json['gender'],
      address: json['address'],
      district: json['district'],
      active: json['active'],
      designation: json['designation'],
      emailVerifiedAt: json['email_verified_at'],
      departmentId: json['department_id']?.toString(),
      subDepartmentId: json['sub_department_id']?.toString(),
      pincode: json['pincode']?.toString(),
      alternateMobile: json['alternate_mobile'],
      notification: json['notification'],
      lastLogin: json['last_login'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role_id': roleId,
      'name': name,
      'email': email,
      'mobile': mobile,
      'gender': gender,
      'address': address,
      'district': district,
      'active': active,
      'designation': designation,
      'email_verified_at': emailVerifiedAt,
      'department_id': departmentId,
      'sub_department_id': subDepartmentId,
      'pincode': pincode,
      'alternate_mobile': alternateMobile,
      'notification': notification,
      'last_login': lastLogin,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
