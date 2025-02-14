import 'package:flutter/material.dart';
import 'package:mashair_view_cp/screens/main_screen/side_bar.dart';

import '../side_bar_tools/sid_bar_interface.dart';

mixin   IContent {
  ISideBare? sideBar ;
  int index = 0;


  Widget build(BuildContext context);
}