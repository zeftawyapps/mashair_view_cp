import 'package:JoDija_view/util/view_data_model/base_data_model.dart';
import 'package:mashir_service/data/model/category.dart';
import 'package:mashir_service/data/model/product.dart';

class ProductViewDataModel extends ProductDataModel implements BaseViewDataModel {
  ProductViewDataModel({required super.name, required super.image ,
    super.isFeatured = false  , super.isPublished =false ,
    super.language ,

  required super.cardData , required super.id});

}