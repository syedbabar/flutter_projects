import 'package:flutter/material.dart';
import 'package:onback_pressed_example/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String secondPage = "second_page";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {secondPage: (context) => SecondPage()},
      home: Scaffold(
        body: Center(
          child: _buildButton(context),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Builder(
      builder: (context) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SecondPage(), maintainState: true),
          );
          /* Navigator.pushNamed(
            context,
            secondPage,
          );*/
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.blueAccent),
          child: FlatButton(
            child: Text(
              "Navigate to new screen",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
