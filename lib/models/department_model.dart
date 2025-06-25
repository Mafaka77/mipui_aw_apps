// ignore_for_file: public_member_api_docs, sort_constructors_first

class DepartmentModel {
  final int id;
  final String? organizationName;
  final String? label;
  final String? colorcode;
  DepartmentModel(
      {required this.id, this.organizationName, this.colorcode, this.label});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      id: json['id'] ?? 0,
      organizationName: json['organization_name'] ?? '',
      label: json['label'] ?? '',
      colorcode:
          json['colorcode'] ?? '#FFFFFF', // Default color if not provided
    );
  }
  static List<DepartmentModel> fromJsonList(List list) {
    return list.map((e) => DepartmentModel.fromJson(e)).toList();
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(DepartmentModel model) {
    return id == model.id;
  }

  @override
  String toString() => '$label';
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'organization_name': organizationName,
      'label': label,
      'colorcode': colorcode,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'organizationName': organizationName,
      'label': label,
      'colorcode': colorcode,
    };
  }

  factory DepartmentModel.fromMap(Map<String, dynamic> map) {
    return DepartmentModel(
      id: map['id'] as int,
      organizationName: map['organizationName'] as String,
      label: map['label'] as String,
      colorcode: map['colorcode'] as String,
    );
  }

  @override
  bool operator ==(covariant DepartmentModel other) {
    if (identical(this, other)) return true;
    return other.id == id && other.label == label;
  }

  @override
  int get hashCode =>
      id.hashCode ^ organizationName.hashCode ^ colorcode.hashCode;
}
