import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/constants/app_colors.dart';
import 'package:supermarket_app/app/modules/register_product/controller/register_product_controller.dart';
import 'package:supermarket_app/app/modules/register_product/widgets/app_option_image.dart';
import 'package:supermarket_app/app/widgets/app_loading_dialog.dart';
import 'package:supermarket_app/app/widgets/app_text.dart';
import 'package:supermarket_app/app/widgets/app_textfield.dart';
import 'package:supermarket_app/app/widgets/app_toast.dart';

class RegisterProductPage extends StatefulWidget {
  const RegisterProductPage({Key? key}) : super(key: key);

  @override
  _RegisterProductPageState createState() => _RegisterProductPageState();
}

class _RegisterProductPageState extends State<RegisterProductPage> {
  final controller = Modular.get<RegisterProductController>();

  final routeArgs = Modular.args.data;

  @override
  void initState() {
    super.initState();
    controller.editProduct = routeArgs?['product'];
    if (controller.editProduct != null) {
      controller.updateFieldsWithEditProduct(controller.editProduct!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.iceWhite,
          appBar: AppBar(
            backgroundColor: AppColors.iceWhite,
            automaticallyImplyLeading: true,
            leading: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
              child: IconButton(
                onPressed: () => Modular.to.pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
            actions: [
              if (controller.editProduct != null)
                IconButton(
                  onPressed: () async {
                    final result = await controller.disableProduct();
                    if (result) {
                      showToast('Produto desativado com sucesso!');
                    } else {
                      showToast(
                          'Houve um erro ao tentar desativar seu produto!');
                    }
                  },
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: AppColors.teal,
                    size: 30,
                  ),
                ),
              IconButton(
                onPressed: controller.enableSaveButton
                    ? () async {
                        showLoadingDialog(context);
                        final result = await controller.onSubmittedProduct();

                        Modular.to.pop();
                        if (result) {
                          showToast('Produto cadastrado com sucesso!');
                          Modular.to.pop();
                        } else {
                          showToast(
                              'Erro ao cadastrar o produto. Tente novamente mais tarde');
                        }
                      }
                    : null,
                icon: Icon(
                  Icons.check,
                  color: controller.enableSaveButton
                      ? AppColors.teal
                      : Colors.grey,
                  size: 30,
                ),
              ),
            ],
            centerTitle: true,
            elevation: 0,
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (controller.editProduct != null &&
                    controller.imageFile == null)
                  Center(
                    child: Image.network(
                      controller.editProduct!.base64Image,
                      width: 150,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                  )
                else
                  Center(
                    child: controller.imageFile != null
                        ? Image.file(
                            File(controller.imageFile!.path),
                            width: 150,
                            height: 150,
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            'assets/images/gallery.png',
                            width: 150,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                  ),
                const SizedBox(height: 30),
                const AppText(
                    text: 'Selecione uma imagem',
                    fontColor: AppColors.ltTeal,
                    fontSize: 17),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          controller.selectProductImage(isCameraImage: true),
                      child: const AppOptionImage(
                        icon: Icons.camera,
                        title: 'Camera',
                      ),
                    ),
                    const SizedBox(width: 50),
                    GestureDetector(
                      onTap: () =>
                          controller.selectProductImage(isCameraImage: false),
                      child: const AppOptionImage(
                        icon: Icons.photo,
                        title: 'Galeria',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  thickness: 1,
                  color: AppColors.ltTeal.withOpacity(.3),
                ),
                const SizedBox(height: 20),
                AppTextfield(
                  hint: 'Nome',
                  initialValue: controller.name,
                  onChanged: (value) => controller.onNameChanged(value),
                ),
                const SizedBox(height: 20),
                AppTextfield(
                  hint: 'Descrição',
                  initialValue: controller.description,
                  onChanged: (value) => controller.onDescriptionChanged(value),
                ),
                const SizedBox(height: 20),
                AppTextfield(
                  hint: 'Preço',
                  initialValue: controller.price,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => controller.onPriceChanged(value),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: deviceWidth * .8,
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    hint: const AppText(
                      text: 'Selecione uma categoria para o produto',
                      fontColor: AppColors.teal,
                    ),
                    isExpanded: true,
                    value: controller.category,
                    items: const [
                      DropdownMenuItem(
                        value: 'fruits',
                        child: AppText(
                          text: 'Frutas',
                          fontSize: 17,
                          fontColor: AppColors.ltTeal,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'verdures',
                        child: AppText(
                          text: 'Verduras',
                          fontSize: 17,
                          fontColor: AppColors.ltTeal,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'drinks',
                        child: AppText(
                          text: 'Bebidas',
                          fontSize: 17,
                          fontColor: AppColors.ltTeal,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'bakery',
                        child: AppText(
                          text: 'Padaria',
                          fontSize: 17,
                          fontColor: AppColors.ltTeal,
                        ),
                      ),
                    ],
                    onChanged: (value) => controller.onCategoryChanged(value!),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
