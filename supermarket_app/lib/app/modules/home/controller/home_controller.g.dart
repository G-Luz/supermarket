// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$categoryStatusAtom =
      Atom(name: 'HomeControllerBase.categoryStatus', context: context);

  @override
  CategoryRequestStatus get categoryStatus {
    _$categoryStatusAtom.reportRead();
    return super.categoryStatus;
  }

  @override
  set categoryStatus(CategoryRequestStatus value) {
    _$categoryStatusAtom.reportWrite(value, super.categoryStatus, () {
      super.categoryStatus = value;
    });
  }

  late final _$fruitsCategoryCountAtom =
      Atom(name: 'HomeControllerBase.fruitsCategoryCount', context: context);

  @override
  int get fruitsCategoryCount {
    _$fruitsCategoryCountAtom.reportRead();
    return super.fruitsCategoryCount;
  }

  @override
  set fruitsCategoryCount(int value) {
    _$fruitsCategoryCountAtom.reportWrite(value, super.fruitsCategoryCount, () {
      super.fruitsCategoryCount = value;
    });
  }

  late final _$verduresCategoryCountAtom =
      Atom(name: 'HomeControllerBase.verduresCategoryCount', context: context);

  @override
  int get verduresCategoryCount {
    _$verduresCategoryCountAtom.reportRead();
    return super.verduresCategoryCount;
  }

  @override
  set verduresCategoryCount(int value) {
    _$verduresCategoryCountAtom.reportWrite(value, super.verduresCategoryCount,
        () {
      super.verduresCategoryCount = value;
    });
  }

  late final _$drinksCategoryCountAtom =
      Atom(name: 'HomeControllerBase.drinksCategoryCount', context: context);

  @override
  int get drinksCategoryCount {
    _$drinksCategoryCountAtom.reportRead();
    return super.drinksCategoryCount;
  }

  @override
  set drinksCategoryCount(int value) {
    _$drinksCategoryCountAtom.reportWrite(value, super.drinksCategoryCount, () {
      super.drinksCategoryCount = value;
    });
  }

  late final _$bakeryCategoryCountAtom =
      Atom(name: 'HomeControllerBase.bakeryCategoryCount', context: context);

  @override
  int get bakeryCategoryCount {
    _$bakeryCategoryCountAtom.reportRead();
    return super.bakeryCategoryCount;
  }

  @override
  set bakeryCategoryCount(int value) {
    _$bakeryCategoryCountAtom.reportWrite(value, super.bakeryCategoryCount, () {
      super.bakeryCategoryCount = value;
    });
  }

  late final _$retrieveProductsByCategoryAsyncAction = AsyncAction(
      'HomeControllerBase.retrieveProductsByCategory',
      context: context);

  @override
  Future<void> retrieveProductsByCategory() {
    return _$retrieveProductsByCategoryAsyncAction
        .run(() => super.retrieveProductsByCategory());
  }

  late final _$retrieveUserDataAsyncAction =
      AsyncAction('HomeControllerBase.retrieveUserData', context: context);

  @override
  Future retrieveUserData(String userEmail) {
    return _$retrieveUserDataAsyncAction
        .run(() => super.retrieveUserData(userEmail));
  }

  late final _$userLogoutAsyncAction =
      AsyncAction('HomeControllerBase.userLogout', context: context);

  @override
  Future<bool> userLogout() {
    return _$userLogoutAsyncAction.run(() => super.userLogout());
  }

  @override
  String toString() {
    return '''
categoryStatus: ${categoryStatus},
fruitsCategoryCount: ${fruitsCategoryCount},
verduresCategoryCount: ${verduresCategoryCount},
drinksCategoryCount: ${drinksCategoryCount},
bakeryCategoryCount: ${bakeryCategoryCount}
    ''';
  }
}
