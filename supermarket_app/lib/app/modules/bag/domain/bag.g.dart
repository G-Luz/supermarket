// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bag _$BagFromJson(Map<String, dynamic> json) => Bag(
      id: json['id'] as int?,
      itemCount: json['itemCount'] as int,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BagToJson(Bag instance) => <String, dynamic>{
      'id': instance.id,
      'itemCount': instance.itemCount,
      'totalPrice': instance.totalPrice,
      'items': instance.items,
    };
