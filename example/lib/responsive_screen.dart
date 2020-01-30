import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class ResponsiveScreen extends StatefulWidget {
  ResponsiveScreen({Key key}) : super(key: key);

  _ResponsiveScreenState createState() => _ResponsiveScreenState();
}

class _ResponsiveScreenState extends State<ResponsiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ResponsiveWidgets.getSize(50)),
        child: AppBar(
          title: TextResponsive('Responsive page'),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextResponsive('Plugin example app'),
              ContainerResponsive(
                height: 100,
                width: 200,
                color: Colors.green,
              ),
              RaisedButtonResponsive(
                onPressed: () {},
              ),
              IconResponsive(Icons.ac_unit),
              IconButtonResponsive(
                onPressed: () {},
                icon: Icon(Icons.ac_unit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
