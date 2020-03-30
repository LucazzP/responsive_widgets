import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'non_responsive_screen.dart';
import 'responsive_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920,
      width: 1080,
      allowFontScaling: false,
    );

    return ResponsiveWidgets.builder(
      height: 1920,
      width: 1080,
      allowFontScaling: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Plugin example app'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NonResponsiveScreen())),
                      child: TextResponsive("Not Responsive Page"),
                      key: Key('RaisedButton'),
                    ),
                    RaisedButtonResponsive(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResponsiveScreen())),
                      child: TextResponsive("Responsive Page"),
                      key: Key('RaisedButtonResponsive'),
                    )
                  ],
                ),
                TextResponsive(
                  'Plugin example app',
                  key: Key('TextResponsive'),
                ),
                Text(
                  'Plugin example app',
                  key: Key('Text'),
                ),
                ContainerResponsive(
                  key: Key('ContainerResponsive'),
                  height: 100,
                  width: 200,
                  color: Colors.green,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: 100,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ContainerResponsive(
                      height: 200,
                      width: 100,
                      color: Colors.green,
                    ),
                  ],
                ),
                Container(
                  key: Key('Container'),
                  height: 100,
                  width: 200,
                  color: Colors.green,
                ),
                ContainerResponsive(
                  key: Key('ContainerResponsive2'),
                  height: 100,
                  width: 200,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
