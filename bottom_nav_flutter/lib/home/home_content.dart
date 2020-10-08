import 'package:bottom_nav_flutter/ui/unfilled_pink_circle.dart';
import 'package:flutter/material.dart';

class HomeContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainContentPage(),
    );
  }
}

class MainContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContentBody(),
    );
  }
}

class MainContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_buildTopCont(), _buildArticleList()],
    );
  }

  Widget _buildTopCont() {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Image(
            image: AssetImage("assets/home_bg.png"),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildWelcomeCont(),
              _buildProfileSection(),
              _buildArticleDetailsCont()
            ],
          ),
        )
      ],
    );
  }

  Widget _buildWelcomeCont() {
    return Text(
      "Kundera Welcomes You!",
      style: TextStyle(fontSize: 14, color: Colors.white),
    );
  }

  Widget _buildProfileSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            "Sammy Aiden",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 20.0),
            alignment: Alignment.centerRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: Image(
                    image: AssetImage("assets/edit_icon.png"),
                    width: 15,
                    height: 15,
                  ),
                ),
                Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildArticleDetailsCont() {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      width: double.infinity,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        children: <Widget>[
          Expanded(child: _buildArticleDetails(61, "Total articles")),
          Expanded(child: _buildArticleDetails(10, "Remaining articles"))
        ],
      ),
    );
  }

  Widget _buildArticleDetails(int count, String description) {
    return Column(
      children: <Widget>[
        Stack(alignment: Alignment.center, children: [
          Container(
            width: 50.0,
            height: 50.0,
            child: CustomPaint(
              painter: UnFilledPinkCircle(),
            ),
          ),
          Text(count.toString())
        ]),
        Container(
          margin: EdgeInsets.only(top: 5.0),
          child: Text(
            description,
            style: TextStyle(color: Colors.deepPurple),
          ),
        )
      ],
    );
  }

  Widget _buildArticleList() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 2 / 2,
        children: List.generate(6, (index) {
          return _buildArticleItemCont();
        }),
      ),
    );
  }

  Widget _buildArticleItemCont() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 5, spreadRadius: 1.0, color: Colors.grey)
          ]),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.image),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Article Name",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
