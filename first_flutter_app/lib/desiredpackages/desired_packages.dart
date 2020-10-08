import 'package:first_flutter_app/colors/CustomColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesiredPackagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DesiredHomePage());
  }
}

class DesiredHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DesiredBodyPage(),
    );
  }
}

class DesiredBodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding:
              EdgeInsets.only(left: 20.0, right: 20, top: 40.0, bottom: 20.0),
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
                    "A researcher, Great! and what about your\nprofession?",
                    style: TextStyle(
                        fontFamily: "AirbnbBold",
                        fontSize: 14.0,
                        color: Color(CustomColor.DARK_PURPLE)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Research up to 600 words with references",
                    style: TextStyle(
                        fontFamily: "AirbnbBold",
                        fontSize: 12.0,
                        color: Color(CustomColor.GREY)),
                  ),
                ),
                buildStudentCard(),
                buildIndividualCard(),
                buildEnterpriseCard()
              ])),
    );
  }

  Widget buildStudentCard() {
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
                  "assets/student_icon.png",
                ),
                width: 100.0,
                height: 100.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  "I'm a Student",
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

  Widget buildIndividualCard() {
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
                  "assets/individual_icon.png",
                ),
                width: 100.0,
                height: 100.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  "I'm a Individual",
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

  Widget buildEnterpriseCard() {
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
                  "assets/enterprise_icon.png",
                ),
                width: 100.0,
                height: 100.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  "I'm a Enterprise",
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
