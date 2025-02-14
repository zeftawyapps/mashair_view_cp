import 'package:JoDija_view/util/app_settings/settings_inherted.dart';
import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:JoDija_view/util/functions/show_dialog.dart';
import 'package:JoDija_view/util/main-screen/screen-type.dart';
import 'package:JoDija_view/util/widgits/pob_up_menues/items.dart';
import 'package:JoDija_view/util/widgits/pob_up_menues/pubUpmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/drow_engen/init.dart';

import '../../../../bloc/images_bloc.dart';
import '../../../../loclization/app_localizations.dart';
import '../../contents/content_interface.dart';
import '../../side_bar_tools/sid_bar_interface.dart';
import 'offers/otters_componants.dart';
import 'offers/widgets/add_imageEvent.dart';
import '../../../../../../data/images.dart';


class OffersContents extends StatelessWidget with IContent {
  OffersContents({ required this.sideBar
  }) : super() {
    index = sideBar!.index;
  }

  ISideBare? sideBar;



  var bloc ;




  @override
  Widget build(BuildContext context) {

  return  OffersComponents();
  }
}
