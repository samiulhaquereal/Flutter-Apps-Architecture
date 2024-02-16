import 'package:admissionhelpline/Constand/size_strings.dart';
import 'package:admissionhelpline/Utils/Neumorphism/neumorphism_widget.dart';
import 'package:admissionhelpline/Utils/Theme/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class LoadingS1Widget extends StatelessWidget {
  const LoadingS1Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (_,index){
      return Padding(
        padding: EdgeInsets.symmetric(vertical: tDefaultPadding2.h, horizontal: tDefaultPadding2.h),
        child: NeumorphismButton(
          color: NeumorphismColor(),
          radius: tNeumorphismRadius,
          blurRadius: tNeumorphismRadius,
          TLshadowcolor: TLShadowColor(),
          BRshadowcolor: BRshadowcolor(),
          child: Shimmer.fromColors(
              baseColor: ShimmerBaseColor(),
              highlightColor: ShimmerHighlightColor(),
              direction: ShimmerDirection.ltr,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: tNeumorphismPadding.h, horizontal: tNeumorphismPadding.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: tShimmerTextHeight.h,width: tShimmerTextWidth.w,decoration: ShimmerBoxDecoration()),
                      Gap(tGap1.h),
                      Container(height: tShimmerTextHeight.h,decoration: ShimmerBoxDecoration()),
                      Gap(tGap1.h),
                      Container(height: tShimmerTextHeight.h,decoration: ShimmerBoxDecoration()),
                    ],
                  )
              )
          ),
        ),
      );
    });
  }
}