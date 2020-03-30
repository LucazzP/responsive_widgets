part of '../responsive_widgets.dart';

class ContainerResponsive extends Container {
  /// Creates a widget that combines common painting, positioning, and sizing widgets.
  ///
  /// The `height` and `width` values include the padding.
  ///
  /// The `color` argument is a shorthand for `decoration: new
  /// BoxDecoration(color: color)`, which means you cannot supply both a `color`
  /// and a `decoration` argument. If you want to have both a `color` and a
  /// `decoration`, you can pass the color as the `color` argument to the
  /// `BoxDecoration`.
  ContainerResponsive({
    Key key,
    AlignmentGeometry alignment,
    EdgeInsetsGeometry padding,
    Color color,
    Decoration decoration,
    Decoration foregroundDecoration,
    double width,
    double height,
    bool widthResponsive = true,
    bool heightResponsive = true,
    BoxConstraints constraints,
    EdgeInsetsGeometry margin,
    Matrix4 transform,
    Widget child,
  })  : 
        super(
            key: key,
            alignment: alignment,
            padding: padding,
            color: color,
            decoration: decoration,
            foregroundDecoration: foregroundDecoration,
            width: width,
            height: height,
            constraints: (width != null || height != null)
            ? constraints?.tighten(
                    width: width != null && widthResponsive
                        ? width.w
                        : width,
                    height: height != null && heightResponsive
                        ? height.h
                        : height) ??
                BoxConstraints.tightFor(
                    width: width != null && widthResponsive
                        ? width.w
                        : width,
                    height: height != null && heightResponsive
                        ? height.h
                        : height)
            : constraints,
            margin: margin,
            transform: transform,
            child: child);
}
