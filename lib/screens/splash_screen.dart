import 'package:flutter/material.dart';
import 'package:mashair_view_cp/screens/splash_screen/dash_splash_page.dart';

import '../loclization/app_localizations.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  DashBoardSplashScreen();
  }
}
