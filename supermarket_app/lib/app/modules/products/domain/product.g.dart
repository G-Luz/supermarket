// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      base64Image: json['base64Image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      enable: json['enable'] as bool,
      rating: (json['rating'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'base64Image': instance.base64Image,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'enable': instance.enable,
      'rating': instance.rating,
      'price': instance.price,
    };
