import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/dfawing/widgets/layers/layers_item.dart';

import '../../../../../../../../../../drow_engen/core/bloc/main_bloc/main_bloc.dart';
import '../../../../../../../../../../drow_engen/core/interfaces/base_shap.dart';


class AppLayers extends StatefulWidget {
  const AppLayers({super.key});

  @override
  State<AppLayers> createState() => _AppLayersState();
}

class _AppLayersState extends State<AppLayers> {
  List<BaseShape> shapes = [];
  int index = 0;
  late Timer timer;

  // add bloc to the state
  var bloc;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc = context.read<DrawEngineMainBloc>();
    return BlocListener<DrawEngineMainBloc, MainState>(
        listener: (context, state) {
          if (state is ShapeDraw) {
            shapes = state.shapes;
          }
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: 200  ,
              height: 300,
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
                  Text(
                    'Layers',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: shapes.length,
                      itemBuilder: (context, index) {
                        this.index = shapes.length - 1;


                        return GestureDetector(
                            onTap: () {
                              // onselscted

                              setState(() {

                                this.index = index;

                                seletItem(index);
                              });
                            },
                            child: Column(
                              children: [
                                AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      color: shapes[index].isSelected
                                          ? Colors.blue.withOpacity(0.5)
                                          : Colors.white,
                                    ),
                                    child: AppLayersItem(
                                        shape: shapes[index] ,
                                    delete: () {
                                       bloc.add(OnLayerDelete(shape: shapes[index]));
                                    },
                                    moveUp: () {
                                        bloc.add(OnLayerMoveUp(shape: shapes[index]));
                                    },
                                    moveDown: () {
                                        bloc.add(OnLayerMoveDown(shape: shapes[index]));
                                    },
                                    )),
                                const Divider(
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ],
                            ));
                      },
                    ),
                  ),
                ],
              ),
            )));
  }

  void seletItem(int index) {
    for (var item in shapes) {
      print(item);
      item.isSelected = false;
    }
    shapes[index].isSelected = true;

    bloc.add(OnLayerItemClick(shape: shapes[index]));
  }
}

