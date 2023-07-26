import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int? id;
  final String base64Image;
  final String name;
  final String description;
  final String category;
  final bool enable;
  final double rating;
  final double price;

  Product({
    this.id,
    required this.base64Image,
    required this.name,
    required this.description,
    required this.category,
    required this.enable,
    required this.rating,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
