import 'package:first_flutter_app/CustomTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme().darkOrangeTheme(),
      home: Scaffold(
        appBar: _homeAppbar(),
        body: _homeBody(),
      ),
    );
  }

  Widget _homeAppbar() {
    return AppBar(
      title: Text("First Flutter app"),
      backgroundColor: Colors.deepOrange,
    );
  }

  BoxDecoration _gradientButton() {
    return BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
      Colors.deepOrange,
      Colors.deepOrangeAccent,
      Colors.orange
    ]));
  }

  Widget _homeBody() {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login Form",
              style: TextStyle(fontSize: 30.0),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter Email"),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter the email address';
                }
                return "";
              },
            ),
            TextFormField(
                obscureText: true,
                decoration: const InputDecoration(hintText: "Enter Password"),
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the password';
                  }
                  return "";
                }),
            RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: 35.0,
                width: 200.0,
                decoration: _gradientButton(),
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  'Submit Data',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        )));
  }
}
