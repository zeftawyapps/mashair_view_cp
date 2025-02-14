import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:JoDija_view/util/validators/required_validator.dart';
import 'package:JoDija_view/util/widgits/images_widgets/image_model.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/form_validations.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/widgets/text_form_vlidation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/bloc/prod_bloc.dart';
import 'package:mashair_view_cp/data/product.dart';
import 'package:mashir_service/data/model/product.dart';
import 'package:provider/provider.dart';
import '../../../../../../../bloc/cat_bloc.dart';
import '../../../../../../../data/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../loclization/app_localizations.dart';
class AddProduct extends StatefulWidget {
    AddProduct({super.key ,   this.data, required this.id});
ProductViewDataModel? data;
String id  ;
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  ValidationsForm form = ValidationsForm();
  ProductBloc bloc = ProductBloc();
  TextEditingController nameController = TextEditingController();
  FileModel? fileModel;
  bool isLoad = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<ProductBloc>(context);
    bool isSmall = MediaQuery.of(context).size.width < 600;

    return Container(
      width: 200.w,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocListener<ProductBloc,
            FeaturDataSourceState<ProductViewDataModel>>(
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
                  Translation().translate().addProduct,

                ),
                SizedBox(height: 20.h),
                TextFomrFildValidtion(
                  controller: nameController,
                  initValue: widget.data?.name ,
                  keyData: ProductDataModel.nameKey ,
                  baseValidation: [RequiredValidator()],
                  labalText: Translation().translate().catigory,
                  padding: EdgeInsets.only(bottom: 30.h),
                  form: form,
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                    onPressed: () {
                      var data = form.getInputData();
                      if (widget.data  != null) {
                        String id = widget.data !.id!;

                         bloc.editProduct(data, widget.id   ,  id , fileModel);

                      } else {
                        bloc.addProduct(data,  widget.id  , null );
                      }
                    },
                    child: isLoad
                        ? CircularProgressIndicator()
                        : Text(
                      Translation().translate().add,
                      // style: DashboardDecorations.textFieldText.copyWith(
                      //   fontSize:   isSmall ?  20.sp :  10.sp,
                      // ),
                    ))
              ])),
        ),
      ),
    );
  }

}
