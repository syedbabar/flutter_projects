import 'package:flutter/material.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animated Login app",
      home: HomePage(),
      theme: _greenTheme(),
    );
  }

  ThemeData _greenTheme() {
    return ThemeData(
      primarySwatch: Colors.green,
      accentColor: Colors.greenAccent,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();

    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image(
          image: AssetImage("assets/bg.png"),
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(
              size: _iconAnimation.value * 100,
            )
          ],
        )
      ],
    );
  }
}
