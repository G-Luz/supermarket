import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/modules/home/controller/home_controller.dart';
import 'package:supermarket_app/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeController())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const HomePage(),)
  ];

}