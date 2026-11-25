import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/size_config.dart';

double responsivesize(context, {required fontsize}) {
  double scalfactor = getscalfactor(context);
  double responsivesize = fontsize * scalfactor;
  double lowerLimit = fontsize * .8;
  double upperLimit = fontsize * 1.2;
  return responsivesize.clamp(lowerLimit, upperLimit);
}

double getscalfactor(context) {
  double widthofscreen = MediaQuery.sizeOf(context).width;
  // PlatformDispatcher dispatcher = PlatformDispatcher.instance;
  // double physicalwidth = dispatcher.views.first.physicalSize.width;
  // double devicepixelratio = dispatcher.views.first.devicePixelRatio;
  // double width_of_screen = physicalwidth / devicepixelratio;
  if (widthofscreen < SizeConfig.tablet) {
    return widthofscreen / 550;
  } else if (widthofscreen < SizeConfig.desctop) {
    return widthofscreen / 1000;
  } else {
    return widthofscreen / 1800;
  }
}
