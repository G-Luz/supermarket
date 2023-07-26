import 'package:flutter/material.dart';
import 'package:supermarket_app/app/constants/app_colors.dart';
import 'package:supermarket_app/app/widgets/app_text.dart';

class AppOptionImage extends StatelessWidget {
  const AppOptionImage({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.ltTeal,
            size: 30,
          ),
          const SizedBox(height: 5),
          AppText(
            text: title,
            fontColor: AppColors.black,
          ),
        ],
      ),
    );
  }
}
