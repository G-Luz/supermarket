import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:supermarket_app/app/constants/api_endpoints.dart';
import 'package:supermarket_app/app/modules/products/domain/helper/product_helper.dart';
import 'package:supermarket_app/app/modules/products/domain/product.dart';
import 'package:supermarket_app/app/modules/user_settings/domain/helper/user_helper.dart';
import 'package:supermarket_app/app/modules/user_settings/domain/user.dart';
import 'package:supermarket_app/app/repositories/app_client/app_client_repository.dart';
import 'package:supermarket_app/app/repositories/local_storage/local_storage_controller.dart';
import 'package:supermarket_app/app/repositories/user_bag/user_bag_controller.dart';

part 'home_controller.g.dart';

enum CategoryRequestStatus { initial, loading, success, failure }

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final bagController = Modular.get<UserBagController>();
  final localStorage = Modular.get<LocalStorageController>();
  final appClient = Modular.get<AppClientRepository>();

  @observable
  CategoryRequestStatus categoryStatus = CategoryRequestStatus.initial;

  @observable
  int fruitsCategoryCount = 0;
  @observable
  int verduresCategoryCount = 0;
  @observable
  int drinksCategoryCount = 0;
  @observable
  int bakeryCategoryCount = 0;

  initialFetchs(String email) async {
    categoryStatus = CategoryRequestStatus.loading;
    await retrieveUserData(email);
    await retrieveProductsByCategory();
    categoryStatus = CategoryRequestStatus.success;
  }

  @action
  Future<void> retrieveProductsByCategory() async {
    List<Product>? fruitsCategory = <Product>[];
    List<Product>? verduresCategory = <Product>[];
    List<Product>? drinksCategory = <Product>[];
    List<Product>? bakeryCategory = <Product>[];

    fruitsCategory = await appClient.getLists<List<Product>>(
      endpoint: bagController.isAdminAccount
          ? ApiEndpoints.productsEndpoint
          : '${ApiEndpoints.productsEndpoint}${ApiEndpoints.userActiveProducts}',
      listMapper: ProductHelper.mapToListProducts,
      queryParameters: {'category': 'fruits'},
    );

    verduresCategory = await appClient.getLists<List<Product>>(
      endpoint: bagController.isAdminAccount
          ? ApiEndpoints.productsEndpoint
          : '${ApiEndpoints.productsEndpoint}${ApiEndpoints.userActiveProducts}',
      listMapper: ProductHelper.mapToListProducts,
      queryParameters: {'category': 'verdures'},
    );
    drinksCategory = await appClient.getLists<List<Product>>(
      endpoint: bagController.isAdminAccount
          ? ApiEndpoints.productsEndpoint
          : '${ApiEndpoints.productsEndpoint}${ApiEndpoints.userActiveProducts}',
      listMapper: ProductHelper.mapToListProducts,
      queryParameters: {'category': 'drinks'},
    );
    bakeryCategory = await appClient.getLists<List<Product>>(
      endpoint: bagController.isAdminAccount
          ? ApiEndpoints.productsEndpoint
          : '${ApiEndpoints.productsEndpoint}${ApiEndpoints.userActiveProducts}',
      listMapper: ProductHelper.mapToListProducts,
      queryParameters: {'category': 'bakery'},
    );

    fruitsCategoryCount = fruitsCategory?.length ?? 0;
    verduresCategoryCount = verduresCategory?.length ?? 0;
    drinksCategoryCount = drinksCategory?.length ?? 0;
    bakeryCategoryCount = bakeryCategory?.length ?? 0;
  }

  @action
  retrieveUserData(String userEmail) async {
    final response = await appClient.get<User>(
      endpoint: '/users',
      jsonMapper: UserHelper.mapToUser,
      queryParameters: {'email': userEmail},
    );
    bagController.updateUserObject(response!);
  }

  @action
  Future<bool> userLogout() async {
    final result =
        await localStorage.removeValueByKey(localStorage.userEmailKey);
    bagController.user = null;
    return result;
  }
}
