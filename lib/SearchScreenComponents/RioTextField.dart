import 'package:flutter/material.dart';

class RioTextField extends StatelessWidget {
  RioTextField({
    required this.controller,
    required this.errorText,
    required this.hintText,
    required this.error,
  });

  final TextEditingController controller;
  final String errorText;
  final String hintText;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(14.0),
        errorText: error ? errorText : null,
        errorStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.indigo.shade900,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      maxLines: 1,
    );
  }
}
