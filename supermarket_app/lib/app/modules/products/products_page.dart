import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:skeletons/skeletons.dart';
import 'package:supermarket_app/app/constants/app_colors.dart';
import 'package:supermarket_app/app/modules/products/controller/products_controller.dart';
import 'package:supermarket_app/app/modules/products/widgets/app_item.dart';
import 'package:supermarket_app/app/modules/products/widgets/category_filter.dart';
import 'package:supermarket_app/app/widgets/app_card_skeleton_loading.dart';
import 'package:supermarket_app/app/widgets/app_floating_button.dart';
import 'package:supermarket_app/app/widgets/app_text.dart';
import 'package:supermarket_app/app/widgets/app_textfield.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final controller = Modular.get<ProductController>();
  final routeArgs = Modular.args.data;

  @override
  void initState() {
    super.initState();
    controller.initialCategory(routeArgs['category']);
    controller.retrieveProductsByCategory(controller.category!);
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.iceWhite,
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
      floatingActionButton: const AppFloatingButton(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(
                builder: (context) {
                  return Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(controller.categoryName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 35)),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Observer(
                builder: (context) {
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (controller.isLoadingStatus)
                          SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 50,
                              width: deviceWidth,
                            ),
                          )
                        else
                          AppTextfield(
                            hint: 'Pesquisar...',
                            suffixIcon: const Icon(Icons.search),
                            onChanged: (value) {},
                          ),
                        const SizedBox(height: 5),
                        if (controller.isLoadingStatus)
                          SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 20,
                              width: deviceWidth * .5,
                            ),
                          )
                        else
                          AppText(
                              text:
                                  '${controller.productsList.length} produtos encontrados',
                              fontColor: AppColors.ltTeal),
                        const SizedBox(height: 5),
                        if (controller.isLoadingStatus)
                          SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 50,
                              width: deviceWidth,
                            ),
                          )
                        else
                          CategoryFilter(
                            onFruitFilterCallback: () =>
                                controller.changeCategory(
                              ProductCategory.fruits,
                            ),
                            onVerduresFilterCallback: () =>
                                controller.changeCategory(
                              ProductCategory.verdures,
                            ),
                            onDrinksFilterCallback: () =>
                                controller.changeCategory(
                              ProductCategory.drinks,
                            ),
                            onBakeryFilterCallback: () =>
                                controller.changeCategory(
                              ProductCategory.bakery,
                            ),
                          ),
                        const SizedBox(height: 10),
                        if (controller.isLoadingStatus)
                          const Expanded(
                            child: AppCardSkeletonLoading(),
                          )
                        else
                          Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: controller.productsList.length,
                              itemBuilder: (context, index) {
                                return AppItem(
                                  product: controller.productsList[index],
                                  onTapCallback:
                                      controller.bagController.isAdminAccount
                                          ? () => Modular.to.pushNamed(
                                                '/newProduct/',
                                                arguments: {
                                                  'product': controller
                                                      .productsList[index],
                                                },
                                              )
                                          : () => Modular.to.pushNamed(
                                                '/productDetails/',
                                                arguments: {
                                                  'product': controller
                                                      .productsList[index],
                                                },
                                              ),
                                  onLongTapCallback: controller
                                          .bagController.isAdminAccount
                                      ? () => Modular.to.pushNamed(
                                            '/productDetails/',
                                            arguments: {
                                              'product': controller
                                                  .productsList[index],
                                            },
                                          )
                                      : () {
                                          controller.bagController.addItemOnBag(
                                              controller.productsList[index]);
                                        },
                                );
                              },
                            ),
                          ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
