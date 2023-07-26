import 'package:flutter/material.dart';
import 'package:supermarket_app/app/constants/app_colors.dart';
import 'package:supermarket_app/app/widgets/app_text.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({
    Key? key,
    required this.onFruitFilterCallback,
    required this.onVerduresFilterCallback,
    required this.onDrinksFilterCallback,
    required this.onBakeryFilterCallback,
  }) : super(key: key);

  final VoidCallback onFruitFilterCallback;
  final VoidCallback onVerduresFilterCallback;
  final VoidCallback onDrinksFilterCallback;
  final VoidCallback onBakeryFilterCallback;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 40,
      width: deviceWidth,
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: onFruitFilterCallback,
            child: const Filter(
              categoryName: 'Frutas',
              categoryImage: 'assets/images/fruit.png',
              categoryColor: AppColors.pink,
            ),
          ),
          GestureDetector(
            onTap: onVerduresFilterCallback,
            child: const Filter(
              categoryName: 'Vegetais',
              categoryImage: 'assets/images/broccoli.png',
              categoryColor: AppColors.ltTeal,
            ),
          ),
          GestureDetector(
            onTap: onDrinksFilterCallback,
            child: const Filter(
              categoryName: 'Bebidas',
              categoryImage: 'assets/images/drink.png',
              categoryColor: AppColors.ltBlue,
            ),
          ),
          GestureDetector(
            onTap: onBakeryFilterCallback,
            child: const Filter(
              categoryName: 'Padaria',
              categoryImage: 'assets/images/bakery.png',
              categoryColor: AppColors.brown,
            ),
          ),
        ],
      ),
    );
  }
}

class Filter extends StatelessWidget {
  const Filter({
    Key? key,
    required this.categoryImage,
    required this.categoryColor,
    required this.categoryName,
  }) : super(key: key);

  final String categoryName;
  final Color categoryColor;
  final String categoryImage;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: deviceWidth * .3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: categoryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categoryImage,
            width: 25,
            height: 25,
            fit: BoxFit.fill,
          ),
          const SizedBox(width: 10),
          AppText(text: categoryName),
        ],
      ),
    );
  }
}
