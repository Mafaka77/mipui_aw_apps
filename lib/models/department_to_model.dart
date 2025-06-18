class DepartmentToModel {
  final int id;
  final String organizationName;
  final String organizationCode;
  final String organizationType;
  final String organizationAddress;
  final String pincode;

  DepartmentToModel({
    required this.id,
    required this.organizationName,
    required this.organizationCode,
    required this.organizationType,
    required this.organizationAddress,
    required this.pincode,
  });

  factory DepartmentToModel.fromJson(Map<String, dynamic> json) {
    return DepartmentToModel(
      id: json['id'],
      organizationName: json['organization_name'],
      organizationCode: json['organization_code'],
      organizationType: json['organization_type'],
      organizationAddress: json['organization_address'],
      pincode: json['pincode'],
    );
  }
}
