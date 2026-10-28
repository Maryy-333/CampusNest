import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Fraunces for headings, Work Sans for body text.
class AppText {
  AppText._();

  static TextStyle heading({
    double size = 20,
    FontWeight weight = FontWeight.w700,
    Color color = AppColors.textDark,
  }) => GoogleFonts.fraunces(fontSize: size, fontWeight: weight, color: color);

  static TextStyle body({
    double size = 14,
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.textDark,
    double? letterSpacing,
    double? height,
  }) => GoogleFonts.workSans(
    fontSize: size,
    fontWeight: weight,
    color: color,
    letterSpacing: letterSpacing,
    height: height,
  );
}
