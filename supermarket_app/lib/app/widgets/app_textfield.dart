import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({
    Key? key,
    required this.onChanged,
    this.initialValue,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.enable = true,
    this.obscureText = true,
    this.suffixIcon,
  }) : super(key: key);

  final String? initialValue;
  final String? hint;
  final bool enable;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        enabled: enable,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
