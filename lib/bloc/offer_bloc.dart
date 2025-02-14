import 'package:JoDija_DataSource/reposetory/repsatory_http.dart';
import 'package:JoDija_DataSource/source/firebase/crud_firebase_source.dart';
import 'package:JoDija_DataSource/utilis/models/base_data_model.dart';
import 'package:JoDija_DataSource/utilis/models/remote_base_model.dart';
import 'package:JoDija_view/util/data_souce_bloc/base_bloc.dart';
import 'package:JoDija_view/util/data_souce_bloc/base_state.dart';
import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:JoDija_view/util/data_souce_bloc/remote_base_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/data/category.dart';
import 'package:mashir_service/data/logic_injicts.dart';
import 'package:mashir_service/data/model/category.dart';
import 'package:mashir_service/data/model/offers.dart';
import 'package:mashir_service/data/repo/category_repo.dart';
import 'package:mashir_service/data/repo/offers_repo.dart';

import '../data/offer.dart';

class OfferBloc extends Cubit<FeaturDataSourceState<OfferViewDataModel>> {
  late OffersRepo repo;
  OfferBloc()
      : super(FeaturDataSourceState<OfferViewDataModel>.defaultState()) {
    repo = OfferInjects.injectOffer();
  }
  void setOffer(String id, Map<String, dynamic> data, Object? file) {
String name =   data['pramLink']["id"];
    OffersDataModel model = OffersDataModel(
        id: id,
        title:  "panner" ,
        image:  "",
        baseLink: "category",
        pramLink:  name );
    emit(state.copyWith(feadState: DataSourceBaseState.loading()));
    repo.addData(id, file,  model).then((value) {
      emit(state.copyWith(feadState: DataSourceBaseState.success("done ")));
    }).catchError((e) {
      emit(state.copyWith(
          feadState: DataSourceBaseState.failure(
              ErrorStateModel(message: e.toString()), () {})));
    });
  }

  void getOfferList() {
    emit(state.copyWith(listState: DataSourceBaseState.loading()));
    repo.getListData().then((value) {
      List<OfferViewDataModel> list = [];
      value.data!.forEach((element) {
        list.add(OfferViewDataModel(
            id: element.id,
            title: element.title,
            image: element.image,
            baseLink: element.baseLink,
          pramLink: element.pramLink,));
      });
      emit(state.copyWith(listState: DataSourceBaseState.success(list)));
    }).catchError((e) {
      emit(state.copyWith(
          feadState: DataSourceBaseState.failure(
              ErrorStateModel(message: e.toString()), () {})));
    });
  }
}
