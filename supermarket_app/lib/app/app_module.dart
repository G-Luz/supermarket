import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/modules/bag/bag_module.dart';
import 'package:supermarket_app/app/modules/home/home_module.dart';
import 'package:supermarket_app/app/modules/login/login_module.dart';
import 'package:supermarket_app/app/modules/products/product_details/product_details_module.dart';
import 'package:supermarket_app/app/modules/products/products_module.dart';
import 'package:supermarket_app/app/modules/register_product/register_product_module.dart';
import 'package:supermarket_app/app/modules/signup/signup_module.dart';
import 'package:supermarket_app/app/repositories/app_client/app_client_repository.dart';
import 'package:supermarket_app/app/repositories/local_storage/local_storage_controller.dart';
import 'package:supermarket_app/app/repositories/user_bag/user_bag_controller.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => LocalStorageController()),
        Bind.singleton((i) => UserBagController()),
        Bind.singleton((i) => AppClientRepository())
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/login/', module: LoginModule()),
        ModuleRoute('/signup', module: SignupModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/products', module: ProductsModule()),
        ModuleRoute('/productDetails', module: ProductDetailsModule()),
        ModuleRoute('/newProduct', module: RegisterProductModule()),
        ModuleRoute('/bag', module: BagModule()),
      ];
}
