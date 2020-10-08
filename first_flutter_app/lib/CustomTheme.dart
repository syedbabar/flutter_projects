import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData lightOrangeTheme() {
    return ThemeData(
        accentColor: Colors.orange,
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.light);
  }

  ThemeData darkOrangeTheme() {
    return ThemeData(
        accentColor: Colors.orange,
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.dark);
  }

  ThemeData lightGreenTheme() {
    return ThemeData(
        accentColor: Colors.lightGreenAccent,
        primarySwatch: Colors.lightGreen,
        brightness: Brightness.light,
        textSelectionColor: Colors.white);
  }

  ThemeData darkGreenTheme() {
    return ThemeData(
        accentColor: Colors.greenAccent,
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        textSelectionColor: Colors.white);
  }
}
