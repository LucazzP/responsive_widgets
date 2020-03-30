part of '../responsive_widgets.dart';

class ResponsiveWidgets {
  static bool initialized = false;

  static Widget builder({
    double referenceHeight,
    double referenceWidth,
    double referenceShortestSide,
    Widget child,
  }) {
    return LayoutBuilder(
      builder: (context, constrains) {
        ResponsiveWidgets.init(
          context,
          referenceHeight: referenceHeight,
          referenceShortestSide: referenceShortestSide,
          referenceWidth: referenceWidth,
        );
        return child;
      },
    );
  }

  static void init(
    BuildContext context, {
    double referenceHeight,
    double referenceWidth,
    double referenceShortestSide,
  }) {
    _updateScreenReference(
      height: referenceHeight,
      width: referenceWidth,
      shortestSide: referenceShortestSide,
    );
    _updateScreenDimesion(context);
    initialized = true;
  }

  static double _refrenceScreenHeight;
  static double _refrenceScreenWidth;
  static double _refrenceScreenDp;
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

  static void _updateScreenDimesion(BuildContext context) {
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
    differenceDp = _refrenceScreenDp == null
        ? _refrenceScreenDp
        : _screenDp / _refrenceScreenDp;
    differenceScreenWidth = _refrenceScreenWidth == null
        ? _refrenceScreenWidth
        : screenWidth / _refrenceScreenWidth;
    differenceScreenHeight = _refrenceScreenHeight == null
        ? _refrenceScreenHeight
        : screenHeight / _refrenceScreenHeight;
  }

  static void _updateScreenReference(
      {double height, double width, double shortestSide}) {
    _refrenceScreenWidth = (width != null) ? width : _refrenceScreenWidth;
    _refrenceScreenHeight = (height != null) ? height : _refrenceScreenHeight;
    _refrenceScreenDp = (shortestSide != null)
        ? shortestSide
        : (height == null && width == null)
            ? _refrenceScreenDp ?? 360
            : shortestSide;
  }

  static double getSize(double size) {
    assert(
        differenceDp != null ||
            differenceScreenHeight != null ||
            differenceScreenWidth != null,
        "You need to initialize first the ResponsiveWidgets with 'ResponsiveWidgets.init(context)'");
    double finalSize = size;
    if (screenWidth != null) {
      if (differenceDp == null &&
          differenceScreenHeight == null &&
          differenceScreenWidth != null) {
        finalSize = finalSize * differenceScreenWidth;
      } else if (differenceDp == null &&
          differenceScreenHeight != null &&
          differenceScreenWidth == null) {
        finalSize = finalSize * differenceScreenHeight;
      } else if (differenceDp != null &&
          differenceScreenHeight == null &&
          differenceScreenWidth == null) {
        finalSize = finalSize * differenceDp;
      } else if (differenceDp == null &&
          differenceScreenHeight != null &&
          differenceScreenWidth != null) {
        finalSize =
            finalSize * ((differenceScreenWidth + differenceScreenHeight) / 2);
      } else if (differenceDp != null &&
          differenceScreenHeight == null &&
          differenceScreenWidth != null) {
        finalSize = finalSize * ((differenceScreenWidth + differenceDp) / 2);
      } else if (differenceDp != null &&
          differenceScreenHeight != null &&
          differenceScreenWidth == null) {
        finalSize = finalSize * ((differenceScreenHeight + differenceDp) / 2);
      } else {
        finalSize = finalSize *
            ((((differenceScreenWidth + differenceScreenHeight) / 2) +
                    differenceDp) /
                2);
      }
    }
    return finalSize;
  }
}
