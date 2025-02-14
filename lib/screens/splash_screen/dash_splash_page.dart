import 'dart:async';

import 'package:JoDija_DataSource/https/http_urls.dart';
import 'package:JoDija_DataSource/jodija.dart';
import 'package:JoDija_view/util/main-screen/project-screen.dart';
import 'package:JoDija_view/util/main-screen/screen-type.dart';
import 'package:JoDija_view/util/navigations/navigation_service.dart';
import 'package:JoDija_view/util/validators/required_validator.dart';
import 'package:JoDija_view/util/widgits/data_source_bloc_widgets/data_source_bloc_listner.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/form_validations.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/widgets/text_form_vlidation.dart';
import 'package:JoDija_view/util/validators/email_validator.dart';
import 'package:JoDija_view/util/widgits/screen_provider/screen_viewer.dart';

import 'package:animate_do/animate_do.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mashair_view_cp/screens/splash_screen/web_splash.dart';
import '../../../../consts/views/colors.dart';
import '../../bloc/auth_bloc.dart';
import '/loclization/app_localizations.dart';
 import '../../../../consts/views/assets.dart';
import 'dash_logic.dart';
import 'mobile_splash.dart';

class DashBoardSplashScreen extends StatefulWidget {
  DashBoardSplashScreen({super.key});
  static String path = "/web/cp";
  @override
  State<DashBoardSplashScreen> createState() => _DashBoardSplashScreenState();
}

class _DashBoardSplashScreenState extends State<DashBoardSplashScreen> {
  bool isvisablity = false;
  bool isloading = false;
  AuthBloc authBloc = AuthBloc();

  ValidationsForm form = ValidationsForm();
  bool isTimer = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return ScreenViews<DashLogic>(
      builder: (context , d , c ) {
        if (!isTimer) {
          d.timer();
        }
        isTimer = true;
        return ProjectScreenBulder(screenBulder:
        (c,s, w,h ){
          if (s == ScreenType.mobile){
            return MobileSplash();
          }
          return WebSplash();
        }
        );
      }, notifier: DashLogic(),
    );
  }
}
