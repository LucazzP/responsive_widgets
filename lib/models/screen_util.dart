import 'package:flutter/material.dart';

class ScreenUtil {
  // ScreenUtil(context, {double height, double width, double shortestSide}){
  //   updateScreenReference(height: height, width: width, shortestSide: shortestSide);
  //   updateScreenDimesion(context);
  // }

  double _refrenceScreenHeight;
  double _refrenceScreenWidth;
  double _refrenceScreenDp;
  //region Screen Size and Proportional according to device
  double _screenHeight;
  double _screenWidth;
  double _screenDp;
  double differenceDp;
  double differenceScreenWidth;
  double differenceScreenHeight;
  double get screenHeight => _screenHeight;
  double get screenWidth => _screenWidth;
  double get screenDp => _screenDp;

  void updateScreenDimesion(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _screenWidth = (size.width != null) ? size.width : _screenWidth;
    _screenHeight = (size.height != null) ? size.height : _screenHeight;
    _screenDp = (size.shortestSide != null) ? size.shortestSide : _screenDp;
    differenceDp = _refrenceScreenDp == 0
        ? _refrenceScreenDp
        : _screenDp / _refrenceScreenDp;
    differenceScreenWidth = _refrenceScreenWidth == 0
        ? _refrenceScreenWidth
        : _screenWidth / _refrenceScreenWidth;
    differenceScreenHeight = _refrenceScreenHeight == 0
        ? _refrenceScreenHeight
        : _screenHeight / _refrenceScreenHeight;
  }

  void updateScreenReference(
      {double height, double width, double shortestSide}) {
    _refrenceScreenWidth = (width != null) ? width : _refrenceScreenWidth;
    _refrenceScreenHeight = (height != null) ? height : _refrenceScreenHeight;
    _refrenceScreenDp =
        (shortestSide != null) ? shortestSide : _refrenceScreenDp;
  }

  double getProportionalHeight(double height) {
    if (_screenHeight == null) return height;
    return differenceScreenHeight * height;
  }

  double getProportionalWidth(double width) {
    if (_screenWidth == null) return width;
    var w = differenceScreenWidth * width;
    return w.ceilToDouble();
  }

  double getSize(double size) {
    double finalsize = size;
    if (this._screenWidth != null) {
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
