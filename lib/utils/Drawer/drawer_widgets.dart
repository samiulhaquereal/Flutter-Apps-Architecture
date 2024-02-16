import 'package:admissionhelpline/Constand/colors_strings.dart';
import 'package:admissionhelpline/Constand/size_strings.dart';
import 'package:admissionhelpline/Constand/text_strings.dart';
import 'package:admissionhelpline/Features/About/Screen/about_screen.dart';
import 'package:admissionhelpline/Utils/Drawer/drawer_controller.dart';
import 'package:admissionhelpline/Utils/Drawer/drawer_subheader_widget.dart';
import 'package:admissionhelpline/Utils/Theme/theme_controller.dart';
import 'package:admissionhelpline/Utils/Theme/theme_service.dart';
import 'package:admissionhelpline/Utils/Theme/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:store_redirect/store_redirect.dart';

class SideMenuBar extends StatelessWidget {
  const SideMenuBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    DrawerControllere controller = Get.put(DrawerControllere());
    ThemeController controller2 = Get.put(ThemeController());
    return Drawer(
      child: FooterView(
        footer: Footer(
            backgroundColor: FooterColor(),
            padding: EdgeInsets.symmetric(vertical: tDefaultPadding2.h, horizontal: tDefaultPadding2.h),
            child: Column(
              children: <Widget>[
                Text(dev,style: GoogleFonts.poppins(),),
                Obx(()=> Text('$t22 ${controller.version.value}',style: GoogleFonts.poppins(),)),
              ],
            )
        ),
        children: <Widget>[
           UserAccountsDrawerHeader(
            accountName: Text(
              tAppName,
              style: GoogleFonts.poppins(fontSize: tIconSize.sp,color: tWhiteColor),
            ),
            accountEmail: Text(tAppTagLine,style: GoogleFonts.poppins(fontSize: tTextSize1.sp,color: tWhiteColor),),
            currentAccountPicture: const ClipOval(
            ),
            decoration: const BoxDecoration(
              color: tPrimaryColor,
            ),
          ),
          Gap(tGap1.h),
          const DividerWithSubheader(subHeader: t66),
          Gap(tGap1.h),
          Obx(()=>ListTile(
              leading: Icon(controller2.isDarkModeClick.isTrue ? LineAwesomeIcons.lightbulb : LineAwesomeIcons.moon),
              title: Text(
                controller2.isDarkModeClick.isTrue ? t64:t65,
                style: GoogleFonts.poppins(fontSize: tTextSize1.sp),
              ),
              onTap: (){
                ThemeServices().switchTheme();
                controller2.isDarkModeClick.value =  Get.isDarkMode ? false : true;
                Get.snackbar(t66, Get.isDarkMode ? t71 : t72,colorText:  Get.isDarkMode ? tBlackColor : tWhiteColor);
              },
            ),
          ),
          const Divider(color: tGrayColor2),
          Gap(tGap2.h),
          const DividerWithSubheader( subHeader: t67),
          Gap(tGap1.h),
          ListTile(
            leading: const Icon(LineAwesomeIcons.star),
            title: Text(
              t19,
              style: GoogleFonts.poppins(fontSize: tTextSize1.sp),
            ),
            onTap: (){
              StoreRedirect.redirect(androidAppId: controller.packegename.value);
            },
          ),
          ListTile(
            leading: const Icon(LineAwesomeIcons.share),
            title: Text(
              t20,
              style: GoogleFonts.poppins(fontSize: tTextSize1.sp),
            ),
            onTap: (){
              Share.share(controller.packegename.value);
            },
          ),
          const Divider(color: tGrayColor2),
          Gap(tGap2.h),
          const DividerWithSubheader( subHeader: t68),
          ListTile(
            leading: const Icon(LineAwesomeIcons.exclamation_circle),
            title: Text(
              t68,
              style: GoogleFonts.poppins(fontSize: tTextSize1.sp),
            ),
            onTap: () {
              Get.to(const AboutScreen());
            },
          ),
          ListTile(
            leading: const Icon(LineAwesomeIcons.android),
            title: Text(
              t21,
              style: GoogleFonts.poppins(fontSize: tTextSize1.sp),
            ),
            onTap: () {
              controller.openPlayStoreDevAccount();
            },
          ),

        ],
      ),
    );
  }
}