import 'package:JoDija_view/util/app_settings/settings_inherted.dart';
import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:JoDija_view/util/functions/show_dialog.dart';
import 'package:JoDija_view/util/main-screen/screen-type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/bloc/users_bloc.dart';

import '../../../../../data/users.dart';
import 'dialoge.dart';

class UsersComponant extends StatefulWidget {
  const UsersComponant({super.key});

  @override
  State<UsersComponant> createState() => _UsersComponantState();
}

class _UsersComponantState extends State<UsersComponant> {
  late UsersBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    bloc = BlocProvider.of<UsersBloc>(context);
    bloc.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, FeaturDataSourceState<UsersDataModel>>(
      builder: (context, state) {
        return state.listState.maybeWhen(orElse: () {
          return Container();
        }, success: (data) {
          return Container(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      ScreenType screenType;
                      screenType =
                          SettingChangeLestner.of(context)!.state.screenType!;
                      ShowInputFieldsDialogs sd = ShowInputFieldsDialogs(
                        height: 700 ,
                          content: UserDetailsDialog(data:  data[index ]! ,), screenType: screenType);
                      sd.showDialogs(context, onResult: (data) {

                      });
                    },
                    title:
                        Text(data[index].name!, style: TextStyle(fontSize: 20)),
                    subtitle: Text(data[index].email!,
                        style: TextStyle(fontSize: 15)),
                  ),
                );
              },
            ),
          );
        }, loading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        }, failure: (error, d) {
          return Center(child: Text(error!.message!));
        });
      },
    );
  }
}
