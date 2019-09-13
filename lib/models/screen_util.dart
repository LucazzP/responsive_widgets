import 'package:flutter/material.dart';

class ScreenUtil {
  double _refrenceScreenHeight = 640;
  double _refrenceScreenWidth = 360;
  double _refrenceScreenDp = 411;

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
    differenceDp = _screenDp / _refrenceScreenDp;
    differenceScreenWidth = _screenWidth / _refrenceScreenWidth;
    differenceScreenHeight = _screenHeight / _refrenceScreenHeight;
  }

  void updateScreenReference({double height, double width, double shortestSide}) {
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
//endregion

  double getSize(double fontSize) {
    double finalFontsize = fontSize;
    if (this._screenWidth != null) {
      finalFontsize = finalFontsize * differenceDp;
    }
    return finalFontsize;
  }

  double getSizeDp(double fontSize) {
    double finalFontsize = fontSize;
    if (this._screenWidth != null) {
      finalFontsize = (finalFontsize * _screenDp) / _refrenceScreenDp;
    }
    return finalFontsize;
  }
}