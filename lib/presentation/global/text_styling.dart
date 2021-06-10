import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'constants.dart';

/// This class contains all the text configuration.
/// Note, don't change the varable name incase you wanna
/// update some but rather update the text properties
class TextStyling {
  static final TextStyle h1 = GoogleFonts.lato(
    color: Colors.white,
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle h2 = GoogleFonts.poppins(
    color: kGreyWhiteColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle bodyText1 = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 13.sp,
    fontWeight: FontWeight.normal,
  );
}
