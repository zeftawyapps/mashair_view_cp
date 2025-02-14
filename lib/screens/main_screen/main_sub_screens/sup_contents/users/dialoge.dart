import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:JoDija_view/util/widgits/images_widgets/image_model.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/form_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mashair_view_cp/bloc/images_bloc.dart';
import 'package:mashair_view_cp/data/images.dart';
import 'package:provider/provider.dart';

import '../../../../../data/users.dart';




class UserDetailsDialog extends StatefulWidget {
  UserDetailsDialog({super.key  , this.data });
  UsersDataModel? data;


  @override
  State<UserDetailsDialog> createState() => _UserDetailsDialogState();
}

class _UserDetailsDialogState extends State<UserDetailsDialog> {
  ValidationsForm form = ValidationsForm();
  ImagesBloc bloc = ImagesBloc();
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
    bloc = Provider.of<ImagesBloc>(context);
    bool isSmall = MediaQuery.of(context).size.width < 600;

    return Container(
      width: 50.w,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [ListTile(
            title:  Text("الاسم", style: TextStyle(fontSize: 15),),
            subtitle: Text(widget.data!.name!, style: TextStyle(fontSize: 20),),
          ) ,
            ListTile(
              title:  Text("البريد الالكتروني", style: TextStyle(fontSize: 15),),
              subtitle: Text(widget.data!.email!, style: TextStyle(fontSize: 20),),
            ) ,
            ListTile(
              title:  Text("رقم الهاتف", style: TextStyle(fontSize: 15),),
              subtitle: Text(widget.data!.phone??"", style: TextStyle(fontSize: 20),),
            ) ,
            ListTile(
              title:  Text("نوع المستخدم", style: TextStyle(fontSize: 15),),
              subtitle: Text(widget.data!.userType!, style: TextStyle(fontSize: 20),),
            ) ,

            ListTile(
              title:  Text("الحالة", style: TextStyle(fontSize: 15),),
              subtitle: Text(widget.data!.isDataComplate! ? "مكتملة" : "غير مكتملة", style: TextStyle(fontSize: 20),),
            ) ,
          ],
        ),
        ),
      ) ;

  }
}
