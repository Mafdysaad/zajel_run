import 'package:flutter/material.dart';

abstract class Fontstyle {
  static TextStyle openSansBold19 = const TextStyle(
    color: Colors.white,
    fontSize: 19,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w700,
    height: 1.37,
    letterSpacing: 0.10,
  );
  static TextStyle openSansRegular14 = const TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.07,
  );
  static TextStyle openSansSemiBold17 = const TextStyle(
    color: Color(0xFF6A6F73),
    fontSize: 17,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w600,
  );
}
