import 'package:flutter/material.dart';
import 'package:supermarket_app/app/constants/app_colors.dart';

Future<void> showLoadingDialog(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: SizedBox(
          height: 70,
          width: 70,
          child: CircularProgressIndicator(
            color: AppColors.ltTeal,
          ),
        ),
      );
    },
  );
}
