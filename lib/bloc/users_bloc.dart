import 'package:JoDija_view/util/data_souce_bloc/base_state.dart';
import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:JoDija_view/util/data_souce_bloc/remote_base_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashir_service/data/logic_injicts.dart';
import 'package:mashir_service/data/model/users_data.dart';
import 'package:mashir_service/data/repo/users_repo.dart';

import '../data/category.dart';
import '../data/users.dart';

class UsersBloc extends Cubit<FeaturDataSourceState<UsersDataModel>> {
  UsersBloc()
      : super(FeaturDataSourceState<UsersDataModel>.defaultState()) {}

  void getUsers() {
    UsersRepo repo = UsersDataInjects.getUsersDataRepo();
    emit(state.copyWith(feadState: DataSourceBaseState.init()));
    emit(state.copyWith(listState: DataSourceBaseState.loading()));
    repo.getListData().then((value) {
      List<UsersDataModel> list = [];
      value.data!.forEach((element) {
        list.add(UsersDataModel(
            email: element.email,
            phone: element.phone,
            name: element.name,
            userType: element.userType,
            image: element.image,
            isDataComplate: element.isDataComplate,
            id: element.id));
      });

      emit(state.copyWith(listState: DataSourceBaseState.success(list)));
    }).catchError((e) {
      emit(state.copyWith(
          listState: DataSourceBaseState.failure(
              ErrorStateModel(message: e.toString()), () {})));
    });
  }
}
