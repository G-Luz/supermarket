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

class AppListSkeletonLoading extends StatelessWidget {
  const AppListSkeletonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: deviceHeight * .7,
      width: deviceWidth,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey.withOpacity(.5),
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            children: [
              const SkeletonLine(
                style: SkeletonLineStyle(
                  width: 70,
                  height: 70,
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: deviceWidth * .5,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 40,
                      ),
                    ),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 20,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 40,
                    width: deviceWidth * .1,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
