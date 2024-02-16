import 'package:admissionhelpline/Constand/colors_strings.dart';
import 'package:admissionhelpline/Constand/size_strings.dart';
import 'package:admissionhelpline/Utils/Neumorphism/neumorphism_widget.dart';
import 'package:admissionhelpline/Utils/Theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ButtonS4 extends StatelessWidget {
  const ButtonS4({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.icon_color,
    this.child,
    this.loading,
  });

  final String text;
  final IconData icon;
  final GestureTapCallback onTap;
  final Color icon_color;
  final Widget? child;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Obx(()=>NeumorphismButton(
                color: themeController.isDarkModeClick.value ? tGrayCholor2.shade900 :tGrayCholor2.shade200,
                radius: tNeumorphismRadius,
                blurRadius: tNeumorphismRadius,
                TLshadowcolor: themeController.isDarkModeClick.value ?tGrayCholor2.shade800 : tWhiteColor,
                BRshadowcolor: themeController.isDarkModeClick.value? tBlackColor : tGrayCholor2.shade400,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: tNeumorphismPadding.h, horizontal: tNeumorphismPadding.h),
                  child: loading == true ? child : Icon(icon,size: tNeumorphismIconSize.sp,color: themeController.isDarkModeClick.value ? tWhiteColor :icon_color),
                ),
              ),
            ),
            Gap(tGap1.h),
            Text(text,style: TextStyle(fontSize: tTextSize1.sp),textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}