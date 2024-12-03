import 'package:e_commerce_shop/utils/size_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleBold9({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 9),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleRegular16({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 16),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular20({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 20),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleBold16({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 16),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMedium16({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 16),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium18({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 18),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium20({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 20),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold16({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 16),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold20({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 20),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular12({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 12),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleLight10({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 10),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle styleLight12({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 12),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle styleBold12({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 12),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleLight14({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 14),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle styleBold14({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 14),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleLight18({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 18),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle styleLight20({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 20),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle styleSemiBold24({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 24),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular14({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 14),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold18({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 18),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold18({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 18),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold20({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(fontSize: 20),
      fontWeight: FontWeight.w700,
    );
  }
}

double getResponsiveFontSize({required double fontSize}) {
  double scaleFactor = getScaleFactor();
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor() {
  var dispatcher = PlatformDispatcher.instance;
  var physicalWidth = dispatcher.views.first.physicalSize.width;
  var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  double width = physicalWidth / devicePixelRatio;

  // double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
