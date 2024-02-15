import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_format/temp_page/temp_controller.dart';

class Temppage extends StatelessWidget {
  const Temppage({super.key});

  @override
  Widget build(BuildContext context) {
    TempController mvc = Get.put(TempController());
    return Scaffold(

    );
  }
}
