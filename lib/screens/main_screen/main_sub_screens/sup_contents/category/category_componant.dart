import 'package:JoDija_view/util/app_settings/settings_inherted.dart';
import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:JoDija_view/util/functions/show_dialog.dart';
import 'package:JoDija_view/util/main-screen/screen-type.dart';
import 'package:JoDija_view/util/widgits/pob_up_menues/items.dart';
import 'package:JoDija_view/util/widgits/pob_up_menues/pubUpmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/product.dart';
import 'package:mashair_view_cp/widgets/grid_view_model.dart';
import 'package:mashair_view_cp/widgets/list_view_model.dart';
import 'package:mashir_service/data/model/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../bloc/cat_bloc.dart';
import '../../../../../data/category.dart';
import '../../../../../loclization/app_localizations.dart';
import 'add_category.dart';

class CategoryComponant extends StatefulWidget {
  const CategoryComponant({super.key});

  @override
  State<CategoryComponant> createState() => _CategoryComponantState();
}

class _CategoryComponantState extends State<CategoryComponant> {
  late CategoryBloc bloc;
  ScrollController? scrollController;
  bool visibleButton = false;
  bool ableToScroll = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<CategoryBloc>(context);
    bloc.getCategories();
    scrollController = ScrollController();
    scrollController!.addListener(() {
      if (scrollController!.position.pixels ==
          scrollController!.position.maxScrollExtent) {
        setState(() {
          visibleButton = false;
        });
      } else {
        setState(() {
          visibleButton = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocConsumer<CategoryBloc,
              FeaturDataSourceState<CategoryViewDataModel>>(
          listener: (context, state) {
        state.feadState!.maybeWhen(
            orElse: () {},
            success: (data) {
              bloc.getCategories();
            },
            loading: () {},
            failure: (error, reload) {});
      }, builder: (context, state) {
        return state.listState!.maybeWhen(
            orElse: () => Container(),
            success: (data) {
              if (data!.length == 0) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Translation().translate().noData),
                      ElevatedButton(
                        onPressed: () {
                          ScreenType screenType;
                          screenType = SettingChangeLestner.of(context)!
                              .state
                              .screenType!;
                          ShowInputFieldsDialogs sd = ShowInputFieldsDialogs(
                              content: content(context),
                              screenType: screenType);
                          sd.showDialogs(context, onResult: (data) {
                            // bloc.getCategories();
                          });
                        },
                        child: Text(Translation().translate().add),
                      ),
                    ],
                  ),
                );
              }
              if (data.length > 10) {
                ableToScroll = true;
              }

              return Padding(
                padding: const EdgeInsets.all(15),
                child: Stack(
                  children: [
                    GridViewModel<CategoryViewDataModel>(
                      scrollController: scrollController,
                      canAdd: true,
                      data: data!,
                      addWidget: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ) ,


                      onAdd: () {
                        ScreenType screenType;
                        screenType =
                            SettingChangeLestner.of(context)!.state.screenType!;
                        ShowInputFieldsDialogs sd = ShowInputFieldsDialogs(
                            content: content(context), screenType: screenType);
                        sd.showDialogs(context, onResult: (data) {
                          // bloc.getCategories();
                        });
                      },
                      listItem: (index, data) {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Products(
                                            cagory: data,
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 30.h  ,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        PopUpMenu(
                                          iconSize: 20,
                                          iconColor: Colors.black,
                                          items: [
                                            pubMenuItems(
                                                title: Translation()
                                                    .translate()
                                                    .edit,
                                                icon: Icons.edit,
                                                value: 1,
                                                onTap: () {
                                                  ScreenType screenType;
                                                  screenType =
                                                      SettingChangeLestner.of(
                                                              context)!
                                                          .state
                                                          .screenType!;
                                                  ShowInputFieldsDialogs sd =
                                                      ShowInputFieldsDialogs(
                                                          content: contentForEdit(
                                                              context, data),
                                                          screenType: screenType);
                                                  sd.showDialogs(context,
                                                      onResult: (data) {
                                                    // bloc.getCategories();
                                                  });
                                                }),
                                            pubMenuItems(
                                                title: Translation()
                                                    .translate()
                                                    .delete,
                                                icon: Icons.delete,
                                                value: 2,
                                                onTap: () {
                                                  bloc.deleteCategory(
                                                      data.image!, data.id!);
                                                }),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              data.image!,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                      ),
                                    ),
                                  ),
                                  Text(data.name , style: TextStyle(fontSize: 10.sp ),),
                                ],
                              ),
                            ).animate().fadeIn(
                                duration: Duration(milliseconds: 500),
                                delay: Duration(milliseconds: 20 * index)),
                          ),
                        );
                      },
                    ),
                    visibleButton
                        ? Positioned(
                            bottom: 20,
                            right: MediaQuery.of(context).size.width / 2 - 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // get deffrent value for the scroll
                                double value =
                                    scrollController!.position.maxScrollExtent -
                                        scrollController!.position.pixels;
                                scrollController!.animateTo(
                                    scrollController!.position.pixels + value,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              child: Icon(Icons.arrow_downward),
                            ),
                          )
                        : Container(),
                  ],
                ),
              );
            });
      }),
    );
  }

  Widget content(BuildContext context) {
    return AddCatigoryDialog();
  }

  Widget contentForEdit(
      BuildContext context, CategoryViewDataModel categoryViewModel) {
    return AddCatigoryDialog(
      categoryBaseModel: categoryViewModel,
    );
  }
}
