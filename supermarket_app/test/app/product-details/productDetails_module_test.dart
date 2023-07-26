import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supermarket_app/app/modules/products/product_details/product_details_module.dart';
 
void main() {

  setUpAll(() {
    initModule(ProductDetailsModule());
  });
}