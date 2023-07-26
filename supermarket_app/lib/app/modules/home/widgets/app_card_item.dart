import 'package:flutter/material.dart';

class AppCardItem extends StatelessWidget {
  const AppCardItem({
    Key? key,
    required this.title,
    required this.productCount,
    required this.image,
    required this.onTapCallback,
  }) : super(key: key);

  final String title;
  final String productCount;
  final String image;
  final VoidCallback onTapCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Container(
        width: 180,
        height: 170,
        decoration: BoxDecoration(
          color: const Color(0xFFEDEBE2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  // ,
                  image,
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
                          title,
                          style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Text(
                          '$productCount produtos',
                          style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFF468589),
                            fontSize: 13,
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
