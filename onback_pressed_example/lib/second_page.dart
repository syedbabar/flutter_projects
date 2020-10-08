import 'package:flutter/material.dart';
import 'package:onback_pressed_example/third_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.redAccent),
          child: Builder(
            builder: (ctx) => FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage()),
                );
//                Navigator.of(ctx)
//                    .push(MaterialPageRoute(builder: (ctx) => ThirdPage()));
              },
              child: Text(
                "Navigate to another screen",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
