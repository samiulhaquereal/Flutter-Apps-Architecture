import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NeumorphismButton extends StatelessWidget {
  const NeumorphismButton({
    super.key, this.height, this.width, required this.color, required this.radius, required this.blurRadius, required this.TLshadowcolor,required this.BRshadowcolor, required this.child,
  });

  final double? height;
  final double? width;
  final double radius;
  final double blurRadius;
  final Color? color;
  final Color? TLshadowcolor;
  final Color? BRshadowcolor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: BRshadowcolor!,
              offset: const Offset(5,5),
              blurRadius: blurRadius,
              spreadRadius: Get.isDarkMode ? 3 : 2,
            ),
            BoxShadow(
              color: TLshadowcolor!,
              offset: const Offset(-4,-4),
              blurRadius: blurRadius,
              spreadRadius: 1,
            )
          ]
      ),
      child: child,
    );
  }
}