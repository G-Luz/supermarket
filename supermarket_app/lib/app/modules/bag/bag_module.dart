import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/modules/bag/bag_page.dart';

class BagModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const BagPage()),
  ];
}
