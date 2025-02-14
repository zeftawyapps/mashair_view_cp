
import 'package:JoDija_view/project_configrations/app_configration.dart';
import 'package:JoDija_view/util/localization/loaclized_init.dart';
import 'package:JoDija_view/util/navigations/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/dfawing/main_page.dart';
import 'package:mashair_view_cp/screens/splash_screen.dart';
import 'package:mashir_service/configration.dart';

import 'consts/views/assets.dart';
 import 'loclization/app_localizations.dart';
import 'loclization/app_localizations_ar.dart';
import 'loclization/app_localizations_en.dart';
  class AppConfigration  extends LogicConfigration implements DataViewConfigraion{
// single tone
    static final AppConfigration _singleton = AppConfigration._internal();
    factory AppConfigration() {
      return _singleton;
    }
    AppConfigration._internal(){
      super.setAppConfigration(ServiceEnvType.dev, SerViceAppType.Dashboard, SerViceBackendState.remote_dev);
      super.FirebaseInit(AppConfigAssets.firebaseConfig);
   RouteInit();
    }

  @override
  String AppName = "Commerce App";

  @override
  String AppNameID = "Commerce_App";
  @override
  String Version = " V:  1.0.0";
  @override
  Widget launchScreen() {

return SplashScreen();
  }

  @override
  void setAppLocal(String localCode) {
    LocalizationConfig localizationConfig =
    LocalizationConfig(localizedValues: {
      'ar': AppLocalizationsAr(),
      'en': AppLocalizationsEn(),
    });
    localizationConfig.setLocale(Locale(localCode));
    Translation().getlocal();

  }

  @override
  void RouteInit() {
    NavigationService().setRouters(getRouters());
  }

  @override
  Map<String, Widget> getRouters() {
    return {
      '/':   SplashScreen(),
    };
  }



}
