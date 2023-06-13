import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

const kBacgroundColor = Color(0xFF1D1E33);
const kAccentColor = Color(0xFFEB1555);

TextStyle kNumberTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
  fontFamily: GoogleFonts.permanentMarker().fontFamily,
  color: kAccentColor,
  fontStyle: FontStyle.italic,
);

TextStyle kTextFieldStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  fontFamily: GoogleFonts.alfaSlabOne().fontFamily,
);

TextStyle kButtonTextStyle = TextStyle(
  color: kAccentColor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  fontFamily: GoogleFonts.alfaSlabOne().fontFamily,
);
