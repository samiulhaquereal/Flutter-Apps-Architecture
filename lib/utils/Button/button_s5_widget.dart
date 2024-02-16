import 'package:flutter/material.dart';

class ButtonS5 extends StatelessWidget {
  const ButtonS5({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    required this.size,
    required this.fontWeight,
  });

  final String text;
  final GestureTapCallback onTap;
  final Color? color;
  final double size;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          child: Text(text,style: TextStyle(fontSize: size,color: color,fontWeight: fontWeight),textAlign: TextAlign.center,)
      ),
    );
  }
}