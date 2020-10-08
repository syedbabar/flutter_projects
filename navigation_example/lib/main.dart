import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:navigation_example/base.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: Container(
              child: Builder(
                child: RaisedButton(
                  child: Text('Navigate to second screen'),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondPage(),
                            maintainState: false));

                    Fluttertoast.showToast(
                        msg: "This is Center Short Toast",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);

                    /* CustomNavigator()
                        .navigatoToNewScreen(context, SecondPage(), false);*/
                  },
                ),
              ),
            ),
          ),
        ));
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: Builder(
              builder: (context) => RaisedButton(
                child: Text('Navigate to third screen'),
                visualDensity: VisualDensity.adaptivePlatformDensity,
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "This is Center Short Toast",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);

                  // CustomNavigator()
                  //     .navigatoToNewScreen(context, ThirdPage(), false);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: RaisedButton(
              child: Text('Welcome to third page'),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
