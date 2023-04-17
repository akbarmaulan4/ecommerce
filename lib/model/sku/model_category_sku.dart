
import 'package:tokoonline/model/sku/model_sku.dart';

class ModelCategorySKU{
  ModelCategorySKU(){}
  String? title;
  List<ModelSKU>? data;

  factory ModelCategorySKU.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);
}

ModelCategorySKU _$fromJson(Map<String, dynamic> json) {
  return ModelCategorySKU()
    ..title = json['title'] as String
    ..data = (json['data'] as List?)?.map((e) => e == null ? null : ModelSKU.fromJson(e as Map<String, dynamic>)).cast<ModelSKU>().toList()
    // ..data = (json['data'] as List<ModelSKU>?).map((e) => e == null ? null : ModelSKU.fromJson(e as Map<String, dynamic>)).toList()
  ;
}

Map<String, dynamic> _$toJson(ModelCategorySKU cartCheckoutProduct) =>
    <String, dynamic> {
      'title': cartCheckoutProduct.title,
      'data': cartCheckoutProduct.data
    };