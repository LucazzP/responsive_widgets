part of '../responsive_widgets.dart';

/// An immutable set of offsets in each of the four cardinal directions.
///
/// Typically used for an offset from each of the four sides of a box. For
/// example, the padding inside a box can be represented using this class.
///
/// The [EdgeInsets] class specifies offsets in terms of visual edges, left,
/// top, right, and bottom. These values are not affected by the
/// [TextDirection]. To support both left-to-right and right-to-left layouts,
/// consider using [EdgeInsetsDirectional], which is expressed in terms of
/// _start_, top, _end_, and bottom, where start and end are resolved in terms
/// of a [TextDirection] (typically obtained from the ambient [Directionality]).
///
/// {@tool sample}
///
/// Here are some examples of how to create [EdgeInsets] instances:
///
/// Typical eight-pixel margin on all sides:
///
/// ```dart
/// const EdgeInsets.all(8.0)
/// ```
/// {@end-tool}
/// {@tool sample}
///
/// Eight pixel margin above and below, no horizontal margins:
///
/// ```dart
/// const EdgeInsets.symmetric(vertical: 8.0)
/// ```
/// {@end-tool}
/// {@tool sample}
///
/// Left margin indent of 40 pixels:
///
/// ```dart
/// const EdgeInsets.only(left: 40.0)
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [Padding], a widget that accepts [EdgeInsets] to describe its margins.
///  * [EdgeInsetsDirectional], which (for properties and arguments that accept
///    the type [EdgeInsetsGeometry]) allows the horizontal insets to be
///    specified in a [TextDirection]-aware manner.
class EdgeInsetsResponsive extends EdgeInsets {
  /// Creates insets from offsets from the left, top, right, and bottom.
  EdgeInsetsResponsive.fromLTRB(
      double left, double top, double right, double bottom)
      : super.fromLTRB(left.w, top.h, right.w, bottom.h);

  /// Creates insets where all the offsets are `value`.
  ///
  /// {@tool sample}
  ///
  /// Typical eight-pixel margin on all sides:
  ///
  /// ```dart
  /// const EdgeInsets.all(8.0)
  /// ```
  /// {@end-tool}
  EdgeInsetsResponsive.all(double value)
      : super.fromLTRB(value.w, value.h, value.w, value.h);

  /// Creates insets with only the given values non-zero.
  ///
  /// {@tool sample}
  ///
  /// Left margin indent of 40 pixels:
  ///
  /// ```dart
  /// const EdgeInsets.only(left: 40.0)
  /// ```
  /// {@end-tool}
  EdgeInsetsResponsive.only({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) : super.only(left: left.w, top: top.h, right: right.w, bottom: bottom.h);

  /// Creates insets with symmetrical vertical and horizontal offsets.
  ///
  /// {@tool sample}
  ///
  /// Eight pixel margin above and below, no horizontal margins:
  ///
  /// ```dart
  /// const EdgeInsets.symmetric(vertical: 8.0)
  /// ```
  /// {@end-tool}
  EdgeInsetsResponsive.symmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) : super.symmetric(vertical: vertical.h, horizontal: horizontal.w);

  /// An [EdgeInsets] with zero offsets in each direction.
  static const EdgeInsets zero = EdgeInsets.only();
}
