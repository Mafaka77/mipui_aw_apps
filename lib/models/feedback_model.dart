// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FeedbackModel {
  final int value;
  final String label;
  FeedbackModel({
    required this.value,
    required this.label,
  });

  FeedbackModel copyWith({
    int? value,
    String? label,
  }) {
    return FeedbackModel(
      value: value ?? this.value,
      label: label ?? this.label,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'label': label,
    };
  }

  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      value: map['value'] as int,
      label: map['label'] as String,
    );
  }
  static List<FeedbackModel> fromList(List<dynamic> list) {
    return list
        .map((item) => FeedbackModel.fromMap(item as Map<String, dynamic>))
        .toList();
  }

  String toJson() => json.encode(toMap());
  bool isEqual(FeedbackModel model) {
    return value == model.value && label == model.label;
  }

  factory FeedbackModel.fromJson(String source) =>
      FeedbackModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => ' $label';

  @override
  bool operator ==(covariant FeedbackModel other) {
    if (identical(this, other)) return true;

    return other.value == value && other.label == label;
  }

  @override
  int get hashCode => value.hashCode ^ label.hashCode;
}
