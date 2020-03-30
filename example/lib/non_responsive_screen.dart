import 'package:flutter/material.dart';

class NonResponsiveScreen extends StatefulWidget {
  NonResponsiveScreen({Key key}) : super(key: key);

  _NonResponsiveScreenState createState() => _NonResponsiveScreenState();
}

class _NonResponsiveScreenState extends State<NonResponsiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Responsive Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Plugin example app'),
              Container(
                height: 100,
                width: 200,
                color: Colors.green,
              ),
              RaisedButton(
                onPressed: () {},
              ),
              Icon(Icons.ac_unit),
              IconButton(
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
