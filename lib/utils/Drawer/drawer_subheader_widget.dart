import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DividerWithSubheader extends StatelessWidget {
  const DividerWithSubheader({Key? key, required this.subHeader,}) : super(key: key);
  final String subHeader;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              subHeader,
              style: GoogleFonts.poppins(fontSize: 8.sp),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }}