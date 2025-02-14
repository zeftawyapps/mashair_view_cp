import 'dart:async';

import 'package:JoDija_DataSource/https/http_urls.dart';
 import 'package:JoDija_view/util/navigations/navigation_service.dart';
import 'package:JoDija_view/util/shardeprefrance/shard_check.dart';
import 'package:JoDija_view/util/widgits/screen_provider/screen_notfier.dart';
 import 'package:flutter/src/widgets/framework.dart';
import 'package:mashair_view_cp/bloc/auth_bloc.dart';
import 'package:mashair_view_cp/screens/nain_screen.dart';



class DashLogic extends ScreenStateNotifier
{

  bool isvisablity = false;
  bool isloading = false;
   // add setting
  void setvisablity(bool value){
    isvisablity = value;
    notifyListeners();
  }
  void setloading(bool value){
    isloading = value;
    notifyListeners();
  }
  void timer() async {
    try {
      Timer(Duration(seconds: 3), () {
        SharedPrefranceChecking sharedPrefranceChecking =
        SharedPrefranceChecking();
        sharedPrefranceChecking.IsUserRejised(
            isRegistAction: (s) async   {

              AuthBloc authBloc = AuthBloc() ;
        var result =    await     authBloc.signeInAsAdminFromTimer(map: {
                authBloc.emailKey: s.email,
                authBloc.passKey: s.pass
              });
              result.pick(onData: (v) {
                sharedPrefranceChecking.setDataInShardRefrace(
                    email: s.email!,
                    pass: s.pass!,
                    token: v.token!);
                HttpHeader().setAuthHeader(v.token!, Bearer: "Bearer__");
                NavigationService().replacementPage(path: MainScreen());
            }, onError: (error) {
                print(error);
              });

              HttpHeader().setAuthHeader(s.token!, Bearer: "Bearer__") ;
              NavigationService().replacementPage(path: MainScreen() ) ;

            },
            NotRegistAction: () => {

                isvisablity = true ,
              notifyListeners()
            });
      });
    } on Exception catch (e) {
      print(e);
    }
  }
  @override
  void createproviers(BuildContext contxt) {
    // TODO: implement createproviers
  }
}