
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class All_Lists extends StatelessWidget {
  const All_Lists({
    super.key,
    required this.date,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
  });

  final String date;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return Padding(
      padding: EdgeInsets.symmetric(vertical: tDefaultPadding2.h, horizontal: tDefaultPadding2.h),
      child: Obx(()=> NeumorphismButton(
        color: themeController.isDarkModeClick.value ? tGrayCholor2.shade900 :tGrayCholor2.shade200,
        radius: tNeumorphismRadius,
        blurRadius: tNeumorphismRadius,
        TLshadowcolor: themeController.isDarkModeClick.value ?tGrayCholor2.shade800 : tWhiteColor,
        BRshadowcolor: themeController.isDarkModeClick.value? tBlackColor : tGrayCholor2.shade400,
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(visible: date != '',child: Text(date,style: TextStyle(color: tPrimaryColor,fontSize: tTextSize1.sp))),
              Text(title,overflow: TextOverflow.ellipsis, maxLines: 1,),
            ],
          ),
          onTap: onTap,
          subtitle: Text(subtitle,overflow: TextOverflow.ellipsis, maxLines: 1,),
          trailing: trailing ?? Icon(LineAwesomeIcons.angle_right, size: tTextSize1.sp),
        ),
      ),
      ),
    );
  }
}