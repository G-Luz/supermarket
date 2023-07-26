import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:supermarket_app/app/modules/products/domain/product.dart';
import 'package:supermarket_app/app/repositories/user_bag/user_bag_controller.dart';

part 'product_details_controller.g.dart';

class ProductDetailsController = ProductDetailsControllerBase
    with _$ProductDetailsController;

abstract class ProductDetailsControllerBase with Store {
  final bagController = Modular.get<UserBagController>();
  
  @observable
  Product? product;
}
