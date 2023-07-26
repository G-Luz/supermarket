import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/modules/user_settings/user_settings_page.dart';

class UserSettingsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const UserSettingsPage(),
    )
  ];
}
