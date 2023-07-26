import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/constants/app_colors.dart';
import 'package:supermarket_app/app/repositories/user_bag/user_bag_controller.dart';
import 'package:supermarket_app/app/widgets/app_text.dart';

class AppFloatingButton extends StatefulWidget {
  const AppFloatingButton({Key? key}) : super(key: key);

  @override
  State<AppFloatingButton> createState() => _AppFloatingButtonState();
}

class _AppFloatingButtonState extends State<AppFloatingButton>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bagController = Modular.get<UserBagController>();

    return Observer(
      builder: (context) {
        // return FloatingActionButton.extended(
        //   onPressed: bagController.isAdminAccount
        //       ? () => Modular.to.pushNamed('/newProduct')
        //       : () {
        //           ///TODO: view bag
        //         },
        //   backgroundColor: AppColors.teal,
        //   elevation: 8,
        //   isExtended: bagController.isExtendedFab,
        //   // label: bagController.user?.role == 'ADMIN'
        //   //     ? const Icon(Icons.add)
        //       // :
        //       label: AnimatedSwitcher(
        //           duration: const Duration(seconds: 1),
        //           transitionBuilder:
        //               (Widget child, Animation<double> animation) =>
        //                   FadeTransition(
        //             opacity: animation,
        //             child: SizeTransition(
        //               sizeFactor: animation,
        //               axis: Axis.horizontal,
        //               child: child,
        //             ),
        //           ),
        //           child: bagController.isExtendedFab
        //               ? Row(
        //                   children: [
        //                     badges.Badge(
        //                       badgeContent: Text(
        //                         bagController.itemsList.length.toString(),
        //                         style: const TextStyle(color: Colors.white),
        //                       ),
        //                       showBadge: true,
        //                       shape: badges.BadgeShape.circle,
        //                       badgeColor: const Color(0xFFF9A27E),
        //                       elevation: 4,
        //                       padding: const EdgeInsetsDirectional.fromSTEB(
        //                           8, 8, 8, 8),
        //                       position: badges.BadgePosition.topEnd(),
        //                       animationType: badges.BadgeAnimationType.scale,
        //                       toAnimate: true,
        //                       child: const Icon(
        //                         Icons.shopping_bag_outlined,
        //                         color: AppColors.iceWhite,
        //                         size: 30,
        //                       ),
        //                     ),
        //                     const SizedBox(width: 20),
        //                     const AppText(text: 'Ver sacola')
        //                   ],
        //                 )
        //               : Text("PORRA")
        //         ),
        // );
        return FloatingActionButton.extended(
          onPressed: bagController.isAdminAccount
              ? () => Modular.to.pushNamed('/newProduct/')
              : () => Modular.to.pushNamed('/bag/'),
          backgroundColor: AppColors.teal,
          elevation: 8,
          label: bagController.user?.role == 'ADMIN'
              ? const Icon(Icons.add)
              : AnimatedSwitcher(
                  duration: const Duration(milliseconds: 700),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) =>
                          FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor: animation,
                      axis: Axis.horizontal,
                      child: child,
                    ),
                  ),
                  child: bagController.isExtendedFab
                      ? Row(
                          children: [
                            AppBadge(
                              text: bagController.itemsList.length.toString(),
                            ),
                            const SizedBox(width: 20),
                            const AppText(text: 'Ver sacola')
                          ],
                        )
                      : const AppBadge(
                          text: '0',
                        ),
                ),
        );
      },
    );
  }
}

class AppBadge extends StatelessWidget {
  const AppBadge({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: badges.Badge(
        badgeContent: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        showBadge: true,
        shape: badges.BadgeShape.circle,
        badgeColor: const Color(0xFFF9A27E),
        elevation: 4,
        padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        position: badges.BadgePosition.topEnd(),
        animationType: badges.BadgeAnimationType.scale,
        toAnimate: true,
        child: const Icon(
          Icons.shopping_bag_outlined,
          color: AppColors.iceWhite,
          size: 30,
        ),
      ),
    );
  }
}
