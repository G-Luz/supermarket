// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterProductController on RegisterProductControllerBase, Store {
  late final _$editProductAtom =
      Atom(name: 'RegisterProductControllerBase.editProduct', context: context);

  @override
  Product? get editProduct {
    _$editProductAtom.reportRead();
    return super.editProduct;
  }

  @override
  set editProduct(Product? value) {
    _$editProductAtom.reportWrite(value, super.editProduct, () {
      super.editProduct = value;
    });
  }

  late final _$imageFileAtom =
      Atom(name: 'RegisterProductControllerBase.imageFile', context: context);

  @override
  XFile? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(XFile? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'RegisterProductControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$pictureAtom =
      Atom(name: 'RegisterProductControllerBase.picture', context: context);

  @override
  String get picture {
    _$pictureAtom.reportRead();
    return super.picture;
  }

  @override
  set picture(String value) {
    _$pictureAtom.reportWrite(value, super.picture, () {
      super.picture = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'RegisterProductControllerBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$priceAtom =
      Atom(name: 'RegisterProductControllerBase.price', context: context);

  @override
  String get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$categoryAtom =
      Atom(name: 'RegisterProductControllerBase.category', context: context);

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$enableSaveButtonAtom = Atom(
      name: 'RegisterProductControllerBase.enableSaveButton', context: context);

  @override
  bool get enableSaveButton {
    _$enableSaveButtonAtom.reportRead();
    return super.enableSaveButton;
  }

  @override
  set enableSaveButton(bool value) {
    _$enableSaveButtonAtom.reportWrite(value, super.enableSaveButton, () {
      super.enableSaveButton = value;
    });
  }

  late final _$selectProductImageAsyncAction = AsyncAction(
      'RegisterProductControllerBase.selectProductImage',
      context: context);

  @override
  Future selectProductImage({required bool isCameraImage}) {
    return _$selectProductImageAsyncAction
        .run(() => super.selectProductImage(isCameraImage: isCameraImage));
  }

  late final _$RegisterProductControllerBaseActionController =
      ActionController(name: 'RegisterProductControllerBase', context: context);

  @override
  dynamic onNameChanged(String name) {
    final _$actionInfo = _$RegisterProductControllerBaseActionController
        .startAction(name: 'RegisterProductControllerBase.onNameChanged');
    try {
      return super.onNameChanged(name);
    } finally {
      _$RegisterProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDescriptionChanged(String description) {
    final _$actionInfo =
        _$RegisterProductControllerBaseActionController.startAction(
            name: 'RegisterProductControllerBase.onDescriptionChanged');
    try {
      return super.onDescriptionChanged(description);
    } finally {
      _$RegisterProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPriceChanged(String price) {
    final _$actionInfo = _$RegisterProductControllerBaseActionController
        .startAction(name: 'RegisterProductControllerBase.onPriceChanged');
    try {
      return super.onPriceChanged(price);
    } finally {
      _$RegisterProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onCategoryChanged(String category) {
    final _$actionInfo = _$RegisterProductControllerBaseActionController
        .startAction(name: 'RegisterProductControllerBase.onCategoryChanged');
    try {
      return super.onCategoryChanged(category);
    } finally {
      _$RegisterProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateFields() {
    final _$actionInfo = _$RegisterProductControllerBaseActionController
        .startAction(name: 'RegisterProductControllerBase.validateFields');
    try {
      return super.validateFields();
    } finally {
      _$RegisterProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateFieldsWithEditProduct(Product product) {
    final _$actionInfo =
        _$RegisterProductControllerBaseActionController.startAction(
            name: 'RegisterProductControllerBase.updateFieldsWithEditProduct');
    try {
      return super.updateFieldsWithEditProduct(product);
    } finally {
      _$RegisterProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
editProduct: ${editProduct},
imageFile: ${imageFile},
name: ${name},
picture: ${picture},
description: ${description},
price: ${price},
category: ${category},
enableSaveButton: ${enableSaveButton}
    ''';
  }
}
