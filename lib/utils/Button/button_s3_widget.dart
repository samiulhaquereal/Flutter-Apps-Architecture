import 'package:admissionhelpline/Constand/colors_strings.dart';
import 'package:flutter/material.dart';

class ButtonS3 extends StatelessWidget {
  const ButtonS3({
    super.key,
    required this.text,
    required this.textcolor,
    required this.onTap,
  });

  final String text;
  final Color textcolor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(style:ElevatedButton.styleFrom(
          backgroundColor: tPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),onPressed: onTap,
            child: Text(text,style: TextStyle(color: textcolor),)));
  }
}