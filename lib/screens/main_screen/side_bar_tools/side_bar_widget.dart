import 'package:JoDija_view/util/app_settings/settings_inherted.dart';
import 'package:JoDija_view/util/main-screen/screen-type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mashair_view_cp/screens/main_screen/side_bar_tools/sid_bar_interface.dart';
import 'package:flutter/material.dart';
 import 'package:provider/provider.dart';

import '../main_logic.dart';

class SideListItme extends StatelessWidget with ISideBare {
  SideListItme(
      {super.key,
      required this.title,
      this.clickColor,
      this.color,
      this.textColor = Colors.white,
      this.textColoronclick = Colors.black,
      this.textColoronHover = Colors.white,
      this.hoverColor,
      this.fontSize = 5,
      this.addShadwo = false,
      this.icon});
  String title;
  IconData? icon;
  bool addShadwo = false;
  int fontSize = 6;
  Color? color = Colors.green;
  Color? textColor = Colors.black;
  Color? textColoronclick = Colors.black;
  Color? textColoronHover = Colors.black;

  Color? hoverColor = Color(0xffF5F5F5);
  Color? clickColor = Color(0xff3e1ab5);
  int index = 0;

  bool isHover = false;
  bool isClick = false;
  bool isActioned = false;
  DashboardMainServices? mainLogic;

  @override
  Widget build(BuildContext context) {
    ScreenType screenType = SettingChangeLestner.of(context).state.screenType!;

    int ScreenfontSize = 0;
    if (screenType == ScreenType.mobile) {
      ScreenfontSize = fontSize - 10;
    } else {
      ScreenfontSize = fontSize;
    }

    loadLogic(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (e) {
        onHover(index);
      },
      onExit: (e) {
        onExit(index);
      },
      child: GestureDetector(
        onTap: () {
          onClick(index);
        },
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: colorsOpartion(),
                    boxShadow: [
                      addShadwo
                          ? BoxShadow(
                              color: isHover
                                  ? Colors.black.withOpacity(0.2)
                                  : Colors.transparent,
                              blurRadius: isHover ? 0 : 3,
                              offset: Offset(0, 5))
                          : BoxShadow(color: Colors.transparent)
                    ],
                    borderRadius: BorderRadius.circular(2)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      icon != null
                          ? Icon(
                              icon,
                              color: textcholor(),
                              size: ScreenfontSize.toDouble(),
                            )
                          : Container(),
                      SizedBox(
                        width: 10 ,
                      ),
                      Expanded(
                        child: Text(title,
                            style: TextStyle(
                                fontSize: ScreenfontSize.toDouble(),
                                color: textcholor())),
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: textcholor(), size: ScreenfontSize.toDouble())
                    ],
                  ),
                )))),
      ),
    );
  }

  Color textcholor() {
    if (isClick) {
      return textColoronclick!;
    } else if (isHover) {
      return textColoronHover!;
    } else {
      return textColor!;
    }
  }

  @override
  int selectedIndex = 0;
  int hoverIndex = 0;

  @override
  void onClick(int index) {
    mainLogic!.onSideBarClick(index);
  }

  @override
  void onExit(int index) {
    mainLogic!.onSideBarExit(index);
  }

  @override
  void onHover(int index) {
    mainLogic!.onSideBarHover(index);
  }
}
