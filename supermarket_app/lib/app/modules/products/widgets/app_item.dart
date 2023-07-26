import 'package:flutter/material.dart';
import 'package:supermarket_app/app/constants/app_colors.dart';
import 'package:supermarket_app/app/modules/products/domain/product.dart';

class AppItem extends StatelessWidget {
  const AppItem({
    Key? key,
    required this.product,
    required this.onTapCallback,
    required this.onLongTapCallback,
  }) : super(key: key);

  final Product product;
  final VoidCallback onTapCallback;
  final VoidCallback onLongTapCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      ///TODO: PASSING ID FOR SEARCH PRODUCT
      // onTap: () => Modular.to.pushNamed('/productDetails'),
      onTap: onTapCallback,

      ///TODO: LONG PRESS INSERT IN KART
      onLongPress: onLongTapCallback,
      child: Container(
        width: 180,
        height: 170,
        decoration: BoxDecoration(
          color: product.enable ? Color(0xFFEDEBE2) : AppColors.teal.withOpacity(.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.base64Image,
                  width: 85,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 1),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F6F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Text(
                          '\$ ${product.price}',
                          style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFF468589),
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
