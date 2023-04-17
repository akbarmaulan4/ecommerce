
class ModelPayment{

  ModelPayment();
  String? payment_id;
  String? image;
  String? payment_name;
  String? title;
  List<String>? how_to_pay;

  factory ModelPayment.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);
}

ModelPayment _$fromJson(Map<String, dynamic> json) {
  return ModelPayment()
    ..payment_id = json['payment_id'] as String
    ..image = json['image'] as String
    ..payment_name = json['payment_name'] as String
    ..title = json['title'] as String
    ..how_to_pay = (json['how_to_pay'] as List).map((e) => e.toString()).toList()
  ;
}

Map<String, dynamic> _$toJson(ModelPayment cartCheckoutProduct) =>
    <String, dynamic> {
      'payment_id': cartCheckoutProduct.payment_id,
      'image': cartCheckoutProduct.image,
      'payment_name': cartCheckoutProduct.payment_name,
      'title': cartCheckoutProduct.title,
      'how_to_pay': cartCheckoutProduct.how_to_pay,
    };