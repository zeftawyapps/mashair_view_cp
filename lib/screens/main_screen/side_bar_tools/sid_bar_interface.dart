import 'package:flutter/material.dart';

import '../main_logic.dart';
import 'package:provider/provider.dart';

mixin   ISideBare {
  int index = 0;

  String title = '';

  int selectedIndex = 0;
  // int function on hover of the side bar
  void onHover(int index);
  // int function on click of the side bar
  void onClick(int index);
  // int function on exit of the side bar
  void onExit(int index);


  int fontSize = 10;
  Color? color = Colors.green ;
  Color? textColor = Colors.black;
  Color? textColoronclick = Colors.black;
  Color? textColoronHover = Colors.black;

  Color? hoverColor = Color(0xffF5F5F5);
  Color? clickColor = Color(0xff3e1ab5);


  Color colorsOpartion(  ) {
    if (isClick){
      isActioned = true;
      return clickColor??Colors.black;
    }else if (isHover){
      isActioned = true ;
      return hoverColor??Colors.white;
    }else{
      isActioned = false;
      return color??Colors.transparent ;
    }
  }
  bool isHover = false;
  bool isClick = false;
  bool isActioned = false;
int hoverIndex = 0;
    DashboardMainServices?    mainLogic;
  void loadLogic(BuildContext context ){
    mainLogic =  Provider.of<DashboardMainServices>(context!);
    textColor =  textColor ?? Colors.white;
    textColoronclick =  textColoronclick ?? Colors.black;
    textColoronHover =  textColoronHover ?? Colors.black;


    hoverIndex =  mainLogic!.hoverIndex;
    selectedIndex =  mainLogic!.selectedIndex;
    isHover = hoverIndex == index;
    isClick = selectedIndex == index;
    isActioned = isClick||isHover;

  }

  Widget build(BuildContext context);
}