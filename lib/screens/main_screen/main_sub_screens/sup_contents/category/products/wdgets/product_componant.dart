import 'package:JoDija_view/util/app_settings/settings_inherted.dart';
import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:JoDija_view/util/functions/show_dialog.dart';
import 'package:JoDija_view/util/main-screen/screen-type.dart';
import 'package:JoDija_view/util/widgits/bloc_provider.dart';
import 'package:JoDija_view/util/widgits/pob_up_menues/items.dart';
import 'package:JoDija_view/util/widgits/pob_up_menues/pubUpmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/data/product.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/add_product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../bloc/prod_bloc.dart';
import '../../../../../../../loclization/app_localizations.dart';
import '../../../../../../../widgets/grid_view_model.dart';
import 'card_drower.dart';

class ProductComponant extends StatefulWidget {
  ProductComponant({super.key, required this.id});
  String id;
  @override
  State<ProductComponant> createState() => _ProductComponantState();
}

class _ProductComponantState extends State<ProductComponant> {
  ScrollController? scrollController = ScrollController();

  bool visibleButton = false;

  late ProductBloc bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<ProductBloc>(context);
    bloc.getProductsList(widget.id);
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
    return BlocConsumer<ProductBloc,
            FeaturDataSourceState<ProductViewDataModel>>(
        listener: (context, state) {
      state.feadState!.maybeWhen(
          orElse: () {},
          success: (data) {
            bloc.getProductsList(widget.id);
          },
          loading: () {},
          failure: (error, reload) {});
    }, builder: (c, state) {
      return state.listState.maybeWhen(orElse: () {
        return Container();
      }, loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      }, success: (data) {
        return Container(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Stack(
            children: [
              GridViewModel<ProductViewDataModel>(
                scrollController: scrollController,
                canAdd: true,
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
                data: data!,
                onAdd: () {


                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => CardDrower(

                          catId: widget.id,data: null ,
                        )),
                  );
                },
                listItem: (index, data) {
                  bool ispublish  = data!.isPublished??false;
                  bool isfevaor = data.isFeatured??false;
                  bool language = data.language == "ar";
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => CardDrower(
                                    data: data,
                                    catId: widget.id,
                                  )),
                        );
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
                              height: 30.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  PopUpMenu(
                                    iconSize: 20,
                                    iconColor: Colors.black,
                                    items: [

                                      ispublish?
                                      pubMenuItems(
                                          title: Translation().translate().unPublished,
                                          icon: Icons.unpublished,
                                          value: 1,
                                          onTap: () {
                                            data.isPublished = false;
                                            bloc.editProductProperty(  data,widget.id ,data!.id!    );
                                          }) :
                                      pubMenuItems(

                                          title: Translation().translate().published,
                                          icon: Icons.publish,
                                          value: 1,
                                          onTap: () {
                                            data.isPublished = true;
                                            bloc.editProductProperty(  data,widget.id ,data!.id!    );
                                          }),
                                      language  ?
                                      pubMenuItems(
                                          title: Translation().translate().english,
                                          icon: Icons.language,
                                          value: 3,
                                          onTap: () {
                                            data.language = "en";
                                            bloc.editProductProperty(  data,widget.id ,data!.id!    );
                                          }) :

                                      pubMenuItems(
                                          title: Translation().translate().arabic,
                                          icon: Icons.language,
                                          value: 3,
                                          onTap: () {
                                            data.language = "ar";
                                            bloc.editProductProperty(  data,widget.id ,data!.id!    );
                                          }),
                                      isfevaor?
                                      pubMenuItems(
                                        isvisale: ispublish,
                                          title: Translation().translate().unFeatured,
                                          icon: Icons.star_border,
                                          value: 4,
                                          onTap: () {
                                            data.isFeatured = false;
                                            bloc.editProductProperty(  data,widget.id ,data!.id!    );
                                          }) :
                                      pubMenuItems(
                                          isvisale: ispublish,
                                          title: Translation().translate().isFeatured,
                                          icon: Icons.star,
                                          value: 4,
                                          onTap: () {
                                            data.isFeatured = true;
                                            bloc.editProductProperty(  data,widget.id ,data!.id!    );
                                          }),
                                      pubMenuItems(
                                          title: Translation().translate().delete,
                                          icon: Icons.delete,
                                          value: 2,
                                          onTap: () {
                                            bloc.deleteProduct(
                                                widget.id, data.id!);
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              child: Image(
                                image: NetworkImage(
                                  data.image!,
                                ),

                              ),
                            ),
                            // add the card data language and is published and is featured
                            Expanded(child:
                            Container(
                              height: 30.h,

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child:  Text(
                                        data.language! == "ar" ? " عربي" : "English",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ) ,
                                    // is published
                                    Expanded(
                                      child: Icon(
                                        ispublish? Icons.publish : Icons.unpublished,
                                        color: ispublish? Colors.green : Colors.red,
                                        size: 20,
                                      ),
                                    ) ,
                                    // is featured
                                    Expanded(
                                      child: Icon(
                                        isfevaor? Icons.star : Icons.star_border,
                                        color: isfevaor? Colors.yellow : Colors.grey,
                                        size: 20,
                                      ),
                                    ) ,
                                  ],
                                ),
                              ),
                            )) ,

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
        ));
      });
    });
  }
}
