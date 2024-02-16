import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
HomeAppBar({PreferredSizeWidget? bottom}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.deepPurple,
    title: Text('Name',style: GoogleFonts.poppins(color: Colors.white30),),
    iconTheme: const IconThemeData(color: Colors.white),
    bottom: bottom,
  );
}