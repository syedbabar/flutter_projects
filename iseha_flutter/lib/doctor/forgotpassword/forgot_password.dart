import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iseha_flutter/constants/font_family.dart';
import 'package:iseha_flutter/constants/image_path.dart';
import 'package:iseha_flutter/constants/palettes/Palettes.dart';
import 'package:iseha_flutter/ui/custom_ui.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          decoration: BoxDecoration(color: Palettes().white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[_buildLoginLogo(), _buildForgotPassTextCont()],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLogo() {
    return Container(
      alignment: Alignment.topLeft,
      child: Image(
        width: 120,
        height: 60,
        image: AssetImage(ImagePath().loginApp),
      ),
    );
  }

  Widget _buildForgotPassTextCont() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          _buildForgotYourPassword(),
          _buildForgotPasswordText(),
          _buildEmailTextField(),
          _buildContinueButton()
        ],
      ),
    );
  }

  Widget _buildForgotYourPassword() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Forgot Your Password?",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 16,
            color: Palettes().black,
            fontFamily: CustomFonts().bold),
      ),
    );
  }

  Widget _buildForgotPasswordText() {
    return Container(
      child: Text(
        "Enter the email address below to setup a new password",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 14,
            color: Palettes().black,
            fontFamily: CustomFonts().light),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 30),
      decoration: CustomUi().greenStrokeBg(),
      child: Container(
        padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: TextField(
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 14, fontFamily: CustomFonts().regular),
          decoration:
              InputDecoration(hintText: "Email", border: InputBorder.none),
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      decoration: CustomUi().greenButtonBg(),
      child: Text(
        "Continue",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Palettes().white,
            fontSize: 16,
            fontFamily: CustomFonts().regular),
      ),
    );
  }
}
