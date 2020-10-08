import 'dart:async';
import 'package:first_flutter_app/desiredpackages/desired_packages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/navigator_example.dart';

void main() {
  runApp(DesiredPackagesPage());
}

class MySplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Builder(
          builder: (context) => new SplashScreen(),
        ),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => new LoginPage()
        });
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, "/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: _body(),
    ));
  }

  Widget _body() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.blue),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[_iconWithText(), _progressBarWithText()],
        )
      ],
    );
  }

  Widget _iconWithText() {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50.0,
            child: Icon(
              Icons.shopping_cart,
              size: 50.0,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 10.0),
          ),
          Text(
            "FlutKart",
            style: /*GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.white, letterSpacing: .5),
            )*/ TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: "AirbnbBold")
            ,
          )
        ],
      ),
    );
  }

  Widget _progressBarWithText() {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          Text(
            "Online Store \nFor Everyone",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
