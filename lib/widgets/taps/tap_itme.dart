import 'package:flutter/material.dart';
import 'package:mashair_view_cp/widgets/taps/tap_item_interface.dart';
class TapItem extends StatelessWidget  implements ITapItems {
  TapItem({super.key
  , required this.index,
    this.tapController ,
      required this .child ,
  });

  @override
  Widget build(BuildContext context) {
    return  child ;
  }

  @override
  int index;

  @override
  TabController? tapController;

  @override
  Widget child;
}
