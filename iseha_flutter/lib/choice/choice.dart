import 'package:flutter/material.dart';
import 'package:iseha_flutter/base/base.dart';
import 'package:iseha_flutter/constants/font_family.dart';
import 'package:iseha_flutter/constants/image_path.dart';
import 'package:iseha_flutter/constants/palettes/Palettes.dart';
import 'package:iseha_flutter/doctor/login/doctor_login.dart';
import 'package:iseha_flutter/profile/doctor_profile.dart';
import 'package:iseha_flutter/ui/custom_ui.dart';

void main() {
  runApp(DoctorProfile());
}

class ChoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _buildBackgroundImage(),
            _buildChoiceCont(context)
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned(
      top: -2,
      bottom: -2,
      left: -4,
      right: -4,
      child: Image(
        image: AssetImage(ImagePath().choiceBg),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildChoiceCont(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildLogo(),
        _buildChoiceButton(
            context,
            double.infinity,
            40,
            ImagePath().patientIcon,
            "Im a Patient",
            TextStyle(
                fontSize: 16,
                color: Palettes().mainGreen,
                fontFamily: CustomFonts().regular),
            CustomUi().whiteButtonBg(),
            EdgeInsets.only(left: 40, right: 40, top: 0, bottom: 0),
            DoctorLogin(),
            false),
        Builder(
          builder: (context) => InkWell(
            onTap: () {
              CustomNavigator().navigatoToNewScreen(context, DoctorLogin(), false);
            },
            child: _buildChoiceButton(
                context,
                double.infinity,
                40,
                ImagePath().doctorIcon,
                "Im a Doctor",
                TextStyle(
                    fontSize: 16,
                    color: Palettes().white,
                    fontFamily: CustomFonts().regular),
                CustomUi().whiteStrokeBg(),
                EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 0),
                DoctorLogin(),
                false),
          ),
        )
      ],
    );
  }

  Widget _buildLogo() {
    return Container(
      child: Image(
        height: 180,
        width: 180,
        image: AssetImage(ImagePath().appLogoNew),
      ),
    );
  }

  Widget _buildChoiceButton(
      BuildContext context,
      double width,
      double height,
      String icon,
      String text,
      TextStyle textStyle,
      BoxDecoration decoration,
      EdgeInsets margin,
      Widget navigateTo,
      bool maintainState) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: decoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image(
              height: 25,
              width: 25,
              image: AssetImage(icon),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              text,
              style: textStyle,
            ),
          )
        ],
      ),
    );
  }
}
