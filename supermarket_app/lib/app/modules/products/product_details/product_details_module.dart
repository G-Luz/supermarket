import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/modules/products/product_details/controller/product_details_controller.dart';
import 'package:supermarket_app/app/modules/products/product_details/products_details_page.dart';

class ProductDetailsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => ProductDetailsController())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const ProductsDetailsPage(),
    ),
  ];
}
