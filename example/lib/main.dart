import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(getSizeByDp(50)),
          child: AppBar(
            title: Text('Plugin example app'),
          ),
        ),
      ),
    );
  }
}
