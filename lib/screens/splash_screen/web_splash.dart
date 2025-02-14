import 'package:JoDija_view/util/navigations/navigation_service.dart';
import 'package:JoDija_view/util/validators/email_validator.dart';
import 'package:JoDija_view/util/validators/required_validator.dart';
import 'package:JoDija_view/util/widgits/data_source_bloc_widgets/data_source_bloc_listner.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/form_validations.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/widgets/text_form_vlidation.dart';
import 'package:animate_do/animate_do.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mashair_view_cp/screens/nain_screen.dart';
import 'package:mashir_service/configration.dart';
import 'package:provider/provider.dart';

import '../../../../app-configs.dart';
 import '../../../../consts/views/assets.dart';
import '../../../../consts/views/colors.dart';
import '../../../../loclization/app_localizations.dart';
 import '../../bloc/auth_bloc.dart';
import 'dash_logic.dart';

class WebSplash extends StatefulWidget {
  const WebSplash({super.key});

  @override
  State<WebSplash> createState() => _WebSplashState();
}

class _WebSplashState extends State<WebSplash> {
  bool isvisablity = false;
  bool isloading = false;
  AuthBloc authBloc = AuthBloc();

  ValidationsForm form = ValidationsForm();
  late DashLogic provider;
  // add controller to the form
  TextEditingController emailContrall = TextEditingController();
  TextEditingController passContrall  = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    // provider = Provider.of<DashLogic>(context );
    // provider.timer() ;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<DashLogic>(context);

    isvisablity = provider.isvisablity;
    // if (!isvisablity){
    //   provider.timer() ;}

    return FadeIn(
        child: Scaffold(
            body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.9,
          image: AssetImage(AppAsset.backgroundbgc2),
          fit: BoxFit.fill,
        ),
      ),
      child: DataSourceBlocListener(

        loading: () {
          setState(() {
            isloading = true;
          });
        },
        success: (data) {
          print(data);
          setState(() {
            isloading = false;
          });
           NavigationService().replacementPage(path: MainScreen());
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()) ) ;


        },
        failure: (error, dynamic Function() callback) {
          print(error);
          setState(() {
            isloading = false;
          });
        },
        bloc: authBloc.userBloc,
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xCB322D32),
                  image: DecorationImage(

                    image: AssetImage(AppAsset.imglogo),
                    fit: BoxFit.fill,

                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.purpleAccent.withOpacity(0.7),
                  //       blurRadius: 10,
                  //       offset: Offset(0, 5))
                  // ],
                ),
                duration: Duration(milliseconds: 400),
                height: isvisablity ? 0.h: 170.h ,
                width:  isvisablity? 0.w:  70.w  ,
              ).animate().fadeOut(delay: Duration(milliseconds: 1500)),
              SizedBox(
                height: isvisablity ? 0 : 20,
              ),
              AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0x24FFFFFF),
                boxShadow: [
                  BoxShadow(
                      color:  Color(0x27FBE5FB),
                      blurRadius: 10,
                      offset: Offset(0, 5))
                ],),
                duration: Duration(milliseconds: 400),
                height: isvisablity ? 500.h : 0,
                width: 150.w,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        Translation().translate().dashbordTitle,
                        style: TextStyle(
                          color: Colors.white,

                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      form.buildChildrenWithColumn(context: context, children: [
                        TextFomrFildValidtion(
                           controller:  emailContrall,
                          form: form,
                          baseValidation: [EmailValidator(), RequiredValidator()],
                          decoration: InputDecoration(
                            labelText: Translation().translate().email,
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 5.sp),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 5.sp),
                          labalText: Translation().translate().email,
                          keyData: "email",
                        ).animate().fadeIn(delay: Duration(milliseconds: 1800)),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFomrFildValidtion(
                           controller:  passContrall,
                          form: form,
                          onFieldSubmitted: (v) {
                            onSubmitted();
                          },
                          baseValidation: [RequiredValidator()],
                          decoration: InputDecoration(
                            labelText: Translation().translate().password,
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 5.sp),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 5.sp),
                          labalText: Translation().translate().password,
                          keyData: "pass",
                          isPssword: true,
                        ).animate().fadeIn(delay: Duration(milliseconds: 2000)),
                        SizedBox(
                          height: 25.h,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            onSubmitted( );
                          },
                          child: isloading
                              ? Container(
                                  height: 100.h,
                                  child:
                                      Center(child: CircularProgressIndicator()))
                              : Container(
                                  height: 100.h,
                                  child: Center(
                                    child: Text(
                                      Translation().translate().signIn,
                                      style: TextStyle(

                                          fontSize: 5.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        // AppConfigration().isDev()
                        //     ? Text("${AppConfigration().Version}   dev " ,style: TextStyle(color: Colors.white,fontSize: 5.sp),)
                        //     : Text( "${AppConfigration().Version}",style: TextStyle(color: Colors.white,fontSize: 5.sp)),

                      ])
                    ],
                  ),
                ),
              )

                  ,



            ]),
          ),
        ),
      ),
    )));
  }

  void onSubmitted( ) {


    if (isloading) {
      return;
    }

    if (form.form.currentState!.validate()) {
      form.form.currentState!.save();
      var data = form.getInputData();
      authBloc.signeInAsAdmin(map: data);
      print(data);
    }
  }
}
