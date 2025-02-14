import 'package:JoDija_view/util/localization/loaclized_init.dart';
import 'package:flutter/cupertino.dart';

class Translation {
  static final Translation _singleton = Translation._internal();
  factory Translation() {
    return _singleton;
  }


AppLocal get appLocal => translate();
  Translation._internal() {

  }

  Map<String, AppLocal> transelation = {};
  AppLocal translate() {
    return transelation[LocalizationConfig().locale.languageCode]!;
  }

  AppLocal translateOf(BuildContext context) {
    return AppLocal.of(context);
  }

  void getlocal() {

    var localval = LocalizationConfig().localizedValues;
    localval.forEach((key, value) {
      transelation[key] = value as AppLocal;
    });
  }
}

abstract class AppLocal extends AppLocalizationsInit {
  static AppLocal of(BuildContext context) {
    return Localizations.of<AppLocal>(context, AppLocal)!;
  }

  AppLocal();
  String get email;
  String get password;
  String get titelHeader;
  String get mainTextheader;
  String get connect;
  String get signIn;
  String get signUp;
  String get changeLanguage;
  String get dashbordTitle;
  String get catigory;
  String get catigoryEn ;
  String  get add;
  String get addCatigory;
  String get addProduct;
  String get addCleint;
  String get productName;
  String get productPrice;
  String get productQuantity;
  String get productTotal ;
  String get clientName;
  String get clientPhone;
  String get clientEmail;
  String get clientAddress;
  String get addOrder;
  String get Cancel;
  String get total;
  String get taxRate;
  String get tax;
  String get netTotal;
  String get OrderDate;
  String get status;
  String get orderNumber;
  String get order;
  String get client;
  String get taxRateValue;
  String get taxValue;
  String get netTotalValue;
  String get statusValue;
  String get orderDate;
  String get pending;
  String get processing;
  String get delivered;
  String get cancelledFromClient;
  String get returned;
  String get completed;
  String get cancelledFromSupplier;
  String get productsDetails;
  String get close;
  String get save;
  String get edit;
  String get delete;
  String get done ;
  String get published ;
  String get unPublished ;
  String get search_for_product;
  String get search_for_client;
  String get productDataSideBar;
  String get clientDataSideBar;
  String get salesMovementSideBar;
  String get noData;
  String get isFeatured;
  String get unFeatured;
  String get english ;
  String get arabic ;




}
