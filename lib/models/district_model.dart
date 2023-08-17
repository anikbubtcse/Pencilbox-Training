class DistrictModel {
  DistrictModel({
    String? id,
    String? divisionId,
    String? name,
    String? bnName,
    String? lat,
    String? lon,
    String? url,
  }) {
    _id = id;
    _divisionId = divisionId;
    _name = name;
    _bnName = bnName;
    _lat = lat;
    _lon = lon;
    _url = url;
  }

  DistrictModel.fromJson(dynamic json) {
    _id = json['id'];
    _divisionId = json['division_id'];
    _name = json['name'];
    _bnName = json['bn_name'];
    _lat = json['lat'];
    _lon = json['lon'];
    _url = json['url'];
  }

  String? _id;
  String? _divisionId;
  String? _name;
  String? _bnName;
  String? _lat;
  String? _lon;
  String? _url;

  DistrictModel copyWith({
    String? id,
    String? divisionId,
    String? name,
    String? bnName,
    String? lat,
    String? lon,
    String? url,
  }) =>
      DistrictModel(
        id: id ?? _id,
        divisionId: divisionId ?? _divisionId,
        name: name ?? _name,
        bnName: bnName ?? _bnName,
        lat: lat ?? _lat,
        lon: lon ?? _lon,
        url: url ?? _url,
      );

  String? get id => _id;

  String? get divisionId => _divisionId;

  String? get name => _name;

  String? get bnName => _bnName;

  String? get lat => _lat;

  String? get lon => _lon;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['division_id'] = _divisionId;
    map['name'] = _name;
    map['bn_name'] = _bnName;
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['url'] = _url;
    return map;
  }
}
