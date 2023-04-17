
class ModelAdress{

  ModelAdress();
  String? alamat_type;
  String? reciever_name;
  String? reciever_phone;
  String? reciever_email;
  String? city;
  String? postal_code;
  String? detail_address;
  String? notes;

  factory ModelAdress.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);
}

ModelAdress _$fromJson(Map<String, dynamic> json) {
  return ModelAdress()
    ..alamat_type = json['alamat_type'] as String
    ..reciever_name = json['reciever_name'] as String
    ..reciever_phone = json['reciever_phone'] as String
    ..reciever_email = json['reciever_email'] as String
    ..city = json['city'] as String
    ..postal_code = json['postal_code'] as String
    ..detail_address = json['detail_address'] as String
    ..notes = json['notes'] as String
  ;
}

Map<String, dynamic> _$toJson(ModelAdress cartCheckoutProduct) =>
    <String, dynamic> {
      'alamat_type': cartCheckoutProduct.alamat_type,
      'reciever_name': cartCheckoutProduct.reciever_name,
      'reciever_phone': cartCheckoutProduct.reciever_phone,
      'reciever_email': cartCheckoutProduct.reciever_email,
      'city': cartCheckoutProduct.city,
      'postal_code': cartCheckoutProduct.postal_code,
      'detail_address': cartCheckoutProduct.detail_address,
      'notes': cartCheckoutProduct.notes,
    };