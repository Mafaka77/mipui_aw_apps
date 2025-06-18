// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CarouselModel {
  int? id;
  String? image;
  CarouselModel({
    this.id,
    this.image,
  });

  CarouselModel copyWith({
    int? id,
    String? image,
  }) {
    return CarouselModel(
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
    };
  }

  factory CarouselModel.fromMap(Map<String, dynamic> map) {
    return CarouselModel(
      id: map['id'] != null ? map['id'] as int : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }
  static List<CarouselModel> fromJsonList(List list) {
    return list.map((e) => CarouselModel.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory CarouselModel.fromJson(String source) =>
      CarouselModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CarouselModel(id: $id, image: $image)';

  @override
  bool operator ==(covariant CarouselModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode;
}
