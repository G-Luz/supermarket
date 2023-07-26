import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:supermarket_app/app/constants/api_endpoints.dart';
import 'package:supermarket_app/app/modules/bag/domain/bag.dart';
import 'package:supermarket_app/app/modules/bag/domain/helpers/bag_helper.dart';
import 'package:supermarket_app/app/modules/bag/domain/items/helper/item_helper.dart';
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

  @action
  updateUserObject(User user) {
    this.user = user;
    bag = user.bag;
  }

  @action
  retrieveItemsOnUserBag() async {
    fetchItemsStatus = FetchItemsStatus.loading;

    final items = await appClient.getLists(
      endpoint: ApiEndpoints.itemsEndpoint,
      listMapper: ItemHelper.mapToListItem,
      queryParameters: {'bagId': bag!.id},
    );

    if (items != null) {
      itemsList.addAll(items);
    }
    fetchItemsStatus = FetchItemsStatus.success;
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
  sumItemCount(Item item) {
    item = item.copyWith(itemCount: item.itemCount + 1);
    itemsList[itemsList.indexWhere((element) => element.id == item.id)] = item;
  }

  @action
  lessItemCount(Item item) {
    if ((item.itemCount - 1) <= 0) {
      item = item.copyWith(itemCount: 0);
    } else {
      item = item.copyWith(itemCount: item.itemCount - 1);
    }

    itemsList[itemsList.indexWhere((element) => element.id == item.id)] = item;
  }

  @action
  Future<bool> removeItemOnBag(Item item) async {
    final response = await appClient.delete(
      endpoint: ApiEndpoints.itemsEndpoint,
      bodyMapper: item.toJson(),
    );

    if (response != null) {
      itemsList.remove(item);
      return true;
    }
    return false;
  }

  saveItemOnBag(Item item) async {
    await appClient.post(
      endpoint: ApiEndpoints.itemsEndpoint,
      bodyMapper: item.toJson(),
    );
  }
}
