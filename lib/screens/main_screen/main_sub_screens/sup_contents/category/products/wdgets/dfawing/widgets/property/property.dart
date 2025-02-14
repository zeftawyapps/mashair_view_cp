import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/drow_engen/core/interfaces/base_shap.dart';

import '../../../../../../../../../../drow_engen/core/bloc/main_bloc/main_bloc.dart';
import '../../../../../../../../../../drow_engen/core/contrallers/property_switcher.dart';

class Property extends StatefulWidget {
  const Property({super.key});

  @override
  State<Property> createState() => _PropertyState();
}

class _PropertyState extends State<Property> {

  PropertySwitcher? _propertySwitcher  ;
  Widget _propertyBox = Container();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          // add border
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: BlocListener<DrawEngineMainBloc, MainState>(
          listener: (context, state) {

            if (state is ShapeSelected) {
              _propertyBox = Container();
           BaseShape shape = state.shape;
            _propertyBox =   shape.propertyBoox ;
            // _propertyBox  =Container();
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text( 'Properties' , style: TextStyle(fontSize: 20),),
                SizedBox(height: 10,),
                _propertyBox,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
