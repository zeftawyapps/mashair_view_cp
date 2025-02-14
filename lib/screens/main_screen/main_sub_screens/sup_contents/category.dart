import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/bloc/cat_bloc.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/category_componant.dart';
import 'package:mashair_view_cp/screens/main_screen/side_bar.dart';
import 'package:mashair_view_cp/screens/main_screen/side_bar_tools/sid_bar_interface.dart';

import '../../contents/content_interface.dart';

class CategoryContents extends StatelessWidget with IContent {
  CategoryContents({Key? key, required this.sideBar}) : super(key: key) {
    index = sideBar!.index;
  }
  ISideBare? sideBar;

  @override
  Widget build(BuildContext context) {
    CategoryBloc bloc = CategoryBloc();
    bloc.getCategories();
    return Container(
        child: Container(
      child: Column(
        children: [
          Expanded(
              child: Container(
            color: Color(0xffcac0c0),
            child: CategoryComponant()
                .animate().fadeIn(
                duration: Duration(milliseconds: 500)),
          ))
        ],
      ),
    ))
       ;

  }
}
