class CategoryResponse {
  String? sId;
  String? name;
  int? iV;

  CategoryResponse({this.sId, this.name, this.iV});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['__v'] = iV;
    return data;
  }
}
