import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/modules/login/controller/login_controller.dart';
import 'package:supermarket_app/app/modules/login/login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => LoginController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const LoginPage()),
  ];
}
