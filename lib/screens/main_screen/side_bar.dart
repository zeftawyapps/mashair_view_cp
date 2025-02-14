import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mashair_view_cp/screens/splash_screen/dash_splash_page.dart';

import '../../../../consts/views/assets.dart';
import '../../../../consts/views/colors.dart';
import 'main_logic.dart';
import 'package:provider/provider.dart';

import 'side_bar_tools/side_bar_widget.dart';


class SideBar extends StatelessWidget {
    SideBar({super.key});

  DashboardMainServices logic = DashboardMainServices();

  @override
  Widget build(BuildContext context) {
    logic =  Provider.of<DashboardMainServices>(context);
    return Container(
      width: 200.w ,
      color: Theme.of(context).drawerTheme.backgroundColor,
      child: Column(
        children: [
          Container(
              height: 200.h,
              width: 200.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage( AppAsset.imglogo),
                fit: BoxFit.fill
              )
            ),



          ),
          ...logic.getSideBar()
        ],
      ),
    );
  }
}
