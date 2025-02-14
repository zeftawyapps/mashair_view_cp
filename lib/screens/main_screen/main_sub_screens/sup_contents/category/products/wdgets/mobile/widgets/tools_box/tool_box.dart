
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/dfawing/widgets/tools_box/widgets/items.dart';

import '../../../../../../../../../../drow_engen/core/contrallers/drow_tools_contraller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMoblieToolBox extends StatefulWidget {
  const AppMoblieToolBox({super.key});

  @override
  State<AppMoblieToolBox> createState() => _AppMoblieToolBoxState();
}

class _AppMoblieToolBoxState extends State<AppMoblieToolBox> {
  @override
  Widget build(BuildContext context) {
    DrawToolsController drawToolsController = DrawToolsController();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70.h,

      child: ListView (
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 10,
          ),
          for (var item in drawToolsController.tools)
            AppToolBoxItems(
              shapeType: item,
            )
        ],
      ),
    );
  }
}
