import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavigator {
  void navigatoToNewScreen(
      BuildContext context, Widget navigateTo, bool maintainState) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => navigateTo, maintainState: maintainState));
  }
}
