import 'package:JoDija_view/theams/theams/theams.dart';
import 'package:JoDija_view/util/main-screen/screen-type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mashair_view_cp/consts/views/dimension.dart';
import 'colors.dart';

class Themes extends DashboardThemes  {
  BuildContext  context;
  double? width;
  double? height;
  ScreenType? screenType ;
  Themes( this.context ) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
   screenType =    ScreenTypeExtension.fromMediaQueryData(MediaQuery.of(context));

  }

  @override
  ThemeData light() {
    LightColors appColors = LightColors();
   return  ThemeData(

    primaryColorLight: appColors.primary,

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: appColors.primary,
    ),
    brightness: Brightness.light,

    primaryColor:  appColors.primary,
    appBarTheme:   AppBarTheme(
      backgroundColor: appColors.primary,


      titleTextStyle: TextStyle(
        color: appColors.textAppBar,
        fontSize: AppFontSizes( screenType! ).headerTitle(),
      ),
      iconTheme: IconThemeData(
        size: 25,
        color:  appColors.iconColor,
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: appColors.drawer,
    ),

    iconTheme: IconThemeData(
      color: appColors.iconColor,
      size: 5.sp,
    ),
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(

          fontSize: 5.sp,
          color:  appColors.hintText
        ),
        labelStyle: TextStyle(
          color: appColors.hintText,
          fontSize: 5.sp,
        ),
        filled: true,
        fillColor:   appColors.inputFill,
        // focusColor: DasgbordColors.textFieldsFoucs,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(3.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(3.sp),
        )));
  }

  @override
  ThemeData dark() {
    DarkColors appColors = DarkColors();
    return  ThemeData(

        primaryColorLight: appColors.primary,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: appColors.primary,
        ),
        brightness: Brightness.light,

        primaryColor:  appColors.primary,
        appBarTheme:   AppBarTheme(
          backgroundColor: appColors.primary,
          titleTextStyle: TextStyle(
            color: appColors.textAppBar,
            fontSize: 15,
          ),
          iconTheme: IconThemeData(
            size: 25,
            color:  appColors.iconColor,
          ),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: appColors.drawer,
        ),

        iconTheme: IconThemeData(
          color: appColors.iconColor,
          size: 5.sp,
        ),
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(

              fontSize: 5.sp,
              color: Color(0xFF383839),
            ),
            labelStyle: TextStyle(
              color: appColors.hintText,
              fontSize: 5.sp,
            ),
            filled: true,
            fillColor:   appColors.inputFill,
            // focusColor: DasgbordColors.textFieldsFoucs,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
              borderRadius: BorderRadius.circular(3.sp),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
              borderRadius: BorderRadius.circular(3.sp),
            )));
  }

}
