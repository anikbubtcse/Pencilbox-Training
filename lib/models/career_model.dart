class CareerModel {
  CareerModel({
    Careers? careers,
  }) {
    _careers = careers;
  }

  CareerModel.fromJson(dynamic json) {
    _careers =
        json['careers'] != null ? Careers.fromJson(json['careers']) : null;
  }

  Careers? _careers;

  CareerModel copyWith({
    Careers? careers,
  }) =>
      CareerModel(
        careers: careers ?? _careers,
      );

  Careers? get careers => _careers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_careers != null) {
      map['careers'] = _careers?.toJson();
    }
    return map;
  }
}

class Careers {
  Careers({
    num? currentPage,
    List<Data>? data,
    String? firstPageUrl,
    num? from,
    num? lastPage,
    String? lastPageUrl,
    List<Links>? links,
    dynamic nextPageUrl,
    String? path,
    num? perPage,
    dynamic prevPageUrl,
    num? to,
    num? total,
  }) {
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _links = links;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
  }

  Careers.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }

  num? _currentPage;
  List<Data>? _data;
  String? _firstPageUrl;
  num? _from;
  num? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  dynamic _nextPageUrl;
  String? _path;
  num? _perPage;
  dynamic _prevPageUrl;
  num? _to;
  num? _total;

  Careers copyWith({
    num? currentPage,
    List<Data>? data,
    String? firstPageUrl,
    num? from,
    num? lastPage,
    String? lastPageUrl,
    List<Links>? links,
    dynamic nextPageUrl,
    String? path,
    num? perPage,
    dynamic prevPageUrl,
    num? to,
    num? total,
  }) =>
      Careers(
        currentPage: currentPage ?? _currentPage,
        data: data ?? _data,
        firstPageUrl: firstPageUrl ?? _firstPageUrl,
        from: from ?? _from,
        lastPage: lastPage ?? _lastPage,
        lastPageUrl: lastPageUrl ?? _lastPageUrl,
        links: links ?? _links,
        nextPageUrl: nextPageUrl ?? _nextPageUrl,
        path: path ?? _path,
        perPage: perPage ?? _perPage,
        prevPageUrl: prevPageUrl ?? _prevPageUrl,
        to: to ?? _to,
        total: total ?? _total,
      );

  num? get currentPage => _currentPage;

  List<Data>? get data => _data;

  String? get firstPageUrl => _firstPageUrl;

  num? get from => _from;

  num? get lastPage => _lastPage;

  String? get lastPageUrl => _lastPageUrl;

  List<Links>? get links => _links;

  dynamic get nextPageUrl => _nextPageUrl;

  String? get path => _path;

  num? get perPage => _perPage;

  dynamic get prevPageUrl => _prevPageUrl;

  num? get to => _to;

  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }
}

class Links {
  Links({
    dynamic url,
    String? label,
    bool? active,
  }) {
    _url = url;
    _label = label;
    _active = active;
  }

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }

  dynamic _url;
  String? _label;
  bool? _active;

  Links copyWith({
    dynamic url,
    String? label,
    bool? active,
  }) =>
      Links(
        url: url ?? _url,
        label: label ?? _label,
        active: active ?? _active,
      );

  dynamic get url => _url;

  String? get label => _label;

  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }
}

class Data {
  Data({
    num? id,
    String? title,
    String? slug,
    num? userId,
    String? careerShortDesc,
    String? careerDetails,
    String? careerImage,
    String? noOfVacancy,
    num? publicationStatus,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _title = title;
    _slug = slug;
    _userId = userId;
    _careerShortDesc = careerShortDesc;
    _careerDetails = careerDetails;
    _careerImage = careerImage;
    _noOfVacancy = noOfVacancy;
    _publicationStatus = publicationStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _slug = json['slug'];
    _userId = json['user_id'];
    _careerShortDesc = json['career_short_desc'];
    _careerDetails = json['career_details'];
    _careerImage = json['career_image'];
    _noOfVacancy = json['no_of_vacancy'];
    _publicationStatus = json['publication_status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _title;
  String? _slug;
  num? _userId;
  String? _careerShortDesc;
  String? _careerDetails;
  String? _careerImage;
  String? _noOfVacancy;
  num? _publicationStatus;
  String? _createdAt;
  String? _updatedAt;

  Data copyWith({
    num? id,
    String? title,
    String? slug,
    num? userId,
    String? careerShortDesc,
    String? careerDetails,
    String? careerImage,
    String? noOfVacancy,
    num? publicationStatus,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
        id: id ?? _id,
        title: title ?? _title,
        slug: slug ?? _slug,
        userId: userId ?? _userId,
        careerShortDesc: careerShortDesc ?? _careerShortDesc,
        careerDetails: careerDetails ?? _careerDetails,
        careerImage: careerImage ?? _careerImage,
        noOfVacancy: noOfVacancy ?? _noOfVacancy,
        publicationStatus: publicationStatus ?? _publicationStatus,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  String? get title => _title;

  String? get slug => _slug;

  num? get userId => _userId;

  String? get careerShortDesc => _careerShortDesc;

  String? get careerDetails => _careerDetails;

  String? get careerImage => _careerImage;

  String? get noOfVacancy => _noOfVacancy;

  num? get publicationStatus => _publicationStatus;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['slug'] = _slug;
    map['user_id'] = _userId;
    map['career_short_desc'] = _careerShortDesc;
    map['career_details'] = _careerDetails;
    map['career_image'] = _careerImage;
    map['no_of_vacancy'] = _noOfVacancy;
    map['publication_status'] = _publicationStatus;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
