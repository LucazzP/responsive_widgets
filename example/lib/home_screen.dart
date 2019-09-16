import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:responsive_widgets_example/non_responsive_screen.dart';
import 'package:responsive_widgets_example/responsive_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets().init(context,
        referenceHeight: 1920,
        referenceWidth: 1080,
        referenceShortestSide: 411);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getSizeByDp(50)),
        child: AppBar(
          title: TextResponsive('Plugin example app'),
          centerTitle: true,
        ),
      ),
      body: Center(
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
                  ),
                  RaisedButtonResponsive(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResponsiveScreen())),
                    child: TextResponsive("Responsive Page"),
                  )
                ],
              ),
              TextResponsive('Plugin example app'),
              Text('Plugin example app'),
              ContainerResponsive(
                height: 100,
                width: 200,
                color: Colors.green,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.green,
              ),
              IconResponsive(Icons.ac_unit),
              Icon(Icons.ac_unit),
              IconButtonResponsive(
                onPressed: () {},
                icon: Icon(Icons.ac_unit),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.ac_unit),
              ),
              //! Never use two responsive widgets like this:
              IconButtonResponsive(
                onPressed: () {},
                icon: IconResponsive(Icons.ac_unit),
              ),
              IconButton(
                onPressed: () {},
                icon: IconResponsive(Icons.ac_unit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
