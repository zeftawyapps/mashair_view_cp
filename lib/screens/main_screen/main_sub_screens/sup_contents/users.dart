import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/users/users_componant.dart';
import 'package:mashair_view_cp/screens/main_screen/side_bar.dart';
import 'package:mashair_view_cp/screens/main_screen/side_bar_tools/sid_bar_interface.dart';

import '../../contents/content_interface.dart';


class UsersContents extends StatelessWidget  with IContent {
    UsersContents({Key? key,required this.sideBar

    }) : super(key: key){
      index = sideBar!.index ;
    }
    ISideBare? sideBar;


  @override
  Widget build(BuildContext context) {
    return Container(
      child:   Container(
        child: Column(
          children: [

            Expanded(
              child: Container(
                color: Colors.white ,
                  child:UsersComponant()
                ),
              ),

          ],
        ),
      )
    )
      .animate().fadeIn(
      duration: Duration(milliseconds: 500),
    )

      ;
  }
}