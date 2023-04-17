
class ModelSKU{

  ModelSKU();
  String? sku_id;
  String? image;
  String? title;
  String? description;
  String? price;
  String? discount_price;
  String? discount;
  String? stock;
  String? category_id;
  int? qty;

  factory ModelSKU.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);
}

ModelSKU _$fromJson(Map<String, dynamic> json) {
  return ModelSKU()
    ..sku_id = json['sku_id'] as String
    ..image = json['image'] as String
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..price = json['price'] as String
    ..discount_price = json['discount_price'] as String
    ..discount = json['discount'] as String
    ..stock = json['stock'] as String
    ..category_id = json['category_id'] as String
    ..qty = json['qty'] != null ? json['qty'] as int : 0
  ;
}

Map<String, dynamic> _$toJson(ModelSKU cartCheckoutProduct) =>
    <String, dynamic> {
      'sku_id': cartCheckoutProduct.sku_id,
      'image': cartCheckoutProduct.image,
      'title': cartCheckoutProduct.title,
      'description': cartCheckoutProduct.description,
      'price': cartCheckoutProduct.price,
      'discount_price': cartCheckoutProduct.discount_price,
      'discount': cartCheckoutProduct.discount,
      'stock': cartCheckoutProduct.stock,
      'category_id': cartCheckoutProduct.category_id,
      'qty': cartCheckoutProduct.qty,
    };