import 'package:flutter/material.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/image/widget/Background_show.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/image/widget/avatar_show.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/image/widget/stekker_show.dart';
import 'package:mashair_view_cp/widgets/taps/tap_widget.dart';

import '../../../../../widgets/taps/tap_itme.dart';
class ImageComponent extends StatefulWidget {
  const ImageComponent({super.key});

  @override
  State<ImageComponent> createState() => _ImageComponentState();
}

class _ImageComponentState extends State<ImageComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(


      child: Center(
        child: TapWidget(
          taps: [
            TapItem(
              index: 0,

              child: Text("افاتار"),
            ),
            TapItem(
              index: 1,

              child: Text("استيكرات"),
            ),
            TapItem(
              index: 2,

              child: Text("خلفيات"),
            ),

          ],
          children: [
            AvatarShow(),
            SteckerShow(),
            BackgroundShow(),

          ],
        ),
      ));
  }
}
