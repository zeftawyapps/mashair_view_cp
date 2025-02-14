import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:JoDija_view/util/validators/required_validator.dart';
import 'package:JoDija_view/util/widgits/data_source_bloc_widgets/data_source_bloc_listner.dart';
import 'package:JoDija_view/util/widgits/images_widgets/add_image.dart';
import 'package:JoDija_view/util/widgits/images_widgets/image_model.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/form_validations.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/widgets/text_form_vlidation.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mashair_view_cp/data/category.dart';
import 'package:mashir_service/data/model/category.dart';
import 'package:provider/provider.dart';

import '../../../../../../../consts/views/assets.dart';
import '../../../../../../../consts/views/decoration.dart';
import '../../../../../bloc/cat_bloc.dart';
import '../../../../../loclization/app_localizations.dart';

class AddCatigoryDialog extends StatefulWidget {
  AddCatigoryDialog({super.key, this.categoryBaseModel});
  CategoryViewDataModel? categoryBaseModel;

  @override
  State<AddCatigoryDialog> createState() => _AddCatigoryDialogState();
}

class _AddCatigoryDialogState extends State<AddCatigoryDialog> {
  ValidationsForm form = ValidationsForm();
  CategoryBloc bloc = CategoryBloc();
  TextEditingController nameController = TextEditingController();
  TextEditingController nameEnController = TextEditingController();

  FileModel? fileModel;
  bool isLoad = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<CategoryBloc>(context);
    bool isSmall = MediaQuery.of(context).size.width < 600;

    return Container(
      width: 50.w,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocListener<CategoryBloc,
            FeaturDataSourceState<CategoryViewDataModel>>(
          listener: (context, state) {
            state.feadState.maybeWhen(
              orElse: () {},
              success: (data) {
                Navigator.pop(context);
              },
              loading: () {
                setState(() {
                  isLoad = true;
                });
              },
            );
          },
          child: SingleChildScrollView(
              child: form.buildChildrenWithColumn(context: context, children: [
            Text(
              Translation().translate().addCatigory,

            ),
            SizedBox(height: 20.h),
                ImagePecker(
                  shape: BoxShape.rectangle,
                  onImage: (FileModel file) {
                    fileModel = file;

                  },
                  networkImage: widget.categoryBaseModel?.image ?? "",
                  place: AppAsset.card,
                  hight: 170.h,
                ),


            TextFomrFildValidtion(
              controller: nameController,
              initValue: widget.categoryBaseModel?.name,
              keyData: bloc.nameKey,
              baseValidation: [RequiredValidator()],
              labalText: Translation().translate().catigory,
              padding: EdgeInsets.only(bottom: 30.h),
              form: form,
            ),
                SizedBox(height: 20.h),
                TextFomrFildValidtion(
                  controller: nameEnController,
                  initValue: widget.categoryBaseModel?.nameEn,
                  keyData: bloc.nameEnKey,
                  baseValidation: [RequiredValidator()],
                  labalText: Translation().translate().catigoryEn,
                  padding: EdgeInsets.only(bottom: 30.h),
                  form: form,
                ),
            SizedBox(height: 20.h),
            ElevatedButton(
                onPressed: () {
                  var file = kIsWeb?
                  fileModel== null?null:fileModel!.Imagebytes! :
                  fileModel == null ? null : fileModel!.fileImage
                  ;
                  var data = form.getInputData();
                  if (widget.categoryBaseModel != null) {
                    String id = widget.categoryBaseModel!.id!;
                    data[CategoryDataModel.imageKey] = widget.categoryBaseModel!.image;
                    // bloc.ed(map: data , id:id  );
                    bloc.editCategory(data, file , id );
                  } else {
                    bloc.AddCategory(data, file );
                  }
                },
                child: isLoad
                    ? CircularProgressIndicator()
                    : Text(
                        Translation().translate().add,

                      ))
          ])),
        ),
      ),
    );
  }
}
