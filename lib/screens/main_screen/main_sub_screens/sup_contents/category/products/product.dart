import 'package:JoDija_view/util/data_souce_bloc/feature_data_source_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashair_view_cp/bloc/prod_bloc.dart';
import 'package:mashair_view_cp/screens/main_screen/main_sub_screens/sup_contents/category/products/wdgets/product_componant.dart';
import 'package:mashir_service/data/model/category.dart';

import '../../../../../../data/category.dart';
import '../../../../../../data/product.dart';

class Products extends StatefulWidget {
  Products({super.key, required this.cagory});

  CategoryDataModel cagory;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cagory.name),
      ),
      body: ProductComponant(  id: widget.cagory.id!)

    );
  }
}
