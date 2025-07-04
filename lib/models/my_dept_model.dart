// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyDeptModel {
  final int id;
  final String? label;
  final String? colorcode;
  MyDeptModel({
    required this.id,
    this.label,
    this.colorcode,
  });

  MyDeptModel copyWith({
    int? id,
    String? label,
    String? colorcode,
  }) {
    return MyDeptModel(
      id: id ?? this.id,
      label: label ?? this.label,
      colorcode: colorcode ?? this.colorcode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
      'colorcode': colorcode,
    };
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(MyDeptModel model) {
    return id == model.id;
  }

  factory MyDeptModel.fromMap(Map<String, dynamic> map) {
    return MyDeptModel(
      id: map['id'] as int,
      label: map['label'] != null ? map['label'] as String : null,
      colorcode: map['colorcode'] != null ? map['colorcode'] as String : null,
    );
  }
  static List<MyDeptModel> fromJsonList(List list) {
    return list.map((e) => MyDeptModel.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory MyDeptModel.fromJson(String source) =>
      MyDeptModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MyDeptModel(id: $id, label: $label, colorcode: $colorcode)';

  @override
  bool operator ==(covariant MyDeptModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.label == label &&
        other.colorcode == colorcode;
  }

  @override
  int get hashCode => id.hashCode ^ label.hashCode ^ colorcode.hashCode;
}
