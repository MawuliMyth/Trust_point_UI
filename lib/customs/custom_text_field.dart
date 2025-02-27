import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300], // Light grey background
        hintText: hintText, // Disappears when typing
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Rounded borders
          borderSide: BorderSide.none, // Removes default border
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your ${hintText.toLowerCase()}";
        }
        return null;
      },
    );
  }
}
