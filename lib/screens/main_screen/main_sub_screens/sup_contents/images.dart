import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../contents/content_interface.dart';
import '../../side_bar_tools/sid_bar_interface.dart';
import 'image/image_componant.dart';
 class imagesContents extends StatelessWidget with IContent  {
    imagesContents({ required this.sideBar
    }) : super( ){
      index = sideBar!.index ;
    }
    ISideBare? sideBar;
   @override
   Widget build(BuildContext context) {
     return  Container(
       child:   Container(
         child: Column(
           children: [
             Expanded(
               child: Container(
                 color: Colors.white ,
                 child: Center(
                   child:  ImageComponent(),
                 ),
               ),
             )
           ],
         ),
       )
     )
         .animate().fadeIn(
         duration: Duration(milliseconds: 500),
       );
   }
 }
