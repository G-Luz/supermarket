import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:supermarket_app/app/constants/api_endpoints.dart';
import 'package:supermarket_app/app/modules/products/domain/helper/product_helper.dart';
import 'package:supermarket_app/app/modules/products/domain/product.dart';
import 'package:supermarket_app/app/repositories/app_client/app_client_repository.dart';
import 'package:supermarket_app/app/repositories/user_bag/user_bag_controller.dart';
import 'package:supermarket_app/app/utils/string_utils.dart';

part 'products_controller.g.dart';

enum ProductCategory { fruits, verdures, drinks, bakery }

enum ProductRequestStatus { initial, loading, success, failure }

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {
  final appClient = Modular.get<AppClientRepository>();
  final bagController = Modular.get<UserBagController>();

  @observable
  ProductCategory? category;

  @observable
  ProductRequestStatus productRequestStatus = ProductRequestStatus.initial;

  @observable
  String categoryName = '';

  @observable
  ObservableList<Product> productsList = ObservableList<Product>();

  bool get isLoadingStatus =>
      productRequestStatus == ProductRequestStatus.loading;

  @action
  initialCategory(String category) {
    switch (category) {
      case 'fruits':
        this.category = ProductCategory.fruits;
        categoryName = 'Frutas';
        break;
      case 'verdures':
        this.category = ProductCategory.verdures;
        categoryName = 'Verduras';
        break;
      case 'drinks':
        this.category = ProductCategory.drinks;
        categoryName = 'Bebidas';
        break;
      case 'bakery':
        this.category = ProductCategory.bakery;
        categoryName = 'Padaria';
        break;
    }
  }

  @action
  changeCategory(ProductCategory category) {
    this.category = category;
    categoryName = category.name.categoryNameByEnum(category);
    retrieveProductsByCategory(category);
  }

  @action
  retrieveProductsByCategory(ProductCategory category) async {
    print('SÓ INSTANTE: ${bagController.isAdminAccount}');

    productRequestStatus = ProductRequestStatus.loading;
    final response = await appClient.getLists(
      endpoint: bagController.isAdminAccount
          ? ApiEndpoints.productsEndpoint
          : '${ApiEndpoints.productsEndpoint}${ApiEndpoints.userActiveProducts}',
      listMapper: ProductHelper.mapToListProducts,
      queryParameters: {
        'category': category.name.categoryEnumToString(category),
      },
    );
    if (productsList.isNotEmpty) {
      productsList.clear();
    }
    if (response != null) {
      for (final prod in response) {
        productsList.add(prod);
      }
    }
    productRequestStatus = ProductRequestStatus.success;
  }
}
