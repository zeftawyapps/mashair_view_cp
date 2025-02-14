import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/bloc/cat_bloc.dart';
import 'package:mashair_view_cp/data/category.dart';

class CategoryListDialog extends StatefulWidget {
  const CategoryListDialog({super.key});

  @override
  State<CategoryListDialog> createState() => _CategoryListDialogState();
}

class _CategoryListDialogState extends State<CategoryListDialog> {
  late CategoryBloc bloc = CategoryBloc();
  @override
  void initState() {
    // TODO: implement initState
    bloc = BlocProvider.of<CategoryBloc>(context);
    bloc.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocBuilder<CategoryBloc,
                  FeaturDataSourceState<CategoryViewDataModel>>(
              builder: (context, state) {
            return state.listState.maybeWhen(
              orElse: () => Container(),
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
              success: (data) => Container(
                child: Column(
                  children: [
                    Expanded(child: Text('Select Category'
                    ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    )),
                    Expanded( flex: 2,
                      child: ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(data[index].name),
                            onTap: () {
                              Navigator.pop(context, data[index]);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              failure: (error, dd) => Center(
                child: Text(error!.message!),
              ),
            );
          }),
        ));
  }
}
