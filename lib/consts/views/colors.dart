import 'package:JoDija_view/theams/colors/colors.dart';
import 'package:flutter/material.dart';

class LightColors implements AppColors {
  @override
  Color accent = Color(0xFFE3D2AF);

  @override
  Color background = Color(0xFFEFF0F3);

  @override
  Color bodyText = Color(0xFF5E5E61);
  Color textAppBar = Color(0xFF171616);
  Color drawer =  Color(0xFFFFFFFF);
  @override
  Color buttonColor = Color(0xFF5E5E61);

  @override
  Color buttonText = Color(0xFFEFF0F3);

  @override
  Color captionText = Color(0xFF5E5E61);

  @override
  Color dividerColor = Color(0xFFEFF0F3);

  @override
  Color iconColor = Color(0xFF171616);

  @override
  Color primary =  Color(0xFFF6F2F8);

  @override
  Color secondary = Color(0xFFEFF0F3);

  @override
  Color subTitleText = Color(0xFF171616);

  @override
  Color titleText = Color(0xFF171616);

  // input text color
  Color inputText = Color(0xFF171616);
  // hint text color
  Color hintText = Color(0xFF5E5E61);
  Color inputFill = Color(0x95F3DDEC);
  Color sideBar = Color(0xFFEFD5EF);
  Color sideBarHover = Color(0x947A7A88);
  Color sideBarClick = Color(0xCADAB8D1);
  Color sideBarText = Color(0xE23B3B41);
  Color sideBarTextHover = Color(0xE23B3B41);
  Color sideBarTextClick = Color(0xE23B3B41);


}

class DarkColors implements AppColors {
  @override
  Color accent = Color(0xFFE3D2AF);

  @override
  Color background = Color(0xFFEFF0F3);

  @override
  Color bodyText = Color(0xFF5E5E61);
  Color textAppBar = Color(0xFFEFF0F3);
  Color drawer = Color(0xFFEFF0F3);
  @override
  Color buttonColor = Color(0xFF5E5E61);

  @override
  Color buttonText = Color(0xFFEFF0F3);

  @override
  Color captionText = Color(0xFF5E5E61);

  @override
  Color dividerColor = Color(0xFFEFF0F3);

  @override
  Color iconColor = Color(0xFFEFF0F3);

  @override
  Color primary = Color(0xFF5E5E61);

  @override
  Color secondary = Color(0xFFEFF0F3);

  @override
  Color subTitleText = Color(0xFF5E5E61);

  @override
  Color titleText = Color(0xFF5E5E61);

  // input text color
  Color inputText = Color(0xFF2929CF);
  // hint text color
  Color hintText = Color(0xFF5E5E61);
  Color inputFill = Color(0xFFEEEEF7);
}

class FixedColors {
  // single tons
  static final FixedColors _fixedColors = FixedColors._internal();
  factory FixedColors() {
    return _fixedColors;
  }
  FixedColors._internal();



  List<Color> backGroundColors = [Color(0xFF5E5E61)];

  Color backGroundColor = Color(0xFF5E5E61);
  List<Color> screenBackGroundColors = [Color(0xFF5E5E61)];

  Color screenBackGroundColor = Color(0xFF5E5E61);

  List<Color> buttonBackGroundColors = [Color(0xFF5E5E61)];

  Color buttonBackGroundColor = Color(0xFF5E5E61);
  List<Color> button2BackGroundColors = [Color(0xFF5E5E61)];

  Color button2BackGroundColor = Color(0xFF5E5E61);


}
