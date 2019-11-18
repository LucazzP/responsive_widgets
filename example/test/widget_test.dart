// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:responsive_widgets_example/main.dart';

void main() {
  testWidgets('Verify If keys of widgets is working',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.byKey(Key('RaisedButton')), findsOneWidget);
    expect(find.byKey(Key('RaisedButtonResponsive')), findsOneWidget);

    expect(find.byKey(Key('Text')), findsOneWidget);
    expect(find.byKey(Key('TextResponsive')), findsOneWidget);

    expect(find.byKey(Key('Container')), findsOneWidget);
    expect(find.byKey(Key('ContainerResponsive')), findsOneWidget);

    expect(find.byKey(Key('Icon')), findsOneWidget);
    expect(find.byKey(Key('IconResponsive')), findsOneWidget);

    expect(find.byKey(Key('IconButton')), findsOneWidget);
    expect(find.byKey(Key('IconButtonResponsive')), findsOneWidget);
  });
}
