import 'package:admissionhelpline/Constand/colors_strings.dart';
import 'package:admissionhelpline/Constand/size_strings.dart';
import 'package:admissionhelpline/Features/Tools/Controller/tools_controller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DropDownS2Widget extends StatefulWidget {
  DropDownS2Widget({
    super.key,
    required this.item,
    required this.list,
    required this.controller,
    required this.serial,
  });
  String item;
  var list;
  int serial;
  ToolsController controller;

  @override
  State<DropDownS2Widget> createState() => _DropDownS1WidgetState();
}

class _DropDownS1WidgetState extends State<DropDownS2Widget> {
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
                widget.item = value!;
                if(widget.serial == 1){
                  widget.controller.fromDrop.value = value;
                }
                if(widget.serial == 2){
                  widget.controller.toDrop.value = value;
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
