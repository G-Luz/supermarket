import 'package:json_annotation/json_annotation.dart';
import 'package:supermarket_app/app/modules/bag/domain/bag.dart';
import 'package:supermarket_app/app/modules/products/domain/product.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  final int? id;
  final int itemCount;
  final Product product;
  final Bag bag;

  Item({
    this.id,
    required this.itemCount,
    required this.product,
    required this.bag,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
