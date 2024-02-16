import 'dart:ui';

import 'package:admissionhelpline/Constand/colors_strings.dart';
import 'package:flutter/material.dart';

class Glassmorphism extends StatelessWidget {

  final double blur;
  final double opacity;
  final Widget child;

  const Glassmorphism({
    Key? key,
    required this.blur,
    required this.opacity,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur,sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: tWhiteColor.withOpacity(opacity),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              width: 1.5,
              color: tWhiteColor.withOpacity(opacity),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}