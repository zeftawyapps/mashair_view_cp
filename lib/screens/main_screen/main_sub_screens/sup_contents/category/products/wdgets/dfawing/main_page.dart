import 'dart:convert';
import 'dart:typed_data';

import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/bloc/prod_bloc.dart';
import 'package:mashair_view_cp/data/product.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/dfawing/widgets/board.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/dfawing/widgets/layers/layers.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/dfawing/widgets/property/property.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/dfawing/widgets/tools_box/tool_box.dart';

import '../../../../../../../../drow_engen/core/bloc/main_bloc/main_bloc.dart';
import '../../../../../../../../drow_engen/core/models/layout.dart';

class AppDrawEngenePages extends StatefulWidget {
  AppDrawEngenePages({super.key, this.data, required this.catId});

  ProductViewDataModel? data;
  String catId;
  @override
  State<AppDrawEngenePages> createState() => _AppDrawEngenePagesState();
}

class _AppDrawEngenePagesState extends State<AppDrawEngenePages> {
  String name = "data";
  Color color = Color(0xff9e5757);
  DrawEngineMainBloc? bloc;
  ProductBloc? saveBloc;
  Uint8List? image;
  bool isLoad = false;
  bool isInited = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bloc = context.read<DrawEngineMainBloc>();
    saveBloc = context.read<ProductBloc>();

    var layout = Layout(width: 200, height: 200);
    bloc!.add(MainInitialEvent(layout: layout));
    if (!isInited) {
      if (widget.data != null) {
        bloc!.add(OnLoad(data: jsonDecode(widget.data!.cardData!)));
      } else {
        bloc!.add(MainInitialEvent(layout: layout));
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('اعداد الكارت'),
      ),
      body: BlocListener<ProductBloc,
          FeaturDataSourceState<ProductViewDataModel>>(
        listener: (context, state) {
          state.feadState.maybeWhen(
              loading: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('loading'),
                ));
                isLoad = true;
              },
              orElse: () {},
              success: (message) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(message),
                ));
                Navigator.pop(context);
              });

          state.itemState.maybeWhen(
              orElse: () {},
              success: (data) {
                data;
              });
        },
        child: Container(
          child: BlocConsumer<DrawEngineMainBloc, MainState>(
            builder: (context, state) {
              return Container(
                width: width,
                height: height,
                child: Stack(
                  children: [
                    isLoad
                        ? Center(child: CircularProgressIndicator())
                        : Container(),
                    Positioned(
                        top: 0,
                        left: 50,
                        child: Container(
                            height: 200,
                            width: 200,
                            color: Theme.of(context).colorScheme.primary,
                            child: Container(
                              child: image != null
                                  ? Image.memory(image!)
                                  : Text('no image'),
                            ))),
                    Positioned(
                        top: 0,
                        left: MediaQuery.of(context).size.width / 2,
                        child: Container(
                          height: 50,
                          color: Theme.of(context).colorScheme.primary,
                          child: Row(children: [
                            MaterialButton(
                              onPressed: () {
                                bloc!.add(SaveFile());
                              },
                              child: Text('save'),
                            ),
                          ]),
                        )),
                    AppToolBox(),
                    Positioned(
                        left: width / 2 - 200,
                        top: 100,
                        child: AppPaintBoard()),
                    Positioned(
                      left: width - 300,
                      child: AppLayers(),
                    ),
                    Positioned(top: height - 250, left: 200, child: Property())
                  ],
                ),
              );
            },
            listener: (BuildContext context, MainState state) {
              if (state is DrawSaved) {
                isInited = true;
              } else {
                isInited = false;
              }

              if (state is DrawSaved) {
                // image = state.image;

                if (widget.data != null) {
                  saveBloc!.editProduct(
                      {"name": "data", "cardData": state.register.toString()},
                      widget.catId,
                      widget.data!.id!,
                      image );
                } else {
                  saveBloc!.addProduct(
                      {"name": "data", "cardData": state.register.toString()},
                      widget.catId,
                      image);
                }
                var imagedata = state.byetData;
                image = imagedata!.buffer.asUint8List();
              }
            },
          ),
        ),
      ),
    );
  }
}
