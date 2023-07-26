import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/constants/app_colors.dart';
import 'package:supermarket_app/app/modules/products/product_details/controller/product_details_controller.dart';
import 'package:supermarket_app/app/widgets/app_button.dart';
import 'package:supermarket_app/app/widgets/app_text.dart';

class ProductsDetailsPage extends StatefulWidget {
  const ProductsDetailsPage({Key? key}) : super(key: key);

  @override
  _ProductsDetailsPageState createState() => _ProductsDetailsPageState();
}

class _ProductsDetailsPageState extends State<ProductsDetailsPage> {
  final controller = Modular.get<ProductDetailsController>();
  final routeArgs = Modular.args.data;

  @override
  void initState() {
    super.initState();
    controller.product = routeArgs?['product'];
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Observer(builder: (context) {
      return Scaffold(
        backgroundColor: const Color(0xFFF7F6F0),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF7F6F0),
          automaticallyImplyLeading: true,
          leading: GestureDetector(
            onTap: () => Modular.to.pop(),
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.black,
              size: 24,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.network(
                  controller.product!.base64Image,
                  width: 255,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 30),
              Divider(
                thickness: 1,
                color: AppColors.ltTeal.withOpacity(.3),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: controller.product!.name,
                        fontColor: AppColors.black,
                        fontSize: 30,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          const SizedBox(height: 10),
                          AppText(
                            text: controller.product!.rating.toString(),
                            fontColor: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppText(
                    text: '\$ ${controller.product!.price} / unit',
                    fontColor: AppColors.teal,
                    fontSize: 25,
                  ),
                ],
              ),
              Container(
                height: deviceHeight * .3,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: AppText(
                  text: controller.product!.description,
                  fontColor: AppColors.black,
                  textAlign: TextAlign.justify,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AppButton(
                text: controller.bagController.isAdminAccount
                    ? 'Editar produto'
                    : 'Adicionar ao carrinho',
                width: deviceWidth,
                backgroundColor: AppColors.ltTeal,
                onPressedCallback: controller.bagController.isAdminAccount
                    ? () => Modular.to.pushNamed(
                          '/newProduct/',
                          arguments: {
                            'product': controller.product,
                          },
                        )
                    : () {},
              ),
            ],
          ),
        ),
      );
    });
  }
}
