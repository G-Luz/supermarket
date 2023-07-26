import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supermarket_app/app/modules/register_product/register_product_module.dart';
 
void main() {

  setUpAll(() {
    initModule(RegisterProductModule());
  });
}