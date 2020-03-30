// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

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
      : this.left = ResponsiveWidgets.getSize(left),
        this.top = ResponsiveWidgets.getSize(top),
        this.right = ResponsiveWidgets.getSize(right),
        this.bottom = ResponsiveWidgets.getSize(bottom),
        super.fromLTRB(left, top, right, bottom);

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
      : left = ResponsiveWidgets.getSize(value),
        top = ResponsiveWidgets.getSize(value),
        right = ResponsiveWidgets.getSize(value),
        bottom = ResponsiveWidgets.getSize(value),
        super.all(value);

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
  })  : this.left = ResponsiveWidgets.getSize(left),
        this.top = ResponsiveWidgets.getSize(top),
        this.right = ResponsiveWidgets.getSize(right),
        this.bottom = ResponsiveWidgets.getSize(bottom),
        super.only(left: left, top: top, right: right, bottom: bottom);

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
  })  : left = ResponsiveWidgets.getSize(horizontal),
        top = ResponsiveWidgets.getSize(vertical),
        right = ResponsiveWidgets.getSize(horizontal),
        bottom = ResponsiveWidgets.getSize(vertical),
        super.symmetric(vertical: vertical, horizontal: horizontal);

  /// Creates insets that match the given window padding.
  ///
  /// If you need the current system padding or view insets in the context of a
  /// widget, consider using [MediaQuery.of] to obtain these values rather than
  /// using the value from [dart:ui.window], so that you get notified of
  /// changes.
  EdgeInsetsResponsive.fromWindowPadding(
      ui.WindowPadding padding, double devicePixelRatio)
      : left = ResponsiveWidgets.getSize(padding.left / devicePixelRatio),
        top = ResponsiveWidgets.getSize(padding.top / devicePixelRatio),
        right = ResponsiveWidgets.getSize(padding.right / devicePixelRatio),
        bottom = ResponsiveWidgets.getSize(padding.bottom / devicePixelRatio),
        super.fromWindowPadding(padding, devicePixelRatio);

  /// An [EdgeInsets] with zero offsets in each direction.
  static const EdgeInsets zero = EdgeInsets.only();

  /// The offset from the left.
  final double left;

  /// The offset from the top.
  final double top;

  /// The offset from the right.
  final double right;

  /// The offset from the bottom.
  final double bottom;

  /// An Offset describing the vector from the top left of a rectangle to the
  /// top left of that rectangle inset by this object.
  Offset get topLeft => Offset(left, top);

  /// An Offset describing the vector from the top right of a rectangle to the
  /// top right of that rectangle inset by this object.
  Offset get topRight => Offset(-right, top);

  /// An Offset describing the vector from the bottom left of a rectangle to the
  /// bottom left of that rectangle inset by this object.
  Offset get bottomLeft => Offset(left, -bottom);

  /// An Offset describing the vector from the bottom right of a rectangle to the
  /// bottom right of that rectangle inset by this object.
  Offset get bottomRight => Offset(-right, -bottom);
}
