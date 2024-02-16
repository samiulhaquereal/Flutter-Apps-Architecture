import 'package:admissionhelpline/Constand/colors_strings.dart';
import 'package:admissionhelpline/Utils/Neumorphism/neumorphism_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;

  const CustomErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NeumorphismButton(
        height: 300,
        width: 300,
        color: tGrayCholor2[300],
        radius: 50,
        blurRadius: 15,
        TLshadowcolor: tWhiteColor,
        BRshadowcolor: tGrayCholor2[500],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  LineAwesomeIcons.bug,
                  color: tDarkRedColor,
                  size: 50.0,
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Error Occurred!',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}