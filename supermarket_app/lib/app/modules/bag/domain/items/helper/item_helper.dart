import 'package:supermarket_app/app/modules/bag/domain/items/item.dart';

class ItemHelper {
  static Item mapToItem(Map<String, dynamic> json) {
    return Item.fromJson(json);
  }
}
