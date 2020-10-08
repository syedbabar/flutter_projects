import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iseha_flutter/base/base.dart';
import 'package:iseha_flutter/constants/font_family.dart';
import 'package:iseha_flutter/constants/image_path.dart';
import 'package:iseha_flutter/constants/palettes/Palettes.dart';
import 'package:iseha_flutter/doctor/forgotpassword/forgot_password.dart';
import 'package:iseha_flutter/ui/custom_ui.dart';

class DoctorLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Doctor(),
    );
  }
}

class Doctor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DoctorLoginState();
  }
}

class DoctorLoginState extends State {
  bool isPasswordShowed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        decoration: BoxDecoration(color: Palettes().white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildLoginLogo(),
            _buildLoginText(),
            _buildForm(context),
            _buildLoginButton(),
            _buildCreateAccountCont()
          ],
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

  Widget _buildLoginText() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.topLeft,
      child: Text(
        "Please login to your account",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 14,
            color: Palettes().black,
            fontFamily: CustomFonts().light),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: <Widget>[
          _buildEmailTextField(),
          _buildPasswordTextField(context),
          _buildForgotPassword(context)
        ],
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Container(
      height: 40,
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

  Widget _buildPasswordTextField(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        height: 40,
        decoration: CustomUi().greenStrokeBg(),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20.0, right: 10.0),
                child: TextField(
                  obscureText: isPasswordShowed,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.start,
                  scrollPadding: EdgeInsets.zero,
                  style: TextStyle(
                      fontSize: 14, fontFamily: CustomFonts().regular),
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordShowed = !isPasswordShowed;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 10.0),
                child: Image(
                  height: 15,
                  width: 15,
                  image: AssetImage(ImagePath().viewPassword),
                ),
              ),
            )
          ],
        ));
  }

  void showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Builder(
      builder: (context) => InkWell(
        onTap: () {
          CustomNavigator().navigatoToNewScreen(context, ForgotPassword(), false);
        },
        child: Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.topRight,
          child: Text(
            "Forgot your password?",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 10,
                color: Palettes().black,
                fontFamily: CustomFonts().light),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return GestureDetector(
//      onTap: () => showToast(""),
      child: Container(
        alignment: Alignment.center,
        height: 45,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        decoration: CustomUi().greenButtonBg(),
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Palettes().white,
              fontSize: 16,
              fontFamily: CustomFonts().regular),
        ),
      ),
    );
  }

  Widget _buildCreateAccountCont() {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[_buildDontHaveAccount(), _buildRegisterHere()],
        ));
  }

  Widget _buildDontHaveAccount() {
    return Container(
      child: Text(
        "Don't Have An Account?",
        style: TextStyle(fontSize: 12, fontFamily: CustomFonts().regular),
      ),
    );
  }

  Widget _buildRegisterHere() {
    return Container(
      margin: EdgeInsets.only(left: 5.0),
      child: Text(
        "Register Here",
        style: TextStyle(
            fontSize: 12,
            fontFamily: CustomFonts().regular,
            color: Palettes().mainGreen),
      ),
    );
  }
}
