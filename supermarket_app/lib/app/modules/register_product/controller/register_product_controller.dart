import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supermarket_app/app/constants/api_endpoints.dart';
import 'package:supermarket_app/app/modules/products/domain/helper/product_helper.dart';
import 'package:supermarket_app/app/modules/products/domain/product.dart';
import 'package:supermarket_app/app/repositories/app_client/app_client_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'register_product_controller.g.dart';

class RegisterProductController = RegisterProductControllerBase
    with _$RegisterProductController;

abstract class RegisterProductControllerBase with Store {
  final appClient = Modular.get<AppClientRepository>();
  final storage = FirebaseStorage.instance;
  final storageRef = FirebaseStorage.instance.ref();

  final ImagePicker picker = ImagePicker();

  final bucketImagePath = 'supermarket/images';

  @observable
  Product? editProduct;

  @observable
  XFile? imageFile;

  @observable
  String name = '';

  @observable
  String picture = '';

  @observable
  String description = '';

  @observable
  String price = '';

  @observable
  String category = 'fruits';

  @observable
  bool enableSaveButton = false;

  @action
  onNameChanged(String name) {
    this.name = name;
    validateFields();
  }

  @action
  onDescriptionChanged(String description) {
    this.description = description;
    validateFields();
  }

  @action
  onPriceChanged(String price) {
    this.price = price;
    validateFields();
  }

  @action
  onCategoryChanged(String category) {
    this.category = category;
    validateFields();
  }

  @action
  selectProductImage({required bool isCameraImage}) async {
    if (isCameraImage) {
      imageFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 30,
      );
    } else {
      imageFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 30,
      );
    }
    // final imageBytes = await imageFile!.readAsBytes();
    // picture = base64String(imageBytes);
    if (imageFile != null) {
      picture = imageFile!.path;
    }
    validateFields();
  }

  @action
  validateFields() {
    if (name.trim().isNotEmpty &&
        description.trim().isNotEmpty &&
        price.trim().isNotEmpty &&
        category.trim().isNotEmpty &&
        picture.trim().isNotEmpty) {
      enableSaveButton = true;
    }
  }

  Future<bool> disableProduct() async {
    print('diz o ID: ${editProduct!.id}');
    final response = await appClient.delete(
      endpoint: ApiEndpoints.productsEndpoint,
      queryMapper: {
        'id': editProduct!.id,
      },
    );

    if (response != null) {
      return true;
    }
    return false;
  }

  Future<bool> onSubmittedProduct() async {
    final imagesRef = storageRef.child(bucketImagePath);

    try {
      if (picture != '') {
        await imagesRef.putFile(File(picture));
      }

      picture = await imagesRef.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e);
    }

    final Product product;

    if (editProduct != null) {
      product = Product(
        id: editProduct!.id,
        base64Image: picture,
        name: name,
        description: description,
        category: category,
        rating: editProduct!.rating,
        enable: true,
        price: double.parse(price),
      );
    } else {
      product = Product(
        base64Image: picture,
        name: name,
        description: description,
        category: category,
        enable: true,
        rating: 0,
        price: double.parse(price),
      );
    }

    final response = await appClient.mappedPost<Product>(
      endpoint: ApiEndpoints.productsEndpoint,
      jsonMapper: ProductHelper.mapToProduct,
      bodyMapper: product.toJson(),
    );

    print('ME DIZ A REPONSE: ${response}');

    if (response != null) {
      return true;
    }
    return false;
  }

  @action
  updateFieldsWithEditProduct(Product product) {
    name = product.name;
    description = product.description;
    price = product.price.toString();
    category = product.category;
    enableSaveButton = true;
  }
}
