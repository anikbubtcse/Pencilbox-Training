class FaqModel {
  FaqModel({
      List<Faqs>? faqs,}){
    _faqs = faqs;
}

  FaqModel.fromJson(dynamic json) {
    if (json['faqs'] != null) {
      _faqs = [];
      json['faqs'].forEach((v) {
        _faqs?.add(Faqs.fromJson(v));
      });
    }
  }
  List<Faqs>? _faqs;
FaqModel copyWith({  List<Faqs>? faqs,
}) => FaqModel(  faqs: faqs ?? _faqs,
);
  List<Faqs>? get faqs => _faqs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_faqs != null) {
      map['faqs'] = _faqs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Faqs {
  Faqs({
      num? id, 
      String? title, 
      String? description, 
      num? publicationStatus, 
      String? createdAt,}){
    _id = id;
    _title = title;
    _description = description;
    _publicationStatus = publicationStatus;
    _createdAt = createdAt;
}

  Faqs.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _publicationStatus = json['publication_status'];
    _createdAt = json['created_at'];
  }
  num? _id;
  String? _title;
  String? _description;
  num? _publicationStatus;
  String? _createdAt;
Faqs copyWith({  num? id,
  String? title,
  String? description,
  num? publicationStatus,
  String? createdAt,
}) => Faqs(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  publicationStatus: publicationStatus ?? _publicationStatus,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  num? get publicationStatus => _publicationStatus;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['publication_status'] = _publicationStatus;
    map['created_at'] = _createdAt;
    return map;
  }

}