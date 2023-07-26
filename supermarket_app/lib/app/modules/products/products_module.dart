import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/modules/products/controller/products_controller.dart';
import 'package:supermarket_app/app/modules/products/products_page.dart';

class ProductsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => ProductController())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const ProductsPage(),
    )
  ];
}
