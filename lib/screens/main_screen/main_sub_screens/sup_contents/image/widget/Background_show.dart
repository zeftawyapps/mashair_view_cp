import 'package:JoDija_view/util/app_settings/settings_inherted.dart';
import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:JoDija_view/util/functions/show_dialog.dart';
import 'package:JoDija_view/util/main-screen/screen-type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/image/widget/add_imageBackgrund.dart';

import '../../../../../../bloc/images_bloc.dart';
import '../../../../../../data/images.dart';
import '../../../../../../widgets/grid_view_model.dart';
import 'add_imageSticker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BackgroundShow extends StatefulWidget {
  const BackgroundShow({super.key});

  @override
  State<BackgroundShow> createState() => _BackgroundShowState();
}

class _BackgroundShowState extends State<BackgroundShow> {

  late ImagesBloc bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<ImagesBloc>(context);
    bloc.getImagesBackground();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScreenType screenType;
          screenType =
          SettingChangeLestner.of(context)!.state.screenType!;
          ShowInputFieldsDialogs sd = ShowInputFieldsDialogs(
              content: AddImagesBackgroundDialog(), screenType: screenType);
          sd.showDialogs(context, onResult: (data) {});
        },
        child: Icon(Icons.add , color: Colors.white,),
      ),
      body: Container(
        child:    BlocConsumer<ImagesBloc, FeaturDataSourceState<Images>>(
          listener: (context, state) {
            state.feadState.maybeWhen(
                orElse: () {},
                success: (value) {
                  bloc.getImagesBackground();
                },
                failure: (value, void Function() voidFunction) {});
          },
          builder: (context, state) {
            return state.listState.maybeWhen(orElse: () {
              return Container();
            }, loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            }, success: (data) {
              return GridViewModel<Images>(
                data: data!,
                listItem: (index, data) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,

                      image: DecorationImage(
                        image: NetworkImage(
                          data.image!,
                        ),
                        fit: BoxFit.fill,
                      ),

                    ),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            bloc.deleteBackground(data!.id!);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.close_sharp,
                              color: Colors.white,
                              size: 35.sp ,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }, failure: (value, void Function() voidFunction) {
              return Container();
            });
          },
        ),

      ),
    );
  }
}
