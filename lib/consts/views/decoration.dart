


import 'package:JoDija_view/util/main-screen/screen-type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';

class AppDecorations {
ScreenType screenType =ScreenType.web  ;
ThemeMode themeMode =ThemeMode.light ;
BuildContext  context;

AppDecorations({required this.context     }){
  screenType =ScreenTypeExtension.fromMediaQueryData(MediaQuery.of(context));
// get theme mode

}



}
