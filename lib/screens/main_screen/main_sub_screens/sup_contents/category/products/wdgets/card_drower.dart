  import 'package:flutter/material.dart';
import 'package:mashair_view_cp/data/product.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/mobile/mobile_drow_main_page.dart';

import 'dfawing/main_page.dart';
class CardDrower extends StatefulWidget {
   CardDrower({super.key , this.data , required   this.catId  });
ProductViewDataModel? data ;
String  catId ;
  @override
  State<CardDrower> createState() => _CardDrowerState();
}

class _CardDrowerState extends State<CardDrower> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;


    return isMobile ? AppMoblieDrawEngenePages(data:  widget.data , catId: widget.catId) :  AppDrawEngenePages(data:  widget.data , catId: widget.catId);
  }
}
