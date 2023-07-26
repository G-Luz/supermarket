import 'package:supermarket_app/app/modules/bag/domain/bag.dart';

class BagHelper {
  static Bag mapToUserBag(Map<String, dynamic> json) {
    return Bag.fromJson(json);
  }

  static List<Bag> mapToBagList(List<dynamic> jsonList) =>
      jsonList.map((item) => Bag.fromJson(item)).toList(growable: false);
}
