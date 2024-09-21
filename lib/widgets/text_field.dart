import 'package:flutter/material.dart';
import 'package:colipar/styles/colors.dart';
import 'package:colipar/styles/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final FocusNode? focusNode;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false, this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode ?? FocusNode(),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.bodyText1.copyWith(fontSize: 14),
        prefixIcon: Icon(icon, color: AppColors.gray),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue, width: 2),
        ),
      ),
    );
  }
}
