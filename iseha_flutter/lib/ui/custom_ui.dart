import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iseha_flutter/constants/palettes/Palettes.dart';

class CustomUi {
  BoxDecoration greenStrokeBg() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      border: Border.all(width: 1.0, color: Palettes().mainGreen),
    );
  }

  BoxDecoration greenButtonBg() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(width: 1.0, color: Palettes().mainGreen),
        color: Palettes().mainGreen);
  }

  BoxDecoration whiteButtonBg() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(width: 1.0, color: Palettes().white),
        color: Palettes().white);
  }

  BoxDecoration whiteStrokeBg() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(width: 1.0, color: Palettes().white));
  }

  BoxDecoration leftCornerTransBg() {
    return BoxDecoration(
      color: Colors.black38,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)));
  }

  BoxDecoration rightCornerTransBg() {
    return BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), bottomLeft: Radius.circular(20.0)));
  }
}
