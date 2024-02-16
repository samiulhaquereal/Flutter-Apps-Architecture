import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    this.readOnly,
  });

  final TextEditingController controller;
  final String label;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: readOnly,
      //style: TextStyle(color: tBlackColor),
      keyboardType: TextInputType.phone,
      //obscureText: true, // It's for password
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.purple)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.purple)
          ),
          labelText: label,
          labelStyle: GoogleFonts.poppins()
      ),
      cursorColor: Colors.purple,
    );
  }
}