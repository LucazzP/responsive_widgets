import 'package:flutter/widgets.dart';
import 'package:responsive_widgets/models/screen_util.dart';

class ResponsiveWidgets {
  ScreenUtil screenUtil = ScreenUtil();

  factory ResponsiveWidgets() {
    return _singleton;
  }
  static final ResponsiveWidgets _singleton = ResponsiveWidgets._internal();
  ResponsiveWidgets._internal() {
    print("Instance created ResponsiveWidgets");
  }

  void init(BuildContext context,
      {double referenceHeight = 0,
      double referenceWidth = 0,
      double referenceShortestSide = 360}) {
    screenUtil.updateScreenReference(
        height: referenceHeight,
        width: referenceWidth,
        shortestSide: referenceShortestSide);
    screenUtil.updateScreenDimesion(context);
  }

  /// By density of pixels
  double getSize(double size) {
    return screenUtil.getSize(size);
  }
}

/// By density of pixels
double getSize(double size) {
  return ResponsiveWidgets().getSize(size);
}
