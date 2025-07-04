// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppealRegistrationModel {
  final int id;
  final String registration_number;
  AppealRegistrationModel({
    required this.id,
    required this.registration_number,
  });

  AppealRegistrationModel copyWith({
    int? id,
    String? registration_number,
  }) {
    return AppealRegistrationModel(
      id: id ?? this.id,
      registration_number: registration_number ?? this.registration_number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'registration_number': registration_number,
    };
  }

  factory AppealRegistrationModel.fromMap(Map<String, dynamic> map) {
    return AppealRegistrationModel(
      id: map['id'] as int,
      registration_number: map['registration_number'] as String,
    );
  }
  static List<AppealRegistrationModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) =>
            AppealRegistrationModel.fromMap(json as Map<String, dynamic>))
        .toList();
  }

  String toJson() => json.encode(toMap());

  factory AppealRegistrationModel.fromJson(String source) =>
      AppealRegistrationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => '$registration_number)';
  bool isEqual(AppealRegistrationModel model) {
    return id == model.id;
  }

  @override
  bool operator ==(covariant AppealRegistrationModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.registration_number == registration_number;
  }

  @override
  int get hashCode => id.hashCode ^ registration_number.hashCode;
}
