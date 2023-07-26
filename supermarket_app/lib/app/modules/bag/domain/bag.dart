import 'package:json_annotation/json_annotation.dart';
import 'package:supermarket_app/app/modules/bag/domain/items/item.dart';

part 'bag.g.dart';

@JsonSerializable()
class Bag {
  final int? id;
  final int itemCount;
  final double totalPrice;

  // @JsonKey(
  //   includeFromJson: false,
  //   includeToJson: true,
  // )
  // final User? user;

  final List<Item>? items;

  Bag({
    this.id,
    required this.itemCount,
    required this.totalPrice,
    // this.user,
    this.items,
  });

  factory Bag.fromJson(Map<String, dynamic> json) => _$BagFromJson(json);

  Map<String, dynamic> toJson() => _$BagToJson(this);
}
