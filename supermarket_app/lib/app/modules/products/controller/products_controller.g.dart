// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on ProductControllerBase, Store {
  late final _$categoryAtom =
      Atom(name: 'ProductControllerBase.category', context: context);

  @override
  ProductCategory? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(ProductCategory? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$productRequestStatusAtom = Atom(
      name: 'ProductControllerBase.productRequestStatus', context: context);

  @override
  ProductRequestStatus get productRequestStatus {
    _$productRequestStatusAtom.reportRead();
    return super.productRequestStatus;
  }

  @override
  set productRequestStatus(ProductRequestStatus value) {
    _$productRequestStatusAtom.reportWrite(value, super.productRequestStatus,
        () {
      super.productRequestStatus = value;
    });
  }

  late final _$categoryNameAtom =
      Atom(name: 'ProductControllerBase.categoryName', context: context);

  @override
  String get categoryName {
    _$categoryNameAtom.reportRead();
    return super.categoryName;
  }

  @override
  set categoryName(String value) {
    _$categoryNameAtom.reportWrite(value, super.categoryName, () {
      super.categoryName = value;
    });
  }

  late final _$productsListAtom =
      Atom(name: 'ProductControllerBase.productsList', context: context);

  @override
  ObservableList<Product> get productsList {
    _$productsListAtom.reportRead();
    return super.productsList;
  }

  @override
  set productsList(ObservableList<Product> value) {
    _$productsListAtom.reportWrite(value, super.productsList, () {
      super.productsList = value;
    });
  }

  late final _$retrieveProductsByCategoryAsyncAction = AsyncAction(
      'ProductControllerBase.retrieveProductsByCategory',
      context: context);

  @override
  Future retrieveProductsByCategory(ProductCategory category) {
    return _$retrieveProductsByCategoryAsyncAction
        .run(() => super.retrieveProductsByCategory(category));
  }

  late final _$ProductControllerBaseActionController =
      ActionController(name: 'ProductControllerBase', context: context);

  @override
  dynamic initialCategory(String category) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.initialCategory');
    try {
      return super.initialCategory(category);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCategory(ProductCategory category) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.changeCategory');
    try {
      return super.changeCategory(category);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category},
productRequestStatus: ${productRequestStatus},
categoryName: ${categoryName},
productsList: ${productsList}
    ''';
  }
}
