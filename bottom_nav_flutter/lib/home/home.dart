import 'package:bottom_nav_flutter/home/profile.dart';
import 'package:bottom_nav_flutter/ui/blue_circle.dart';
import 'package:bottom_nav_flutter/ui/white_circle.dart';
import 'package:flutter/material.dart';

import 'home_content.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeContent();
  }
}

class HomeContent extends State<HomeBody> {
  bool isHome = true;
  bool isProfile = false;
  int selected_index = 0;

  List<Widget> widgetsList = [HomeContentPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContainer(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildContainer() {
    return Container(
      child: widgetsList.elementAt(selected_index),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 75.0,
      child: Row(
        children: <Widget>[
          _buildHomeOption(),
          _buildCreateArticleOption(),
          _buildProfileOption()
        ],
      ),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 5.0, spreadRadius: 1.0, color: Colors.grey)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
    );
  }

  Widget _buildHomeOption() {
    return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.all(10.0),
              child: Image(
                width: 25,
                height: 25,
                image: AssetImage("assets/home_icon.png"),
              ),
            ),
            onTap: () {
              setState(() {
                isHome = true;
                isProfile = false;
                selected_index = 0;
              });
            },
          ),
          if (isHome) _buildBlueCircle() else _buildWhiteCircle()
        ],
      ),
    );
  }

  Widget _buildCreateArticleOption() {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Image(
          image: AssetImage("assets/create_article_icon.png"),
        ),
      ),
    );
  }

  Widget _buildProfileOption() {
    return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.all(10.0),
              child: Image(
                width: 25,
                height: 25,
                image: AssetImage("assets/profile_icon.png"),
              ),
            ),
            onTap: () {
              setState(() {
                isHome = false;
                isProfile = true;
                selected_index = 1;
              });
            },
          ),
          if (isProfile) _buildBlueCircle() else _buildWhiteCircle()
        ],
      ),
    );
  }

  Widget _buildWhiteCircle() {
    return SizedBox(
      width: 8,
      height: 8,
      child: CustomPaint(
        painter: WhiteCircle(),
      ),
    );
  }

  Widget _buildBlueCircle() {
    return SizedBox(
      width: 8,
      height: 8,
      child: CustomPaint(
        painter: BlueCircle(),
      ),
    );
  }
}
