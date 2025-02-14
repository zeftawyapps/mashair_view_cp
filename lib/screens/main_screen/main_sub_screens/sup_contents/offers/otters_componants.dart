import 'package:JoDija_view/util/app_settings/settings_inherted.dart';
import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:JoDija_view/util/functions/show_dialog.dart';
import 'package:JoDija_view/util/main-screen/screen-type.dart';
import 'package:JoDija_view/util/widgits/pob_up_menues/items.dart';
import 'package:JoDija_view/util/widgits/pob_up_menues/pubUpmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/bloc/offer_bloc.dart';
import 'package:mashair_view_cp/data/offer.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/offers/widgets/add_imageEvent.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/offers/widgets/offer_change.dart';

import '../../../../../bloc/images_bloc.dart';
import '../../../../../data/images.dart';
import '../../../../../loclization/app_localizations.dart';

class OffersComponents extends StatefulWidget {
  const OffersComponents({super.key});

  @override
  State<OffersComponents> createState() => _OffersComponentsState();
}

class _OffersComponentsState extends State<OffersComponents> {
  late OfferBloc bloc;
  OfferViewDataModel? data;
  @override
  void initState() {
    // TODO: implement initState
    bloc = BlocProvider.of<OfferBloc>(context);
    bloc.getOfferList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x8cf5f5f5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            color: Color(0x8cf5f5f5),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      BlocConsumer<OfferBloc, FeaturDataSourceState<OfferViewDataModel>>(
                        listener: (context, state) {
                          // TODO: implement listener
                          state.listState.maybeWhen(
                              orElse: () {},
                              success: (value) {
                                setState(() {
                                  data = value![0];
                                });
                              },
                              failure:
                                  (value, void Function() voidFunction) {});
                        },
                        builder: (context, state) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            height: 50,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                PopUpMenu(
                                  iconSize: 20,
                                  iconColor: Colors.black,
                                  items: [
                                    pubMenuItems(
                                        title: Translation().translate().edit,
                                        icon: Icons.edit,
                                        value: 1,
                                        onTap: () {
                                          ScreenType screenType;
                                          screenType =
                                              SettingChangeLestner.of(context)!
                                                  .state
                                                  .screenType!;
                                          ShowInputFieldsDialogs sd =
                                              ShowInputFieldsDialogs(
                                                  content:
                                                  OfferEditeDialog(),
                                                  screenType: screenType);
                                          sd.showDialogs(context,
                                              onResult: (data) {
                                            // bloc.getCategories();
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      data != null
                          ? Image(
                              image: NetworkImage(
                                data!.image!,
                              ),
                              fit: BoxFit.fill,
                              height: 100,
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
