import 'package:admissionhelpline/Constand/size_strings.dart';
import 'package:admissionhelpline/Utils/Neumorphism/neumorphism_widget.dart';
import 'package:admissionhelpline/Utils/Theme/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ButtonS2 extends StatelessWidget {
  const ButtonS2({
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: tDefaultPadding2.h, horizontal: tDefaultPadding2.h),
      child: NeumorphismButton(
        color: NeumorphismColor(),
        radius: tNeumorphismRadius,
        blurRadius: tNeumorphismRadius,
        TLshadowcolor: TLShadowColor(),
        BRshadowcolor: BRshadowcolor(),
        child: SizedBox(
          height: Get.height,
          child: GestureDetector(
            onTap: onTap,
            child: Center(child: Text(text,style: TextStyle(fontSize: size,color: color,fontWeight: fontWeight))),
          ),
        ),
      ),
    );
  }
}