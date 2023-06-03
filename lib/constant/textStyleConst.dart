import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/constant/colorConst.dart';

class TextStyleConst {
  static TextStyle titleTextStyleIntro = GoogleFonts.montserrat(
    color: ColorConst.primaryColor,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  ); static TextStyle desTextStyleIntro = GoogleFonts.poppins(
    color: ColorConst.secondPrimaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
