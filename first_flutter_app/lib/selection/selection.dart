import 'package:first_flutter_app/colors/CustomColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectionHomePage(),
    );
  }
}

class SelectionHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SelectBodyPage(),
      ),
    );
  }
}

class SelectBodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20, top: 40.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            child: Image(
              image: AssetImage(
                "assets/back_icon.png",
              ),
              width: 20.0,
              alignment: Alignment.topLeft,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text(
              "My services are exclusive,To offer you packages I need to know what you do?",
              style: TextStyle(
                  fontFamily: "AirbnbBold",
                  fontSize: 16.0,
                  color: Color(CustomColor.DARK_PURPLE)),
            ),
          ),
          buildResearcherCard(),
          buildWriterCard()
        ],
      ),
    );
  }

  Widget buildResearcherCard() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20.0),
      child: Card(
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(
                  "assets/researcher_icon.png",
                ),
                width: 200.0,
                height: 200.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  "I'm a Researcher",
                  style: TextStyle(
                      fontFamily: "AirbnbBold",
                      fontSize: 20.0,
                      color: Color(CustomColor.LIGHT_PURPLE_1)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWriterCard() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20.0),
      child: Card(
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(
                  "assets/writer_icon.png",
                ),
                width: 200.0,
                height: 200.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  "I'm a Writer",
                  style: TextStyle(
                      fontFamily: "AirbnbBold",
                      fontSize: 20.0,
                      color: Color(CustomColor.LIGHT_PURPLE_1)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
