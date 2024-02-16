import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme_controller.dart';

class Themes{

  ThemeController controller = Get.find<ThemeController>();

  static final light = ThemeData(
      colorScheme: ColorScheme.light(
        background: Colors.grey.shade200,
      ),
      primaryColor: Colors.deepPurple,
      brightness: Brightness.light
  );

  static final dark = ThemeData(
      colorScheme: ColorScheme.dark(
        background: Colors.grey.shade900,
      ),
      primaryColor: Colors.grey.shade900,
      brightness: Brightness.dark
  );
}

TextStyle get subHeadingStyle{
  return GoogleFonts.poppins (
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode?Colors.grey[400]:Colors.grey,
      )
  );
}

BoxDecoration ShimmerBoxDecoration() {
  return BoxDecoration(
      color: Get.isDarkMode ? Colors.black :Colors.grey,
      borderRadius: BorderRadius.circular(4)
  );
}

Color NeumorphismColor() {
  return Get.isDarkMode ? Colors.grey.shade900 :Colors.grey.shade200;
}
