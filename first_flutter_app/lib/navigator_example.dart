import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
          accentColor: Colors.white, textSelectionColor: Colors.white),
      title: 'Flutter Demo',
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('TestProject'),
        ),
        body: new Center(
            child: new MaterialButton(
                child: Container(
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                  child: Text("Go to Login"),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.blueAccent, width: 1.0),
                          bottom:
                              BorderSide(color: Colors.blueAccent, width: 1.0),
                          left:
                              BorderSide(color: Colors.blueAccent, width: 2.0),
                          right: BorderSide(
                              color: Colors.blueAccent, width: 2.0))),
                ),
                onPressed: () => Navigator.of(context).pushNamed('/login'))));
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('SettingsPage'),
        ),
        body: new Center(child: new Text('Settings')));
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Image(
          image: AssetImage("assets/splash_bg.png"),
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              InkWell(
                child: Container(
                  padding: EdgeInsets.only(top: 40.0, left: 20.0),
                  alignment: Alignment.topLeft,
                  child: Image(
                    width: 60.0,
                    height: 60.0,
                    image: AssetImage("assets/app_icon.png"),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 20.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "I need to know who you are? Provide the\nfollowing information",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: "AirbnbBold"),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                child: _form(),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                  child: Container(
                    width: 500.0,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        gradient: LinearGradient(
                            colors: [Colors.deepPurple, Colors.purpleAccent])),
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontFamily: "AirbnbBold"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Create One",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, right: 20.0),
                child: const Divider(
                  color: Colors.white30,
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 0,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: MaterialButton(
                          child: Container(
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            child: Center(
                              child: Text(
                                "Facebook",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: MaterialButton(
                          child: Container(
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Center(
                              child: Text(
                                "Gmail",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ]),
    );
  }

  Widget _form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Username or email",
          style: TextStyle(
              color: Colors.white, fontSize: 14.0, fontFamily: "AirbnbBook"),
        ),
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          margin: EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border(
                  top: BorderSide(width: 1.0, color: Colors.white),
                  left: BorderSide(width: 1.0, color: Colors.white),
                  right: BorderSide(width: 1.0, color: Colors.white),
                  bottom: BorderSide(width: 1.0, color: Colors.white))),
          child: TextField(
            style: TextStyle(color: Colors.white, fontSize: 14.0),
            decoration: InputDecoration(
              hintText: "Enter Email",
              hintStyle:
                  TextStyle(color: Colors.white, fontFamily: "AirbnbBook"),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            cursorColor: Colors.white,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            "Password",
            style: TextStyle(
                color: Colors.white, fontSize: 14.0, fontFamily: "AirbnbBook"),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          margin: EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border(
                  top: BorderSide(width: 1.0, color: Colors.white),
                  left: BorderSide(width: 1.0, color: Colors.white),
                  right: BorderSide(width: 1.0, color: Colors.white),
                  bottom: BorderSide(width: 1.0, color: Colors.white))),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                          color: Colors.white, fontFamily: "AirbnbBook"),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    cursorColor: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage("assets/pass_view_icon.png"),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
