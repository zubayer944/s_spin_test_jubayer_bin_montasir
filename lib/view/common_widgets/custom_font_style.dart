import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFontStyle {
  static TextStyle notoSans({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? lineHeight,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.notoSans(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        height: lineHeight,
        decoration: textDecoration,
      );
}
