class SubDistrictModel {
  SubDistrictModel({
    String? id,
    String? districtId,
    String? name,
    String? bnName,
    String? url,
  }) {
    _id = id;
    _districtId = districtId;
    _name = name;
    _bnName = bnName;
    _url = url;
  }

  SubDistrictModel.fromJson(dynamic json) {
    _id = json['id'];
    _districtId = json['district_id'];
    _name = json['name'];
    _bnName = json['bn_name'];
    _url = json['url'];
  }

  String? _id;
  String? _districtId;
  String? _name;
  String? _bnName;
  String? _url;

  SubDistrictModel copyWith({
    String? id,
    String? districtId,
    String? name,
    String? bnName,
    String? url,
  }) =>
      SubDistrictModel(
        id: id ?? _id,
        districtId: districtId ?? _districtId,
        name: name ?? _name,
        bnName: bnName ?? _bnName,
        url: url ?? _url,
      );

  String? get id => _id;

  String? get districtId => _districtId;

  String? get name => _name;

  String? get bnName => _bnName;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['district_id'] = _districtId;
    map['name'] = _name;
    map['bn_name'] = _bnName;
    map['url'] = _url;
    return map;
  }
}
