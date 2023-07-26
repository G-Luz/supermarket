// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bag_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserBagController on UserBagControllerBase, Store {
  late final _$userAtom =
      Atom(name: 'UserBagControllerBase.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$fetchItemsStatusAtom =
      Atom(name: 'UserBagControllerBase.fetchItemsStatus', context: context);

  @override
  FetchItemsStatus? get fetchItemsStatus {
    _$fetchItemsStatusAtom.reportRead();
    return super.fetchItemsStatus;
  }

  @override
  set fetchItemsStatus(FetchItemsStatus? value) {
    _$fetchItemsStatusAtom.reportWrite(value, super.fetchItemsStatus, () {
      super.fetchItemsStatus = value;
    });
  }

  late final _$bagAtom =
      Atom(name: 'UserBagControllerBase.bag', context: context);

  @override
  Bag? get bag {
    _$bagAtom.reportRead();
    return super.bag;
  }

  @override
  set bag(Bag? value) {
    _$bagAtom.reportWrite(value, super.bag, () {
      super.bag = value;
    });
  }

  late final _$isExtendedFabAtom =
      Atom(name: 'UserBagControllerBase.isExtendedFab', context: context);

  @override
  bool get isExtendedFab {
    _$isExtendedFabAtom.reportRead();
    return super.isExtendedFab;
  }

  @override
  set isExtendedFab(bool value) {
    _$isExtendedFabAtom.reportWrite(value, super.isExtendedFab, () {
      super.isExtendedFab = value;
    });
  }

  late final _$itemsListAtom =
      Atom(name: 'UserBagControllerBase.itemsList', context: context);

  @override
  ObservableList<Item> get itemsList {
    _$itemsListAtom.reportRead();
    return super.itemsList;
  }

  @override
  set itemsList(ObservableList<Item> value) {
    _$itemsListAtom.reportWrite(value, super.itemsList, () {
      super.itemsList = value;
    });
  }

  late final _$retrieveItemsOnUserBagAsyncAction = AsyncAction(
      'UserBagControllerBase.retrieveItemsOnUserBag',
      context: context);

  @override
  Future retrieveItemsOnUserBag() {
    return _$retrieveItemsOnUserBagAsyncAction
        .run(() => super.retrieveItemsOnUserBag());
  }

  late final _$addItemOnBagAsyncAction =
      AsyncAction('UserBagControllerBase.addItemOnBag', context: context);

  @override
  Future addItemOnBag(Product product, {int? productQuantity}) {
    return _$addItemOnBagAsyncAction.run(
        () => super.addItemOnBag(product, productQuantity: productQuantity));
  }

  late final _$removeItemOnBagAsyncAction =
      AsyncAction('UserBagControllerBase.removeItemOnBag', context: context);

  @override
  Future<bool> removeItemOnBag(Item item) {
    return _$removeItemOnBagAsyncAction.run(() => super.removeItemOnBag(item));
  }

  late final _$UserBagControllerBaseActionController =
      ActionController(name: 'UserBagControllerBase', context: context);

  @override
  dynamic updateUserObject(User user) {
    final _$actionInfo = _$UserBagControllerBaseActionController.startAction(
        name: 'UserBagControllerBase.updateUserObject');
    try {
      return super.updateUserObject(user);
    } finally {
      _$UserBagControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sumItemCount(Item item) {
    final _$actionInfo = _$UserBagControllerBaseActionController.startAction(
        name: 'UserBagControllerBase.sumItemCount');
    try {
      return super.sumItemCount(item);
    } finally {
      _$UserBagControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic lessItemCount(Item item) {
    final _$actionInfo = _$UserBagControllerBaseActionController.startAction(
        name: 'UserBagControllerBase.lessItemCount');
    try {
      return super.lessItemCount(item);
    } finally {
      _$UserBagControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
fetchItemsStatus: ${fetchItemsStatus},
bag: ${bag},
isExtendedFab: ${isExtendedFab},
itemsList: ${itemsList}
    ''';
  }
}
