import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/constants/app_colors.dart';
import 'package:supermarket_app/app/modules/home/controller/home_controller.dart';
import 'package:supermarket_app/app/modules/home/widgets/app_card_item.dart';
import 'package:supermarket_app/app/widgets/app_card_skeleton_loading.dart';
import 'package:supermarket_app/app/widgets/app_floating_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Modular.get<HomeController>();
  final routeArgs = Modular.args.data;

  @override
  void initState() {
    super.initState();
    controller.initialFetchs(routeArgs['email']);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: AppColors.iceWhite,
        floatingActionButton: AppFloatingButton(),
        drawer: const Drawer(
          elevation: 2,
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF7F6F0),
          automaticallyImplyLeading: true,
          leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Container(
                width: 150,
                height: 150,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/982/600',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          actions: [
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                  child: IconButton(
                    onPressed: () async {
                      if (await controller.userLogout()) {
                        Modular.to.pushReplacementNamed('/login/');
                      }
                    },
                    icon: const Icon(
                      Icons.exit_to_app_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text('Categorias',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 35)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Container(
                    width: 367,
                    height: 95,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF468589),
                          Color(0xFF24585C),
                        ],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0.34, -1),
                        end: AlignmentDirectional(-0.34, 1),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15, 0, 15, 0),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(0x00FFFFFF),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/supermaket.png',
                                  ).image,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Delivery de produtos',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFFF9A27E),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(height: 2),
                                Text(
                                  'Pronto para pedidos 24/7',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Observer(builder: (context) {
                  if (controller.categoryStatus ==
                      CategoryRequestStatus.loading) {
                    return const Expanded(
                      child: AppCardSkeletonLoading(),
                    );
                  }

                  return Column(
                    children: [
                      const Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                          child: Text(
                            '4 Categorias encontradas',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Readex Pro',
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppCardItem(
                              title: 'Frutas',
                              productCount:
                                  controller.fruitsCategoryCount.toString(),
                              image: 'assets/images/fruit.png',
                              onTapCallback: () => Modular.to.pushNamed(
                                '/products',
                                arguments: {'category': 'fruits'},
                              ),
                            ),
                            AppCardItem(
                              title: 'Verduras',
                              productCount:
                                  controller.verduresCategoryCount.toString(),
                              image: 'assets/images/broccoli.png',
                              onTapCallback: () => Modular.to.pushNamed(
                                '/products',
                                arguments: {'category': 'verdures'},
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppCardItem(
                              title: 'Bebidas',
                              productCount:
                                  controller.drinksCategoryCount.toString(),
                              image: 'assets/images/drink.png',
                              onTapCallback: () => Modular.to.pushNamed(
                                '/products',
                                arguments: {'category': 'drinks'},
                              ),
                            ),
                            AppCardItem(
                              title: 'Padaria',
                              productCount:
                                  controller.bakeryCategoryCount.toString(),
                              image: 'assets/images/bakery.png',
                              onTapCallback: () => Modular.to.pushNamed(
                                '/products',
                                arguments: {'category': 'bakery'},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
