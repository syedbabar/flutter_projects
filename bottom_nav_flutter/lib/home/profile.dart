import 'package:bottom_nav_flutter/ui/horizontal_separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[_buildHeading(), _buildProfileCont()],
      ),
    );
  }

  Widget _buildHeading() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Sammy aiden",
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _buildProfileCont() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1.0)
          ]),
      child: Column(
        children: <Widget>[
          _buildProfileOption("Change Password", Icons.change_history),
          HorizontalSeparator(),
          _buildProfileOption("Terms And Conditions", Icons.computer),
          HorizontalSeparator(),
          _buildProfileOption("Privacy Policy", Icons.computer),
          HorizontalSeparator(),
          _buildProfileOption("About App", Icons.add_comment),
          HorizontalSeparator(),
          _buildProfileOption("Logout", Icons.local_gas_station),
        ],
      ),
    );
  }

  Widget _buildProfileOption(String option, IconData icon) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(option),
          ),
          Icon(icon)
        ],
      ),
    );
  }
}
