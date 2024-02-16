import 'package:admissionhelpline/Constand/size_strings.dart';
import 'package:admissionhelpline/Utils/AppBar/appbar_widgets.dart';
import 'package:admissionhelpline/Utils/Theme/theme_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DisplayNotificationScreen extends StatelessWidget {
  const DisplayNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RemoteMessage message = Get.arguments;
    return SafeArea(child: Scaffold(
      appBar: HomeAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: tDefaultPadding.h, horizontal: tDefaultPadding.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                '${message.notification?.android?.imageUrl.toString()}',
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: CircularIconColor(),
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      ),
                    );
                  }
                },
              ),
              Gap(tGap1.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: tDefaultPadding2.h, horizontal: tDefaultPadding2.h),
                child: Text('${message.notification?.title}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: tTextSize2.sp),),
              ),
              Gap(tGap1.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: tDefaultPadding2.h, horizontal: tDefaultPadding2.h),
                child: Text('${message.notification?.body}'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}