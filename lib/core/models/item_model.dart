class ItemModel {
  //
  String? imageUrl;
  String? name;
  String? model;
  String? color;
  ItemModel({
    required this.color,
    required this.imageUrl,
    required this.name,
    required this.model,
  });
  toJson() {
    Map<String, dynamic> data = {};
    data['imageUrl'] = imageUrl;
    data['color'] = color;
    data['name'] = name;
    data['model'] = model;
    return data;
  }

  ItemModel.fromJson(json) {
    color = json['color'];
    name = json['name'];
    model = json['model'];
    imageUrl = json['imageUrl'];
  }
}
