// custom_text_field.dart
import 'package:flutter/material.dart';
import 'package:colipar/styles/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({
    Key? key,
    required this.text, required this.onTap,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.blue,
                    ),
                    child: Center(
                      child:  Text(
                        text,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
    );
  }
}
