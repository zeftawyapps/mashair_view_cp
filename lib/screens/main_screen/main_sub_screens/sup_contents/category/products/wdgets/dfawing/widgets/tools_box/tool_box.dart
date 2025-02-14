
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/dfawing/widgets/tools_box/widgets/items.dart';

import '../../../../../../../../../../drow_engen/core/contrallers/drow_tools_contraller.dart';

class AppToolBox extends StatefulWidget {
  const AppToolBox({super.key});

  @override
  State<AppToolBox> createState() => _AppToolBoxState();
}

class _AppToolBoxState extends State<AppToolBox> {
  @override
  Widget build(BuildContext context) {
    DrawToolsController drawToolsController = DrawToolsController();

    return Container(
      width: 50,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        // add border
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Column(
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
