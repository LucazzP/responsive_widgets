import 'package:flutter/widgets.dart';

class ResponsiveWidgets {
  void init(BuildContext context,
      {double referenceHeight = 0,
      double referenceWidth = 0,
      double referenceShortestSide = 360}) {
    _updateScreenReference(
        height: referenceHeight,
        width: referenceWidth,
        shortestSide: referenceShortestSide);
    _updateScreenDimesion(context);
  }

  double _refrenceScreenHeight;
  double _refrenceScreenWidth;
  double _refrenceScreenDp;
  //region Screen Size and Proportional according to device
  static double _screenDp;
  static double differenceDp;
  static double differenceScreenWidth;
  static double differenceScreenHeight;

  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void _updateScreenDimesion(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    _screenDp = (size.shortestSide != null) ? size.shortestSide : _screenDp;
    differenceDp = _refrenceScreenDp == 0
        ? _refrenceScreenDp
        : _screenDp / _refrenceScreenDp;
    differenceScreenWidth = _refrenceScreenWidth == 0
        ? _refrenceScreenWidth
        : screenWidth / _refrenceScreenWidth;
    differenceScreenHeight = _refrenceScreenHeight == 0
        ? _refrenceScreenHeight
        : screenHeight / _refrenceScreenHeight;
  }

  void _updateScreenReference(
      {double height, double width, double shortestSide}) {
    _refrenceScreenWidth = (width != null) ? width : _refrenceScreenWidth;
    _refrenceScreenHeight = (height != null) ? height : _refrenceScreenHeight;
    _refrenceScreenDp =
        (shortestSide != null) ? shortestSide : _refrenceScreenDp;
  }

  static double getSize(double size) {
    double finalsize = size;
    if (screenWidth != null) {
      if (differenceDp == 0 &&
          differenceScreenHeight == 0 &&
          differenceScreenWidth != 0) {
        finalsize = finalsize * differenceScreenWidth;
      } else if (differenceDp == 0 &&
          differenceScreenHeight != 0 &&
          differenceScreenWidth == 0) {
        finalsize = finalsize * differenceScreenHeight;
      } else if (differenceDp != 0 &&
          differenceScreenHeight == 0 &&
          differenceScreenWidth == 0) {
        finalsize = finalsize * differenceDp;
      } else if (differenceDp == 0 &&
          differenceScreenHeight != 0 &&
          differenceScreenWidth != 0) {
        finalsize =
            finalsize * ((differenceScreenWidth + differenceScreenHeight) / 2);
      } else if (differenceDp != 0 &&
          differenceScreenHeight == 0 &&
          differenceScreenWidth != 0) {
        finalsize = finalsize * ((differenceScreenWidth + differenceDp) / 2);
      } else if (differenceDp != 0 &&
          differenceScreenHeight != 0 &&
          differenceScreenWidth == 0) {
        finalsize = finalsize * ((differenceScreenHeight + differenceDp) / 2);
      } else {
        finalsize = finalsize *
            ((((differenceScreenWidth + differenceScreenHeight) / 2) +
                    differenceDp) /
                2);
      }
    }
    return finalsize;
  }
}
