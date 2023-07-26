import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/modules/signup/controller/signup_controller.dart';
import 'package:supermarket_app/app/modules/signup/signup_page.dart';

class SignupModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SignupController())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SignupPage(),),
  ];

}