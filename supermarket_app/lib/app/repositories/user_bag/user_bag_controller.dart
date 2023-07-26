import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:supermarket_app/app/constants/api_endpoints.dart';
import 'package:supermarket_app/app/modules/bag/domain/bag.dart';
import 'package:supermarket_app/app/modules/bag/domain/helpers/bag_helper.dart';
import 'package:supermarket_app/app/modules/bag/domain/items/item.dart';
import 'package:supermarket_app/app/modules/products/domain/product.dart';
import 'package:supermarket_app/app/modules/user_settings/domain/user.dart';
import 'package:supermarket_app/app/repositories/app_client/app_client_repository.dart';

part 'user_bag_controller.g.dart';

enum FetchItemsStatus { initial, loading, success, failure }

class UserBagController = UserBagControllerBase with _$UserBagController;

abstract class UserBagControllerBase with Store {
  final appClient = Modular.get<AppClientRepository>();

  @observable
  User? user;

  @observable
  FetchItemsStatus? fetchItemsStatus = FetchItemsStatus.initial;

  @observable
  Bag? bag;

  bool get isAdminAccount => user?.role.toUpperCase() == 'ADMIN';

  @observable
  bool isExtendedFab = false;

  @observable
  ObservableList<Item> itemsList = ObservableList<Item>();

  // ObservableList<Product> bagProductList = ObservableList<Product>();

  @action
  updateUserObject(User user) {
    this.user = user;
    bag = user.bag;
  }

  @action
  retrieveItemsOnUserBag() async {
    fetchItemsStatus = FetchItemsStatus.loading;

    print('vai chamar FI ==============');

    final items = await appClient.getLists(
      endpoint: ApiEndpoints.bagEndpoint,
      listMapper: BagHelper.mapToBagList,
      queryParameters: {'id': bag!.id},
    );

    print('DIZ AI O ITEMS: ${items.toString()}');
  }

  @action
  addItemOnBag(
    Product product, {
    int? productQuantity,
  }) async {
    isExtendedFab = true;
    Item? item;

    if (itemsList.isEmpty) {
      item = Item(
        product: product,
        itemCount: productQuantity ?? 1,
        bag: bag!,
      );
    } else {
      for (final it in itemsList) {
        if (it.product.id == product.id) {
          item = Item(
            id: it.id,
            product: product,
            itemCount: productQuantity ?? it.itemCount + 1,
            bag: bag!,
          );
        } else {
          item = Item(
            product: product,
            itemCount: productQuantity ?? 1,
            bag: bag!,
          );
        }
      }
    }
    itemsList.add(item!);
    await saveItemOnBag(item);
  }

  @action
  removeItemOnBag(Product product) {
    itemsList.remove(product);
  }

  saveItemOnBag(Item item) async {
    await appClient.post(
      endpoint: ApiEndpoints.itemsEndpoint,
      bodyMapper: item.toJson(),
    );
  }
}
