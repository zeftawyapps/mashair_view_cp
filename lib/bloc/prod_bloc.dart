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
import 'package:mashir_service/data/repo/category_repo.dart';
import 'package:mashir_service/data/repo/products_repo.dart';

import '../data/product.dart';

class ProductBloc extends Cubit<FeaturDataSourceState<ProductViewDataModel>> {
  ProductBloc()
      : super(FeaturDataSourceState<ProductViewDataModel>.defaultState()) {}

  // add the bloc logic here
  void addProduct(Map<String, dynamic> data, String catId , Object ? file) {
    ProductsRepo repo =
    ProductInjects.addProduct(dataModel: data, categoryId: catId
        , file: file
    );

    emit(state.copyWith(feadState: DataSourceBaseState.loading()));
    repo.addData().then((value) {
      emit(state.copyWith(feadState: DataSourceBaseState.success("done ")));
    }).catchError((e) {
      emit(state.copyWith(
          feadState: DataSourceBaseState.failure(
              ErrorStateModel(message: e.toString()), () {})));
    });
  }

  void editProduct(Map<String, dynamic> data, String catId, String id ,
      Object ? file
      ) {
    ProductsRepo repo =
        ProductInjects.addProduct(dataModel: data, categoryId: catId
        , file: file
        );


    emit(state.copyWith(feadState: DataSourceBaseState.loading()));
    repo.updateData(id).then((value) {
      emit(state.copyWith(feadState: DataSourceBaseState.success("done ")));
    }).catchError((e) {
      emit(state.copyWith(
          feadState: DataSourceBaseState.failure(
              ErrorStateModel(message: e.toString()), () {})));
    });
  }



  void editProductProperty( ProductViewDataModel data , String catId, String id ,) {
    ProductsRepo repo =
    ProductInjects.editProduct(dataModel: data!.toJson(), categoryId: catId , id: id);


    emit(state.copyWith(feadState: DataSourceBaseState.loading()));
    repo.updateData(id).then((value) {
      emit(state.copyWith(feadState: DataSourceBaseState.success("done ")));
    }).catchError((e) {
      emit(state.copyWith(
          feadState: DataSourceBaseState.failure(
              ErrorStateModel(message: e.toString()), () {})));
    });
  }




// delete
  void deleteProduct(String catId,  String id) {
    ProductsRepo repo = ProductInjects.deleteProduct(
      categoryId: catId ,
    );

    emit(state.copyWith(feadState: DataSourceBaseState.loading()));
    repo.deleteData(id).then((value) {
      emit(state.copyWith(feadState: DataSourceBaseState.success("done ")));
    }).catchError((e) {
      emit(state.copyWith(
          feadState: DataSourceBaseState.failure(
              ErrorStateModel(message: e.toString()), () {})));
    });
  }



  void getProductsData (String id , String  prodId ) {
    // emit(state.copyWith(feadState: DataSourceBaseState.init()));

    ProductsRepo repo = ProductInjects.getProductRepo(id);
    emit(state.copyWith(itemState: DataSourceBaseState.loading()));
    repo.getSingleData(prodId)
        .then((value) {
      if (value.error != null) {
        emit(state.copyWith(
            itemState: DataSourceBaseState.failure(
                ErrorStateModel(message: value.error!.toString()), () {})));
      } else {
        var data = value.data ;


        emit(state.copyWith(itemState: DataSourceBaseState.success(ProductViewDataModel(
          image: data!.image,
          name: data.name,
          cardData: data.cardData,
          id: data.id,
        ))));
      }
    }).catchError((e) {
      emit(state.copyWith(
          listState: DataSourceBaseState.failure(
              ErrorStateModel(message: e.toString()), () {})));
    });
  }



// get the list of the data
  void getProductsList(String id) {
    emit(state.copyWith(feadState: DataSourceBaseState.init()));

    ProductsRepo repo = ProductInjects.getProductRepo(id);
    emit(state.copyWith(listState: DataSourceBaseState.loading()));
    repo.getListData().then((value) {
      if (value.error != null) {
        emit(state.copyWith(
            listState: DataSourceBaseState.failure(
                ErrorStateModel(message: value.error!.toString()), () {})));
      } else {
        var data = value.data!
            .map((e) => ProductViewDataModel(
                  image: e.image,
                  name: e.name,
                  cardData: e.cardData,
                  isFeatured: e.isFeatured,
                  isPublished: e.isPublished,
                  language: e.language ,
                  id: e.id,
                ))
            .toList();

        emit(state.copyWith(listState: DataSourceBaseState.success(data)));
      }
    }).catchError((e) {
      emit(state.copyWith(
          listState: DataSourceBaseState.failure(
              ErrorStateModel(message: e.toString()), () {})));
    });
  }
}
