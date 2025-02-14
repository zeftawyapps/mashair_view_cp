import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:JoDija_view/util/widgits/collections_widgets/grid_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/images_bloc.dart';
import '../../../../data/images.dart';

class LoadImages extends StatefulWidget {
   LoadImages({super.key  });

  @override
  State<LoadImages> createState() => _LoadImagesState();
}

class _LoadImagesState extends State<LoadImages> {
late   NetworkImagesBloc bloc ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  bloc = context.read<NetworkImagesBloc>();
  bloc.getImagesAvatar() ;

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Container(
        child:    BlocBuilder <NetworkImagesBloc, FeaturDataSourceState<Images>>(

          builder: (context, state) {
            return state.listState.maybeWhen(orElse: () {
              return Container();
            }, loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            }, success: (data) {
              return Container(
                height: 300,
                child: GridViewModel<Images>(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  data: data!,
                  listItem: (index, data) {
                    return GestureDetector(
                      onTap: (){
                      Navigator.of(context).pop(data);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,

                          image: DecorationImage(
                            image: NetworkImage(
                              data.image!,
                            ),
                            fit: BoxFit.fill,
                          ),

                        ),

                      ),
                    );
                  },
                ),
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
