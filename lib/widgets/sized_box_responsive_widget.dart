part of '../responsive_widgets.dart';

/// A box with a specified size.
///
/// If given a child, this widget forces its child to have a specific width
/// and/or height (assuming values are permitted by this widget's parent). If
/// either the width or height is null, this widget will size itself to match
/// the child's size in that dimension.
///
/// If not given a child, [SizedBox] will try to size itself as close to the
/// specified height and width as possible given the parent's constraints. If
/// [height] or [width] is null or unspecified, it will be treated as zero.
///
/// The [new SizedBox.expand] constructor can be used to make a [SizedBox] that
/// sizes itself to fit the parent. It is equivalent to setting [width] and
/// [height] to [double.infinity].
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=EHPu_DzRfqA}
///
/// {@tool snippet}
///
/// This snippet makes the child widget (a [Card] with some [Text]) have the
/// exact size 200x300, parental constraints permitting:
///
/// ```dart
/// SizedBox(
///   width: 200.0,
///   height: 300.0,
///   child: const Card(child: Text('Hello World!')),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [ConstrainedBox], a more generic version of this class that takes
///    arbitrary [BoxConstraints] instead of an explicit width and height.
///  * [UnconstrainedBox], a container that tries to let its child draw without
///    constraints.
///  * [FractionallySizedBox], a widget that sizes its child to a fraction of
///    the total available space.
///  * [AspectRatio], a widget that attempts to fit within the parent's
///    constraints while also sizing its child to match a given aspect ratio.
///  * [FittedBox], which sizes and positions its child widget to fit the parent
///    according to a given [BoxFit] discipline.
///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
class SizedBoxResponsive extends SizedBox {
  /// Creates a fixed size box. The [width] and [height] parameters can be null
  /// to indicate that the size of the box should not be constrained in
  /// the corresponding dimension.
  SizedBoxResponsive({Key key, double width, double height, Widget child})
      : super(
          key: key,
          child: child,
          width: width.w,
          height: height.h,
        );

  /// Creates a box that will become as large as its parent allows.
  const SizedBoxResponsive.expand({Key key, Widget child})
      : super(
          key: key,
          child: child,
          width: double.infinity,
          height: double.infinity,
        );

  /// Creates a box that will become as small as its parent allows.
  const SizedBoxResponsive.shrink({Key key, Widget child})
      : super(key: key, child: child, width: 0, height: 0);

  /// Creates a box with the specified size.
  SizedBoxResponsive.fromSize({Key key, Widget child, Size size})
      : super(
          key: key,
          child: child,
          width: size?.width == null ? null : size.width.w,
          height: size?.height == null ? null : size.height.h,
        );
}
