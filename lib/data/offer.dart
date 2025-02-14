import 'package:JoDija_view/util/view_data_model/base_data_model.dart';
import 'package:mashir_service/data/model/offers.dart';

class OfferViewDataModel extends OffersDataModel implements BaseViewDataModel {
  OfferViewDataModel(
      {super.isStart = false,
      required super.image,
      required super.title,
      required super.baseLink,
      required super.pramLink,
      required super.id});
}
