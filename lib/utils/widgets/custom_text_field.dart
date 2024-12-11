import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  final VoidCallback? onPressedSuffixIcon;
  final ValueChanged<String>? onChanged;
 CustomTextField({super.key,required this.controller,
  this.suffixIcon,
  this.prefixIcon,
  this.labelText,
  this.hintText,
  this.onPressedSuffixIcon,
  this.obscureText,
  this.onChanged

  });

  @override
  Widget build(BuildContext context) =>
  TextFormField(
    controller: controller,
    obscureText: obscureText??false,
    onChanged: onChanged,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon:prefixIcon !=null?Icon(prefixIcon):null,
      suffixIcon: suffixIcon!=null?IconButton(onPressed: 
      onPressedSuffixIcon,
      icon: Icon(suffixIcon),):null,
      contentPadding:const EdgeInsets.all(25),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none
      ),
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none
      )

    ),
  );
}