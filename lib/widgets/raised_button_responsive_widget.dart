// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of '../responsive_widgets.dart';

/// A material design "raised button".
///
/// A raised button is based on a [Material] widget whose [Material.elevation]
/// increases when the button is pressed.
///
/// Use raised buttons to add dimension to otherwise mostly flat layouts, e.g.
/// in long busy lists of content, or in wide spaces. Avoid using raised buttons
/// on already-raised content such as dialogs or cards.
///
/// If the [onPressed] callback is null, then the button will be disabled and by
/// default will resemble a flat button in the [disabledColor]. If you are
/// trying to change the button's [color] and it is not having any effect, check
/// that you are passing a non-null [onPressed] handler.
///
/// If you want an ink-splash effect for taps, but don't want to use a button,
/// consider using [InkWell] directly.
///
/// Raised buttons have a minimum size of 88.0 by 36.0 which can be overridden
/// with [ButtonTheme].
///
/// {@tool snippet --template=stateless_widget_scaffold}
///
/// This sample shows how to render a disabled RaisedButton, an enabled RaisedButton
/// and lastly a RaisedButton with gradient background.
///
/// ![Three raised buttons, one enabled, another disabled, and the last one
/// styled with a blue gradient background](https://flutter.github.io/assets-for-api-docs/assets/material/raised_button.png)
///
/// ```dart
/// Widget build(BuildContext context) {
///   return Center(
///     child: Column(
///       mainAxisSize: MainAxisSize.min,
///       children: <Widget>[
///         const RaisedButton(
///           onPressed: null,
///           child: Text(
///             'Disabled Button',
///             style: TextStyle(fontSize: 20)
///           ),
///         ),
///         const SizedBox(height: 30),
///         RaisedButton(
///           onPressed: () {},
///           child: const Text(
///             'Enabled Button',
///             style: TextStyle(fontSize: 20)
///           ),
///         ),
///         const SizedBox(height: 30),
///         RaisedButton(
///           onPressed: () {},
///           textColor: Colors.white,
///           padding: const EdgeInsets.all(0.0),
///           child: Container(
///             decoration: const BoxDecoration(
///               gradient: LinearGradient(
///                 colors: <Color>[
///                   Color(0xFF0D47A1),
///                   Color(0xFF1976D2),
///                   Color(0xFF42A5F5),
///                 ],
///               ),
///             ),
///             padding: const EdgeInsets.all(10.0),
///             child: const Text(
///               'Gradient Button',
///               style: TextStyle(fontSize: 20)
///             ),
///           ),
///         ),
///       ],
///     ),
///   );
/// }
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [FlatButton], a material design button without a shadow.
///  * [DropdownButton], a button that shows options to select from.
///  * [FloatingActionButton], the round button in material applications.
///  * [IconButton], to create buttons that just contain icons.
///  * [InkWell], which implements the ink splash part of a flat button.
///  * [RawMaterialButton], the widget this widget is based on.
///  * <https://material.io/design/components/buttons.html>
class RaisedButtonResponsive extends RaisedButton {
  /// Create a filled button.
  ///
  /// The [autofocus] and [clipBehavior] arguments must not be null.
  /// Additionally,  [elevation], [hoverElevation], [focusElevation],
  /// [highlightElevation], and [disabledElevation] must be non-negative, if
  /// specified.
  const RaisedButtonResponsive({
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    double elevation,
    double focusElevation,
    double hoverElevation,
    double highlightElevation,
    double disabledElevation,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior = Clip.none,
    FocusNode focusNode,
    bool autofocus = false,
    MaterialTapTargetSize materialTapTargetSize,
    Duration animationDuration,
    Widget child,
  })  : assert(autofocus != null),
        assert(elevation == null || elevation >= 0.0),
        assert(focusElevation == null || focusElevation >= 0.0),
        assert(hoverElevation == null || hoverElevation >= 0.0),
        assert(highlightElevation == null || highlightElevation >= 0.0),
        assert(disabledElevation == null || disabledElevation >= 0.0),
        assert(clipBehavior != null),
        super(
          key: key,
          onPressed: onPressed,
          onHighlightChanged: onHighlightChanged,
          textTheme: textTheme,
          textColor: textColor,
          disabledTextColor: disabledTextColor,
          color: color,
          disabledColor: disabledColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          colorBrightness: colorBrightness,
          elevation: elevation,
          focusElevation: focusElevation,
          hoverElevation: hoverElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          padding: padding,
          shape: shape,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus: autofocus,
          materialTapTargetSize: materialTapTargetSize,
          animationDuration: animationDuration,
          child: child,
        );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ButtonThemeData buttonTheme = ButtonTheme.of(context);
    final BoxConstraints boxConstraints = buttonTheme.getConstraints(this);
    return RawMaterialButton(
      onPressed: onPressed,
      onHighlightChanged: onHighlightChanged,
      clipBehavior: clipBehavior,
      fillColor: buttonTheme.getFillColor(this),
      textStyle: theme.textTheme.button
          .copyWith(color: buttonTheme.getTextColor(this)),
      focusColor: buttonTheme.getFocusColor(this),
      hoverColor: buttonTheme.getHoverColor(this),
      highlightColor: buttonTheme.getHighlightColor(this),
      splashColor: buttonTheme.getSplashColor(this),
      elevation: buttonTheme.getElevation(this),
      focusElevation: buttonTheme.getFocusElevation(this),
      hoverElevation: buttonTheme.getHoverElevation(this),
      highlightElevation: buttonTheme.getHighlightElevation(this),
      disabledElevation: buttonTheme.getDisabledElevation(this),
      padding: buttonTheme.getPadding(this),
      constraints: BoxConstraints(
          maxHeight: ResponsiveWidgets.getSize(boxConstraints.maxHeight),
          maxWidth: ResponsiveWidgets.getSize(boxConstraints.maxWidth),
          minHeight: ResponsiveWidgets.getSize(boxConstraints.minHeight),
          minWidth: ResponsiveWidgets.getSize(boxConstraints.minWidth)),
      shape: buttonTheme.getShape(this),
      focusNode: focusNode,
      autofocus: autofocus,
      animationDuration: buttonTheme.getAnimationDuration(this),
      materialTapTargetSize: buttonTheme.getMaterialTapTargetSize(this),
      child: child,
    );
  }
}
