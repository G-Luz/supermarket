import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/modules/register_product/controller/register_product_controller.dart';
import 'package:supermarket_app/app/modules/register_product/register_product_page.dart';

class RegisterProductModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => RegisterProductController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const RegisterProductPage(),
    )
  ];
}
