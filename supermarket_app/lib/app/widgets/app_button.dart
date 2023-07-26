import 'package:flutter/material.dart';
import 'package:supermarket_app/app/constants/app_colors.dart';
import 'package:supermarket_app/app/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.onPressedCallback,
    this.width,
    this.height = 50,
    this.borderRadius = 10,
    this.backgroundColor = AppColors.teal,
    this.textColor = AppColors.white,
    this.elevation = 5,
    this.border = BorderSide.none,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w700,
    this.enable = true,
  }) : super(key: key);

  final String text;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;
  final BorderSide border;
  final bool enable;
  final VoidCallback onPressedCallback;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: enable ? onPressedCallback : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              side: border,
            ),
          ),
          elevation: MaterialStateProperty.all(elevation),
        ),
        child: AppText(
          text: text,
          fontColor: textColor!,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
