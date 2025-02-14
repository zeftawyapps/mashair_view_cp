import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../../../drow_engen/core/bloc/main_bloc/main_bloc.dart';
import '../../../../../../../../../../../drow_engen/core/models/drow_tools.dart';
class AppToolBoxItems extends StatelessWidget {
    AppToolBoxItems({super.key , required  this.shapeType ,    });
DrawTools shapeType ;

  @override
  Widget build(BuildContext context) {

    var bloc = context.read<DrawEngineMainBloc>();
    return    MaterialButton(
      onPressed:   (){
        bloc.add(OnNewShapeAdded(shape: shapeType.onShapeClick()));
      },
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                // add border

              ),

              child: Icon(shapeType.icon , size: 30 ,)),
          SizedBox(width: 10,),
          Text(shapeType.shape.type , style: TextStyle(fontSize: 20),)
        ],
      ),
    ) ;
  }
}
