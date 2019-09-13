import 'package:flutter/widgets.dart';
import 'package:responsive_widgets/models/screen_util.dart';

class ResponsiveWidgets{

  ScreenUtil screenUtil = ScreenUtil();

  factory ResponsiveWidgets() {
    return _singleton;
  }
  static final ResponsiveWidgets _singleton = ResponsiveWidgets._internal();
  ResponsiveWidgets._internal() {
    print("Instance created ResponsiveWidgets");
  }

  void init(BuildContext context, {double referenceHeight = 0, double referenceWidth = 0, double referenceShortestSide = 0}){
    screenUtil.updateScreenDimesion(context);
    screenUtil.updateScreenReference(height: referenceHeight, width: referenceWidth, shortestSide: referenceShortestSide);
  }

  /// By height and width of screen
  double getSizeByScreen(double size) {
    return screenUtil.getSize(size);
  }

  /// By density of pixels
  double getSizeByDp(double size) {
    return screenUtil.getSizeDp(size);
  }
  
}

/// By height and width of screen
double getSizeByScreen(double size) {
  return ResponsiveWidgets().getSizeByScreen(size);
}

/// By density of pixels
double getSizeByDp(double size) {
  return ResponsiveWidgets().getSizeByDp(size);
}