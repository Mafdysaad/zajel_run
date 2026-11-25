import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/responsive_size.dart';

abstract class Fontstyle {
  static TextStyle openSansBold19(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: responsivesize(context, fontsize: 19),
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w700,
      height: 1.37,
      letterSpacing: 0.10,
    );
  }

  static TextStyle openSansBold18(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: responsivesize(context, fontsize: 19),
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle openSansBold38(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: responsivesize(context, fontsize: 38),
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w700,
      height: 1.37,
      letterSpacing: 0.10,
    );
  }

  static TextStyle openSansBold20(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: responsivesize(context, fontsize: 20),
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle openSansBold30(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: responsivesize(context, fontsize: 20),
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle openSansBold23(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: responsivesize(context, fontsize: 23),
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle openSansBold15(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: responsivesize(context, fontsize: 15),
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle openSansBold14(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: responsivesize(context, fontsize: 14),
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle openSansRegular14(context) => TextStyle(
    color: Colors.white,
    fontSize: responsivesize(context, fontsize: 14),
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.07,
  );
  static TextStyle openSansRegular16(context) => TextStyle(
    color: Colors.white,
    fontSize: responsivesize(context, fontsize: 16),
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.07,
  );
  static TextStyle openSansRegular18(context) => TextStyle(
    color: Colors.white,
    fontSize: responsivesize(context, fontsize: 14),
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.07,
  );
  static TextStyle openSansSemiBold14(context) => TextStyle(
    color: Colors.white,
    fontSize: responsivesize(context, fontsize: 14),
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.07,
  );
  static TextStyle openSansSemiBold17(context) => TextStyle(
    color: Color(0xFF6A6F73),
    fontSize: responsivesize(context, fontsize: 17),
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w600,
  );
}
