import 'package:supermarket_app/app/modules/products/domain/product.dart';

class ProductHelper {
  static Product mapToProduct(Map<String, dynamic> json) {
    return Product.fromJson(json);
  }

  static List<Product> mapToListProducts(List<dynamic> responseList) {
    return responseList
        .map((item) => Product.fromJson(item))
        .toList(growable: false);
  }
}
