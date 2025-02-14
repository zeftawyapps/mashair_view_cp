import 'package:flutter/material.dart';
import 'package:mashair_view_cp/app-configs.dart';
import 'package:mashair_view_cp/app_louncher.dart';
import 'package:mashair_view_cp/consts/views/assets.dart';

void main() async {
  await AppConfigration()
    ..FirebaseInit(AppConfigAssets.firebaseConfig)
    ..setAppLocal('ar');
  runApp(const AppLouncher());
}
