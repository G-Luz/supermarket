// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as int?,
      itemCount: json['itemCount'] as int,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      bag: json['bag'] == null
          ? null
          : Bag.fromJson(json['bag'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'itemCount': instance.itemCount,
      'product': instance.product,
      'bag': instance.bag,
    };
