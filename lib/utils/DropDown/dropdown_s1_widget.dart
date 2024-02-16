import 'package:admissionhelpline/Constand/colors_strings.dart';
import 'package:admissionhelpline/Constand/size_strings.dart';
import 'package:admissionhelpline/Constand/text_strings.dart';
import 'package:admissionhelpline/Features/Eligibility/Controller/eligibility_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget({
    super.key,
    required this.item,
    required this.list,
    required this.serial,
    required this.controller,
  });
  String item;
  var list;
  int serial;
  EligibilityController controller;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.symmetric(vertical: tDefaultPadding2.h, horizontal: tDefaultPadding2.h),),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            value: widget.item.isNotEmpty ? widget.item : widget.list.first,
            isDense: true,
            isExpanded: true,
            menuMaxHeight: 350.h,
            iconEnabledColor: tPurpleColor,
            //style: TextStyle(color: tBlackColor),
            onChanged: (String? value) {
              setState(() {
                if(widget.serial == 4){
                  widget.controller.HSCGroup.value = value!;
                }
                widget.item = value!;
                if(widget.controller.HSCGroup.value == "Arts"){
                  Get.snackbar(t8, t9,colorText: tWhiteColor);
                }
              });
            },
            items: widget.list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
      ),
    );
  }
}
