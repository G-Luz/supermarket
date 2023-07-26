import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class AppCardSkeletonLoading extends StatelessWidget {
  const AppCardSkeletonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: deviceHeight * .7,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 10,
        ),
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SkeletonLine(
                style: SkeletonLineStyle(
                  alignment: Alignment.center,
                  height: 180,
                  width: 170,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
