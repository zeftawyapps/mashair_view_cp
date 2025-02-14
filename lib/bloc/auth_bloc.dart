 import 'package:JoDija_DataSource/model/user/base_model/base_user_module.dart';
import 'package:JoDija_DataSource/model/user/base_model/inhertid_models/user_model.dart';
import 'package:JoDija_DataSource/source/user/accountLoginLogout/auth_email_source.dart';
import 'package:JoDija_DataSource/source/user/accountLoginLogout/http/auth_http_acc.dart';
  import 'package:JoDija_DataSource/utilis/models/remote_base_model.dart';
import 'package:JoDija_DataSource/utilis/result/result.dart';
  import 'package:JoDija_view/util/data_souce_bloc/base_bloc.dart';
import 'package:JoDija_view/util/data_souce_bloc/remote_base_model.dart';
import 'package:JoDija_view/util/shardeprefrance/shard_check.dart';
import 'package:mashir_service/data/logic_injicts.dart';
import 'package:mashir_service/data/model/user.dart';
import 'package:mashir_service/data/repo/auth_repo.dart';




class AuthBloc {
  String emailKey = "email";
  String nameKey = "name";
  String passKey = "pass";
  String phone = "phone";
  String rePass = "rePass";

  DataSourceBloc<UserData> userBloc =
  DataSourceBloc<UserData>();

  void signUp({required Map<String, dynamic> map}) async {

  }

  void sugneIn({required Map<String, dynamic> map}) async {

  }
  void signeInAsAdmin({required Map<String, dynamic> map}) async {
LogicAuthRepo accountSource =  AuthInjects.signIn(map: map);
userBloc.loadingState();
  var result = await accountSource.logIn();
  result.pick(onData: (v) {
    SharedPrefranceChecking sharedPrefranceChecking =  SharedPrefranceChecking();
    sharedPrefranceChecking.setDataInShardRefrace(    email: v.email! , pass: map[passKey]!
        , token: v.token!
    );
    UserData user =   UserData.fromJson(v.toJson());
    userBloc.successState(  user   )   ;
  }, onError: (error) {
    userBloc.failedState(ErrorStateModel(message: error.message) , () {});
  });

  }
  Future <Result<RemoteBaseModel<dynamic>, UsersBaseModel>>   signeInAsAdminFromTimer({required Map<String, dynamic> map}) async {
    LogicAuthRepo accountSource =  AuthInjects.signIn(map: map);
    userBloc.loadingState();
    var result = await accountSource.logIn();
    return result;
  }

}
