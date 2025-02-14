import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../../../drow_engen/core/bloc/main_bloc/main_bloc.dart';
import '../../../../../../../../../../../drow_engen/core/models/drow_tools.dart';
class AppMobileToolBoxItems extends StatelessWidget {
    AppMobileToolBoxItems({super.key , required  this.shapeType ,    });
DrawTools shapeType ;

  @override
  Widget build(BuildContext context) {

    var bloc = context.read<DrawEngineMainBloc>();
    return    MaterialButton(
      onPressed:   (){
        bloc.add(OnNewShapeAdded(shape: shapeType.onShapeClick()));
      },
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            // add border
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),

          child: Center(child: Icon(shapeType.icon , size: 30,) )),
    ) ;
  }
}
