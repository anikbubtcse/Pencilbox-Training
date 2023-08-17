class ReviewModel {
  ReviewModel({
    num? id,
    String? name,
    String? desc,
    String? photo,
    num? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _desc = desc;
    _photo = photo;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ReviewModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _desc = json['desc'];
    _photo = json['photo'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _name;
  String? _desc;
  String? _photo;
  num? _status;
  String? _createdAt;
  String? _updatedAt;

  ReviewModel copyWith({
    num? id,
    String? name,
    String? desc,
    String? photo,
    num? status,
    String? createdAt,
    String? updatedAt,
  }) =>
      ReviewModel(
        id: id ?? _id,
        name: name ?? _name,
        desc: desc ?? _desc,
        photo: photo ?? _photo,
        status: status ?? _status,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  String? get name => _name;

  String? get desc => _desc;

  String? get photo => _photo;

  num? get status => _status;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['desc'] = _desc;
    map['photo'] = _photo;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
