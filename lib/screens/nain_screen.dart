
import 'package:JoDija_DataSource/jodija.dart';
import 'package:JoDija_view/util/widgits/input_output_cell_binder/widgets/data_table_cell_binder.dart';
import 'package:flutter/material.dart';
import 'package:mashair_view_cp/consts/views/assets.dart';
import 'package:mashair_view_cp/screens/main_screen/main_screen.dart';
import 'package:mashir_service/data/logic_injicts.dart';
import 'package:mashir_service/data/model/category.dart';

import '../app-configs.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
@override
  void initState() {
    // TODO: implement initState

  super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  DashboardMainScreen();
  }
}
