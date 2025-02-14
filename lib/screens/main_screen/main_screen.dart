import 'package:JoDija_view/util/main-screen/project-screen.dart';
import 'package:JoDija_view/util/main-screen/screen-type.dart';
import 'package:JoDija_view/util/widgits/screen_provider/screen_viewer.dart';
import 'package:flutter/material.dart';
import 'package:mashair_view_cp/consts/views/colors.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/offers.dart';
import 'package:mashair_view_cp/screens/main_screen/side_bar_tools/side_bar_widget.dart';
import 'main_logic.dart';
import 'main_sub_screens/sup_contents/category.dart';
import 'main_sub_screens/sup_contents/images.dart';
import 'main_sub_screens/sup_contents/main.dart';
import 'main_sub_screens/sup_contents/users.dart';
import 'moblie_cp.dart';
import 'web_cp.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardMainScreen extends StatefulWidget {
  const DashboardMainScreen({super.key});

  @override
  State<DashboardMainScreen> createState() => _DashboardMainScreenState();
}

class _DashboardMainScreenState extends State<DashboardMainScreen> {
  DashboardMainServices logic = DashboardMainServices();



  @override
  void dispose() {

    super.dispose();
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    logic.sideBar = [
      SideListItme(title: "الرئيسية",
        icon: Icons.home,
        clickColor:  LightColors().sideBarClick,
        color: Colors.transparent,
        hoverColor:  LightColors().sideBarHover,
        textColoronclick: LightColors().sideBarTextClick,
        textColoronHover: LightColors().sideBarTextHover,
        textColor: LightColors().sideBarText,
        fontSize: 25  ,

      ),
      SideListItme(title: "المنتجات",
        icon: Icons.category,
        clickColor:  LightColors().sideBarClick,
        color: Colors.transparent,
        hoverColor:  LightColors().sideBarHover,
        textColoronclick: LightColors().sideBarTextClick,
        textColoronHover: LightColors().sideBarTextHover,
        textColor: LightColors().sideBarText,
        fontSize: 25,
      ),
      SideListItme(title: "مستخدمين",
        icon: Icons.person,
        clickColor:  LightColors().sideBarClick,
        color: Colors.transparent,
        hoverColor:  LightColors().sideBarHover,
        textColoronclick: LightColors().sideBarTextClick,
        textColoronHover: LightColors().sideBarTextHover,
        textColor: LightColors().sideBarText,
        fontSize: 25,
      ),
      SideListItme(title: "مناسبات ",
        icon: Icons.local_offer,
        clickColor:  LightColors().sideBarClick,
        color: Colors.transparent,
        hoverColor:  LightColors().sideBarHover,
        textColoronclick: LightColors().sideBarTextClick,
        textColoronHover: LightColors().sideBarTextHover,
        textColor: LightColors().sideBarText,
        fontSize: 25,
      ),
      SideListItme(title: "استكيرات و خلفيات",
        icon: Icons.image,
        clickColor:  LightColors().sideBarClick,
        color: Colors.transparent,
        hoverColor:  LightColors().sideBarHover,
        textColoronclick: LightColors().sideBarTextClick,
        textColoronHover: LightColors().sideBarTextHover,
        textColor: LightColors().sideBarText,
        fontSize: 25,
      ),

    ];

    logic.contents = [
      MainDashboardContents(sideBar: logic.sideBar[0]),
      CategoryContents(sideBar: logic.sideBar[1]),
      UsersContents(sideBar: logic.sideBar[2]),
      OffersContents(sideBar: logic.sideBar[3]),
      imagesContents(sideBar: logic.sideBar[4]),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return ScreenViews<DashboardMainServices>(
      builder: (context, q, child) {
        return ProjectScreenBulder(screenBulder: (c, s, w, h) {

          if (s == ScreenType.mobile) {
            return MobCp();
          }
          return WebCp();
        });
      },
      notifier: logic,
    );
  }
}
