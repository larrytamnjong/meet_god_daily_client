import 'package:flutter/material.dart';

const String montserrat = 'Montserrat';

const FontWeight regular = FontWeight.w300;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;

TextStyle mediumTextStyle = const TextStyle(
  fontSize: 14.0,
  fontFamily: montserrat,
  fontWeight: regular,
);

TextStyle largeHeadingStyle = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 22.0,
  fontFamily: montserrat,
);

TextStyle fontFamilyOnly = const TextStyle(fontFamily: montserrat);
