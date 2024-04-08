// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscr;
  final TextEditingController controller;
  String? Function(String?)? validator;
  MyTextField(
      {super.key,
      required this.labelText,
      required this.validator,
      required this.controller,
      required this.hintText,
      required this.obscr});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscr,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: 18,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 16,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.tertiary.withOpacity(.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.purple[300]!,
            width: 2,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }
}
