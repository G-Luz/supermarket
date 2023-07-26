import 'package:supermarket_app/app/modules/products/controller/products_controller.dart';

extension StringUtils on String {
  ProductCategory categoryStringToEnum() {
    switch (this) {
      case 'fruits':
        return ProductCategory.fruits;
      case 'verdures':
        return ProductCategory.verdures;
      case 'drinks':
        return ProductCategory.drinks;
      default:
        return ProductCategory.bakery;
    }
  }

  String categoryEnumToString(ProductCategory enumCategory) {
    switch (enumCategory) {
      case ProductCategory.fruits:
        return 'fruits';
      case ProductCategory.verdures:
        return 'verdures';
      case ProductCategory.drinks:
        return 'drinks';
      default:
        return 'bakery';
    }
  }
  
  String categoryNameByEnum(ProductCategory enumCategory) {
    switch (enumCategory) {
      case ProductCategory.fruits:
        return 'Frutas';
      case ProductCategory.verdures:
        return 'Verduras';
      case ProductCategory.drinks:
        return 'Bebidas';
      default:
        return 'Padaria';
    }
  }
}
