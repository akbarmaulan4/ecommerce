
class ModelBanner{

  ModelBanner();
  String? id_banner;
  String? image;
  String? title;
  String? description;

  factory ModelBanner.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);
}

ModelBanner _$fromJson(Map<String, dynamic> json) {
  return ModelBanner()
    ..id_banner = json['id_banner'] as String
    ..image = json['image'] as String
    ..title = json['title'] as String
    ..description = json['description'] as String
  ;
}

Map<String, dynamic> _$toJson(ModelBanner model) =>
    <String, dynamic> {
      'id_banner': model.id_banner,
      'image': model.image,
      'title': model.title,
      'description': model.description
    };