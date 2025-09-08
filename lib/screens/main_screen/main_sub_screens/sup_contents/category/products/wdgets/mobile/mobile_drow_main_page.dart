import 'dart:convert';
import 'dart:typed_data';
import 'package:JoDija_view/util/app_settings/settings_inherted.dart';
import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:JoDija_view/util/functions/show_dialog.dart';
import 'package:JoDija_view/util/main-screen/screen-type.dart';
import 'package:JoDija_view/util/widgits/pob_up_menues/items.dart';
import 'package:JoDija_view/util/widgits/pob_up_menues/pubUpmenu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/bloc/prod_bloc.dart';
import 'package:mashair_view_cp/data/product.dart';
import 'package:mashair_view_cp/drow_engen/core/show_dialoge.dart';
import 'package:mashair_view_cp/drow_engen/init.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/dfawing/widgets/board.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/dfawing/widgets/layers/layers.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/dfawing/widgets/property/property.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/dfawing/widgets/tools_box/tool_box.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/mobile/pain_dialoge.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/mobile/widgets/board.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/mobile/widgets/layers/layers.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/mobile/widgets/property/property.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/mobile/widgets/tools_box/tool_box.dart';
import '../../../../../../../../drow_engen/core/bloc/main_bloc/main_bloc.dart';
import '../../../../../../../../drow_engen/core/interfaces/base_shap.dart';
import '../../../../../../../../drow_engen/core/models/layout.dart';


class AppMoblieDrawEngenePages extends StatefulWidget {
  AppMoblieDrawEngenePages({super.key, this.data, required this.catId});

  ProductViewDataModel? data;
  String catId;
  @override
  State<AppMoblieDrawEngenePages> createState() =>
      _AppMoblieDrawEngenePagesState();
}

class _AppMoblieDrawEngenePagesState extends State<AppMoblieDrawEngenePages> {
  String name = "data";
  Color color = Color(0xff9e5757);
  DrawEngineMainBloc? bloc;
  ProductBloc? saveBloc;
  Uint8List? image;
  bool isLoad = false;
  bool isInited = false;
  bool islayer = false;
  bool isProperty = false;
  bool isTool = false;
  BaseShape? Selectedshape;
  bool isprint = false;
  int _buttonState = 0;
  List<BaseShape> shapes = [];
double width = 300;
double height = 400;
  initState() {
    init(loadPath: "assets/card.png");


    bloc = context.read<DrawEngineMainBloc>();

    saveBloc = context.read<ProductBloc>();
    var layout = Layout(width:  width .w, height:   height .h);

    if (widget.data != null) {
      bloc!.add(OnLoad(data: jsonDecode(widget.data!.cardData!)));
      isInited = true;
    } else {
      bloc!.add(MainInitialEvent(layout: layout));
      isInited = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height ;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('اعداد الكارت'),
        actions: [
          IconButton(
              onPressed: () {
                bloc!.add(SaveFile());
              },
              icon: Icon(Icons.save)),

        ],
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
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xfff5f4f4),
                // shadow
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset:
                    Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _buttonState = 1;
                          });
                        },
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            color: _buttonState == 1
                                ? Color(0xffb572da)
                                : Color(0xfff5f4f4),
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(child:Icon(Icons.layers
                                    ,size: 20.sp
                                    ,color: _buttonState == 1
                                        ? Colors.white
                                        : Colors.black,
                                  ) ,),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'الطبقات',
                                      style: TextStyle(
                                        color: _buttonState == 1
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _buttonState = 2;
                          });
                        },
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            color: _buttonState == 2
                                ? Color(0xffb572da)
                                : Color(0xfff5f4f4),
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(child:Icon(Icons.settings
                                    ,size: 20.sp
                                    ,color: _buttonState == 2
                                        ? Colors.white
                                        : Colors.black,
                                  ) ,),
                                  Expanded(
                                    flex: 2 ,
                                    child: Text(
                                      'الخصائص',
                                      style: TextStyle(
                                        color: _buttonState == 2
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _buttonState = 3;
                          });
                        },
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            color: _buttonState == 3
                                ? Color(0xffb572da)
                                : Color(0xfff5f4f4),
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(child:Icon(Icons.brush
                                    ,size: 20.sp
                                    ,color: _buttonState == 3
                                        ? Colors.white
                                        : Colors.black,
                                  ) ,),
                                  Expanded(
                                    flex: 2 ,
                                    child: Text(
                                      'الادوات',
                                      style: TextStyle(
                                        color: _buttonState == 3
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30.h,
            ),

            Container(
              child:  isLoad
                  ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
                  : AppMobliePaintBoard(),
            ),
            Expanded(
              flex: 7,
              child: BlocConsumer<DrawEngineMainBloc, MainState>(
                builder: (context, state) {
                  return Container(
                    width: width,
                    height: height,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            child: showButton()) ,

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
                    image = state.imageuti8list;
                    showDialog(context: context, builder:(c)=>
                    PainDialoge( imageUint8List: state.imageuti8list!)
                    );



                    // if (isprint) {
                    //
                    // } else {
                    //   if (widget.data != null) {
                    //     saveBloc!.editProduct({
                    //       "name": "data",
                    //       "cardData": state.register.toString()
                    //     }, widget.catId, widget.data!.id!, image);
                    //   } else {
                    //     saveBloc!.addProduct({
                    //       "name": "data",
                    //       "cardData": state.register.toString()
                    //     }, widget.catId, image);
                    //   }
                    // }
                  }

                  if (state is ShapeSelected) {
                    Selectedshape = state.shape;
                  }
                  if (state is ShapeSelectedFromPanel) {
                    Selectedshape = state.shape;
                    if (_buttonState == 1) {
                      _buttonState = 1;
                    } else {

                    _buttonState = 2;}
                    setState(() {

                    });

                  }
                  if (state is ShapeUnSelectedFromPanel) {
                    Selectedshape = null;
                    if (_buttonState == 1) {
                      _buttonState = 1;
                    }else {
                  _buttonState = 3;}
                  setState(() {

                  });
                  }

                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showButton() {
    int buttonState = _buttonState;
    switch (buttonState) {
      case 1:
        return  AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height:buttonState!= 1 ? 0 :MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [   BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),)
                ]
            ),
            child: AppMoblieLayers());
      case 2:
        return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: MediaQuery.of(context).size.width  ,
            height:buttonState !=2  ? 0 :    MediaQuery.of(context).size.height  * 0.3,
            decoration: BoxDecoration(
                color: Colors.white,
                // add border
                boxShadow: [   BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),)
                ]
            ),
            child: MoblieProperty());
      case 3:
        return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: MediaQuery.of(context).size.width  ,
            height:buttonState !=3  ? 0 :  MediaQuery.of(context).size.height  * 0.3,
            decoration: BoxDecoration(
                color: Colors.white,
                // add border
                boxShadow: [   BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),)
                ]
            ),
            child: AppMoblieToolBox());


      default:
        return Container();
    }
  }
}
