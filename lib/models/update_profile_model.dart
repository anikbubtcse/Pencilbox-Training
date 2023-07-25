class UpdateProfileModel {
  UpdateProfileModel({
    required num? id,
    required String? username,
    required String? fullName,
    required String? emailAddress,
    required String? cusCountry,
    required String? cusCity,
    required String? cusState,
    required String? cusAdd1,
    required String? cusAdd2,
    required String? cusPostcode,
    required String? facebook,
    required String? instagram,
    required String? linkedin,
    required String? twitter,
    required dynamic about,
    required String? phoneNumber,
  }) {
    _id = id;
    _username = username;
    _fullName = fullName;
    _emailAddress = emailAddress;
    _cusCountry = cusCountry;
    _cusState = cusState;
    _cusCity = cusCity;
    _cusAdd1 = cusAdd1;
    _cusAdd2 = cusAdd2;
    _cusPostcode = cusPostcode;
    _facebook = facebook;
    _instagram = instagram;
    _linkedin = linkedin;
    _twitter = twitter;
    _about = about;
    _phoneNumber = phoneNumber;
  }

  UpdateProfileModel.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _fullName = json['full_name'];
    _emailAddress = json['email_address'];
    _cusCountry = json['cus_country'];
    _cusState = json['cus_state'];
    _cusCity = json['cus_city'];
    _cusAdd1 = json['cus_add1'];
    _cusAdd2 = json['cus_add2'];
    _cusPostcode = json['cus_postcode'];
    _facebook = json['facebook'];
    _instagram = json['instagram'];
    _linkedin = json['linkedin'];
    _twitter = json['twitter'];
    _about = json['about'];
    _phoneNumber = json['phone_number'];
  }

  num? _id;
  String? _username;
  String? _fullName;
  String? _emailAddress;
  String? _cusCountry;
  String? _cusState;
  String? _cusCity;
  String? _cusAdd1;
  String? _cusAdd2;
  String? _cusPostcode;
  String? _facebook;
  String? _instagram;
  String? _linkedin;
  String? _twitter;
  dynamic _about;
  String? _phoneNumber;

  UpdateProfileModel copyWith({
    num? id,
    String? username,
    String? fullName,
    String? emailAddress,
    String? cusCountry,
    String? cusState,
    String? cusCity,
    String? cusAdd1,
    String? cusAdd2,
    String? cusPostcode,
    String? facebook,
    String? instagram,
    String? linkedin,
    String? twitter,
    dynamic about,
    String? phoneNumber,
  }) =>
      UpdateProfileModel(
        id: id ?? _id,
        username: username ?? _username,
        fullName: fullName ?? _fullName,
        emailAddress: emailAddress ?? _emailAddress,
        cusCountry: cusCountry ?? _cusCountry,
        cusState: cusState ?? _cusState,
        cusCity: cusCity ?? _cusCity,
        cusAdd1: cusAdd1 ?? _cusAdd1,
        cusAdd2: cusAdd2 ?? _cusAdd2,
        cusPostcode: cusPostcode ?? _cusPostcode,
        facebook: facebook ?? _facebook,
        instagram: instagram ?? _instagram,
        linkedin: linkedin ?? _linkedin,
        twitter: twitter ?? _twitter,
        about: about ?? _about,
        phoneNumber: phoneNumber ?? _phoneNumber,
      );

  num? get id => _id;

  String? get username => _username;

  String? get fullName => _fullName;

  String? get emailAddress => _emailAddress;

  String? get cusCountry => _cusCountry;

  String? get cusState => _cusState;

  String? get cusCity => _cusCity;

  String? get cusAdd1 => _cusAdd1;

  String? get cusAdd2 => _cusAdd2;

  String? get cusPostcode => _cusPostcode;

  String? get facebook => _facebook;

  String? get instagram => _instagram;

  String? get linkedin => _linkedin;

  String? get twitter => _twitter;

  dynamic get about => _about;

  String? get phoneNumber => _phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id.toString();
    map['username'] = _username;
    map['full_name'] = _fullName;
    map['email_address'] = _emailAddress;
    map['cus_country'] = _cusCountry;
    map['cus_state'] = _cusState;
    map['cus_city'] = _cusCity;
    map['cus_add1'] = _cusAdd1;
    map['cus_add2'] = _cusAdd2;
    map['cus_postcode'] = _cusPostcode;
    map['facebook'] = _facebook;
    map['instagram'] = _instagram;
    map['linkedin'] = _linkedin;
    map['twitter'] = _twitter;
    map['about'] = _about;
    map['phone_number'] = _phoneNumber;
    return map;
  }
}
