import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final IconData prefixIcon;
  final String? hint;
  final TextInputType textInputType;
  final bool obscureText;
  final bool autoCorrect;

  const CustomInput({
    super.key,
    required this.prefixIcon,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.autoCorrect = false,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 5),
            blurRadius: 5,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        autocorrect: autoCorrect,
        keyboardType: TextInputType.emailAddress,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }
}
