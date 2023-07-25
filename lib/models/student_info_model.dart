class StudentInfoModel {
  StudentInfoModel({
      Success? success, 
      List<AllTransactions>? allTransactions,}){
    _success = success;
    _allTransactions = allTransactions;
}

  StudentInfoModel.fromJson(dynamic json) {
    _success = json['success'] != null ? Success.fromJson(json['success']) : null;
    if (json['allTransactions'] != null) {
      _allTransactions = [];
      json['allTransactions'].forEach((v) {
        _allTransactions?.add(AllTransactions.fromJson(v));
      });
    }
  }
  Success? _success;
  List<AllTransactions>? _allTransactions;
StudentInfoModel copyWith({  Success? success,
  List<AllTransactions>? allTransactions,
}) => StudentInfoModel(  success: success ?? _success,
  allTransactions: allTransactions ?? _allTransactions,
);
  Success? get success => _success;
  List<AllTransactions>? get allTransactions => _allTransactions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_success != null) {
      map['success'] = _success?.toJson();
    }
    if (_allTransactions != null) {
      map['allTransactions'] = _allTransactions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class AllTransactions {
  AllTransactions({
      num? id, 
      num? studentId, 
      num? batchId, 
      num? courseId, 
      num? amount, 
      dynamic paymentStatus, 
      num? paymentType, 
      String? paymentNote, 
      String? discountType, 
      num? discountAmount, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _studentId = studentId;
    _batchId = batchId;
    _courseId = courseId;
    _amount = amount;
    _paymentStatus = paymentStatus;
    _paymentType = paymentType;
    _paymentNote = paymentNote;
    _discountType = discountType;
    _discountAmount = discountAmount;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  AllTransactions.fromJson(dynamic json) {
    _id = json['id'];
    _studentId = json['student_id'];
    _batchId = json['batch_id'];
    _courseId = json['course_id'];
    _amount = json['amount'];
    _paymentStatus = json['payment_status'];
    _paymentType = json['payment_type'];
    _paymentNote = json['payment_note'];
    _discountType = json['discount_type'];
    _discountAmount = json['discount_amount'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _studentId;
  num? _batchId;
  num? _courseId;
  num? _amount;
  dynamic _paymentStatus;
  num? _paymentType;
  String? _paymentNote;
  String? _discountType;
  num? _discountAmount;
  String? _createdAt;
  String? _updatedAt;
AllTransactions copyWith({  num? id,
  num? studentId,
  num? batchId,
  num? courseId,
  num? amount,
  dynamic paymentStatus,
  num? paymentType,
  String? paymentNote,
  String? discountType,
  num? discountAmount,
  String? createdAt,
  String? updatedAt,
}) => AllTransactions(  id: id ?? _id,
  studentId: studentId ?? _studentId,
  batchId: batchId ?? _batchId,
  courseId: courseId ?? _courseId,
  amount: amount ?? _amount,
  paymentStatus: paymentStatus ?? _paymentStatus,
  paymentType: paymentType ?? _paymentType,
  paymentNote: paymentNote ?? _paymentNote,
  discountType: discountType ?? _discountType,
  discountAmount: discountAmount ?? _discountAmount,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get studentId => _studentId;
  num? get batchId => _batchId;
  num? get courseId => _courseId;
  num? get amount => _amount;
  dynamic get paymentStatus => _paymentStatus;
  num? get paymentType => _paymentType;
  String? get paymentNote => _paymentNote;
  String? get discountType => _discountType;
  num? get discountAmount => _discountAmount;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['student_id'] = _studentId;
    map['batch_id'] = _batchId;
    map['course_id'] = _courseId;
    map['amount'] = _amount;
    map['payment_status'] = _paymentStatus;
    map['payment_type'] = _paymentType;
    map['payment_note'] = _paymentNote;
    map['discount_type'] = _discountType;
    map['discount_amount'] = _discountAmount;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Success {
  Success({
      num? id, 
      String? uniqueStudentId, 
      String? username, 
      String? fullName, 
      String? emailAddress, 
      String? password, 
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
      String? about, 
      String? image, 
      dynamic isCertified, 
      String? phoneNumber, 
      num? status, 
      String? token, 
      String? passwordToken, 
      num? passwordTokenStatus, 
      dynamic lastIpAddress, 
      String? createdAt, 
      String? updatedAt, 
      List<Billing>? billing, 
      List<CourseRegStudents>? courseRegStudents,}){
    _id = id;
    _uniqueStudentId = uniqueStudentId;
    _username = username;
    _fullName = fullName;
    _emailAddress = emailAddress;
    _password = password;
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
    _image = image;
    _isCertified = isCertified;
    _phoneNumber = phoneNumber;
    _status = status;
    _token = token;
    _passwordToken = passwordToken;
    _passwordTokenStatus = passwordTokenStatus;
    _lastIpAddress = lastIpAddress;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _billing = billing;
    _courseRegStudents = courseRegStudents;
}

  Success.fromJson(dynamic json) {
    _id = json['id'];
    _uniqueStudentId = json['unique_student_id'];
    _username = json['username'];
    _fullName = json['full_name'];
    _emailAddress = json['email_address'];
    _password = json['password'];
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
    _image = json['image'];
    _isCertified = json['is_certified'];
    _phoneNumber = json['phone_number'];
    _status = json['status'];
    _token = json['token'];
    _passwordToken = json['password_token'];
    _passwordTokenStatus = json['password_token_status'];
    _lastIpAddress = json['last_ip_address'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['billing'] != null) {
      _billing = [];
      json['billing'].forEach((v) {
        _billing?.add(Billing.fromJson(v));
      });
    }
    if (json['course_reg_students'] != null) {
      _courseRegStudents = [];
      json['course_reg_students'].forEach((v) {
        _courseRegStudents?.add(CourseRegStudents.fromJson(v));
      });
    }
  }
  num? _id;
  String? _uniqueStudentId;
  String? _username;
  String? _fullName;
  String? _emailAddress;
  String? _password;
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
  String? _about;
  String? _image;
  dynamic _isCertified;
  String? _phoneNumber;
  num? _status;
  String? _token;
  String? _passwordToken;
  num? _passwordTokenStatus;
  dynamic _lastIpAddress;
  String? _createdAt;
  String? _updatedAt;
  List<Billing>? _billing;
  List<CourseRegStudents>? _courseRegStudents;
Success copyWith({  num? id,
  String? uniqueStudentId,
  String? username,
  String? fullName,
  String? emailAddress,
  String? password,
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
  String? about,
  String? image,
  dynamic isCertified,
  String? phoneNumber,
  num? status,
  String? token,
  String? passwordToken,
  num? passwordTokenStatus,
  dynamic lastIpAddress,
  String? createdAt,
  String? updatedAt,
  List<Billing>? billing,
  List<CourseRegStudents>? courseRegStudents,
}) => Success(  id: id ?? _id,
  uniqueStudentId: uniqueStudentId ?? _uniqueStudentId,
  username: username ?? _username,
  fullName: fullName ?? _fullName,
  emailAddress: emailAddress ?? _emailAddress,
  password: password ?? _password,
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
  image: image ?? _image,
  isCertified: isCertified ?? _isCertified,
  phoneNumber: phoneNumber ?? _phoneNumber,
  status: status ?? _status,
  token: token ?? _token,
  passwordToken: passwordToken ?? _passwordToken,
  passwordTokenStatus: passwordTokenStatus ?? _passwordTokenStatus,
  lastIpAddress: lastIpAddress ?? _lastIpAddress,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  billing: billing ?? _billing,
  courseRegStudents: courseRegStudents ?? _courseRegStudents,
);
  num? get id => _id;
  String? get uniqueStudentId => _uniqueStudentId;
  String? get username => _username;
  String? get fullName => _fullName;
  String? get emailAddress => _emailAddress;
  String? get password => _password;
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
  String? get about => _about;
  String? get image => _image;
  dynamic get isCertified => _isCertified;
  String? get phoneNumber => _phoneNumber;
  num? get status => _status;
  String? get token => _token;
  String? get passwordToken => _passwordToken;
  num? get passwordTokenStatus => _passwordTokenStatus;
  dynamic get lastIpAddress => _lastIpAddress;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Billing>? get billing => _billing;
  List<CourseRegStudents>? get courseRegStudents => _courseRegStudents;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['unique_student_id'] = _uniqueStudentId;
    map['username'] = _username;
    map['full_name'] = _fullName;
    map['email_address'] = _emailAddress;
    map['password'] = _password;
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
    map['image'] = _image;
    map['is_certified'] = _isCertified;
    map['phone_number'] = _phoneNumber;
    map['status'] = _status;
    map['token'] = _token;
    map['password_token'] = _passwordToken;
    map['password_token_status'] = _passwordTokenStatus;
    map['last_ip_address'] = _lastIpAddress;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_billing != null) {
      map['billing'] = _billing?.map((v) => v.toJson()).toList();
    }
    if (_courseRegStudents != null) {
      map['course_reg_students'] = _courseRegStudents?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CourseRegStudents {
  CourseRegStudents({
      num? id, 
      String? fullName, 
      String? emailAddress, 
      String? phoneNumber, 
      num? studentId, 
      num? batchId, 
      num? trainingId, 
      String? pay, 
      num? status, 
      dynamic industrialStudent, 
      String? createdAt, 
      String? updatedAt, 
      Batch? batch,}){
    _id = id;
    _fullName = fullName;
    _emailAddress = emailAddress;
    _phoneNumber = phoneNumber;
    _studentId = studentId;
    _batchId = batchId;
    _trainingId = trainingId;
    _pay = pay;
    _status = status;
    _industrialStudent = industrialStudent;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _batch = batch;
}

  CourseRegStudents.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _emailAddress = json['email_address'];
    _phoneNumber = json['phone_number'];
    _studentId = json['student_id'];
    _batchId = json['batch_id'];
    _trainingId = json['training_id'];
    _pay = json['pay'];
    _status = json['status'];
    _industrialStudent = json['industrial_student'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _batch = json['batch'] != null ? Batch.fromJson(json['batch']) : null;
  }
  num? _id;
  String? _fullName;
  String? _emailAddress;
  String? _phoneNumber;
  num? _studentId;
  num? _batchId;
  num? _trainingId;
  String? _pay;
  num? _status;
  dynamic _industrialStudent;
  String? _createdAt;
  String? _updatedAt;
  Batch? _batch;
CourseRegStudents copyWith({  num? id,
  String? fullName,
  String? emailAddress,
  String? phoneNumber,
  num? studentId,
  num? batchId,
  num? trainingId,
  String? pay,
  num? status,
  dynamic industrialStudent,
  String? createdAt,
  String? updatedAt,
  Batch? batch,
}) => CourseRegStudents(  id: id ?? _id,
  fullName: fullName ?? _fullName,
  emailAddress: emailAddress ?? _emailAddress,
  phoneNumber: phoneNumber ?? _phoneNumber,
  studentId: studentId ?? _studentId,
  batchId: batchId ?? _batchId,
  trainingId: trainingId ?? _trainingId,
  pay: pay ?? _pay,
  status: status ?? _status,
  industrialStudent: industrialStudent ?? _industrialStudent,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  batch: batch ?? _batch,
);
  num? get id => _id;
  String? get fullName => _fullName;
  String? get emailAddress => _emailAddress;
  String? get phoneNumber => _phoneNumber;
  num? get studentId => _studentId;
  num? get batchId => _batchId;
  num? get trainingId => _trainingId;
  String? get pay => _pay;
  num? get status => _status;
  dynamic get industrialStudent => _industrialStudent;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Batch? get batch => _batch;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['email_address'] = _emailAddress;
    map['phone_number'] = _phoneNumber;
    map['student_id'] = _studentId;
    map['batch_id'] = _batchId;
    map['training_id'] = _trainingId;
    map['pay'] = _pay;
    map['status'] = _status;
    map['industrial_student'] = _industrialStudent;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_batch != null) {
      map['batch'] = _batch?.toJson();
    }
    return map;
  }

}

class Batch {
  Batch({
      num? id, 
      String? batchType, 
      num? trainingId, 
      num? currentBatchId, 
      String? batchName, 
      num? trainingPrice, 
      String? batchDesc, 
      num? collaborative, 
      dynamic collaBatchId, 
      dynamic collaBatchName, 
      dynamic partnerName, 
      num? classNo, 
      num? hours, 
      num? seat, 
      String? startDate, 
      String? endDate, 
      String? lastDate, 
      dynamic earlyBirdDate, 
      num? discountPrice, 
      String? promotionalDesc, 
      String? venue, 
      String? mainImage, 
      dynamic imageAlterText, 
      num? featured, 
      num? publicationStatus, 
      num? status, 
      String? createdAt, 
      String? updatedAt, 
      Training? training,}){
    _id = id;
    _batchType = batchType;
    _trainingId = trainingId;
    _currentBatchId = currentBatchId;
    _batchName = batchName;
    _trainingPrice = trainingPrice;
    _batchDesc = batchDesc;
    _collaborative = collaborative;
    _collaBatchId = collaBatchId;
    _collaBatchName = collaBatchName;
    _partnerName = partnerName;
    _classNo = classNo;
    _hours = hours;
    _seat = seat;
    _startDate = startDate;
    _endDate = endDate;
    _lastDate = lastDate;
    _earlyBirdDate = earlyBirdDate;
    _discountPrice = discountPrice;
    _promotionalDesc = promotionalDesc;
    _venue = venue;
    _mainImage = mainImage;
    _imageAlterText = imageAlterText;
    _featured = featured;
    _publicationStatus = publicationStatus;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _training = training;
}

  Batch.fromJson(dynamic json) {
    _id = json['id'];
    _batchType = json['batch_type'];
    _trainingId = json['training_id'];
    _currentBatchId = json['current_batch_id'];
    _batchName = json['batch_name'];
    _trainingPrice = json['training_price'];
    _batchDesc = json['batch_desc'];
    _collaborative = json['collaborative'];
    _collaBatchId = json['colla_batch_id'];
    _collaBatchName = json['colla_batch_name'];
    _partnerName = json['partner_name'];
    _classNo = json['class_no'];
    _hours = json['hours'];
    _seat = json['seat'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _lastDate = json['last_date'];
    _earlyBirdDate = json['early_bird_date'];
    _discountPrice = json['discount_price'];
    _promotionalDesc = json['promotional_desc'];
    _venue = json['venue'];
    _mainImage = json['main_image'];
    _imageAlterText = json['image_alter_text'];
    _featured = json['featured'];
    _publicationStatus = json['publication_status'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _training = json['training'] != null ? Training.fromJson(json['training']) : null;
  }
  num? _id;
  String? _batchType;
  num? _trainingId;
  num? _currentBatchId;
  String? _batchName;
  num? _trainingPrice;
  String? _batchDesc;
  num? _collaborative;
  dynamic _collaBatchId;
  dynamic _collaBatchName;
  dynamic _partnerName;
  num? _classNo;
  num? _hours;
  num? _seat;
  String? _startDate;
  String? _endDate;
  String? _lastDate;
  dynamic _earlyBirdDate;
  num? _discountPrice;
  String? _promotionalDesc;
  String? _venue;
  String? _mainImage;
  dynamic _imageAlterText;
  num? _featured;
  num? _publicationStatus;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  Training? _training;
Batch copyWith({  num? id,
  String? batchType,
  num? trainingId,
  num? currentBatchId,
  String? batchName,
  num? trainingPrice,
  String? batchDesc,
  num? collaborative,
  dynamic collaBatchId,
  dynamic collaBatchName,
  dynamic partnerName,
  num? classNo,
  num? hours,
  num? seat,
  String? startDate,
  String? endDate,
  String? lastDate,
  dynamic earlyBirdDate,
  num? discountPrice,
  String? promotionalDesc,
  String? venue,
  String? mainImage,
  dynamic imageAlterText,
  num? featured,
  num? publicationStatus,
  num? status,
  String? createdAt,
  String? updatedAt,
  Training? training,
}) => Batch(  id: id ?? _id,
  batchType: batchType ?? _batchType,
  trainingId: trainingId ?? _trainingId,
  currentBatchId: currentBatchId ?? _currentBatchId,
  batchName: batchName ?? _batchName,
  trainingPrice: trainingPrice ?? _trainingPrice,
  batchDesc: batchDesc ?? _batchDesc,
  collaborative: collaborative ?? _collaborative,
  collaBatchId: collaBatchId ?? _collaBatchId,
  collaBatchName: collaBatchName ?? _collaBatchName,
  partnerName: partnerName ?? _partnerName,
  classNo: classNo ?? _classNo,
  hours: hours ?? _hours,
  seat: seat ?? _seat,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  lastDate: lastDate ?? _lastDate,
  earlyBirdDate: earlyBirdDate ?? _earlyBirdDate,
  discountPrice: discountPrice ?? _discountPrice,
  promotionalDesc: promotionalDesc ?? _promotionalDesc,
  venue: venue ?? _venue,
  mainImage: mainImage ?? _mainImage,
  imageAlterText: imageAlterText ?? _imageAlterText,
  featured: featured ?? _featured,
  publicationStatus: publicationStatus ?? _publicationStatus,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  training: training ?? _training,
);
  num? get id => _id;
  String? get batchType => _batchType;
  num? get trainingId => _trainingId;
  num? get currentBatchId => _currentBatchId;
  String? get batchName => _batchName;
  num? get trainingPrice => _trainingPrice;
  String? get batchDesc => _batchDesc;
  num? get collaborative => _collaborative;
  dynamic get collaBatchId => _collaBatchId;
  dynamic get collaBatchName => _collaBatchName;
  dynamic get partnerName => _partnerName;
  num? get classNo => _classNo;
  num? get hours => _hours;
  num? get seat => _seat;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get lastDate => _lastDate;
  dynamic get earlyBirdDate => _earlyBirdDate;
  num? get discountPrice => _discountPrice;
  String? get promotionalDesc => _promotionalDesc;
  String? get venue => _venue;
  String? get mainImage => _mainImage;
  dynamic get imageAlterText => _imageAlterText;
  num? get featured => _featured;
  num? get publicationStatus => _publicationStatus;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Training? get training => _training;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['batch_type'] = _batchType;
    map['training_id'] = _trainingId;
    map['current_batch_id'] = _currentBatchId;
    map['batch_name'] = _batchName;
    map['training_price'] = _trainingPrice;
    map['batch_desc'] = _batchDesc;
    map['collaborative'] = _collaborative;
    map['colla_batch_id'] = _collaBatchId;
    map['colla_batch_name'] = _collaBatchName;
    map['partner_name'] = _partnerName;
    map['class_no'] = _classNo;
    map['hours'] = _hours;
    map['seat'] = _seat;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['last_date'] = _lastDate;
    map['early_bird_date'] = _earlyBirdDate;
    map['discount_price'] = _discountPrice;
    map['promotional_desc'] = _promotionalDesc;
    map['venue'] = _venue;
    map['main_image'] = _mainImage;
    map['image_alter_text'] = _imageAlterText;
    map['featured'] = _featured;
    map['publication_status'] = _publicationStatus;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_training != null) {
      map['training'] = _training?.toJson();
    }
    return map;
  }

}

class Training {
  Training({
      num? id, 
      num? catId, 
      dynamic trainingTitle, 
      dynamic trainingSubTitle, 
      String? trainingMetaDesc, 
      String? metaKeywords, 
      String? h2ForSeo, 
      String? trainingName, 
      String? trainingSlug, 
      String? trainingShortDesc, 
      String? preRequisite, 
      String? certificateCode, 
      String? trainingImage, 
      num? publicationStatus, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _catId = catId;
    _trainingTitle = trainingTitle;
    _trainingSubTitle = trainingSubTitle;
    _trainingMetaDesc = trainingMetaDesc;
    _metaKeywords = metaKeywords;
    _h2ForSeo = h2ForSeo;
    _trainingName = trainingName;
    _trainingSlug = trainingSlug;
    _trainingShortDesc = trainingShortDesc;
    _preRequisite = preRequisite;
    _certificateCode = certificateCode;
    _trainingImage = trainingImage;
    _publicationStatus = publicationStatus;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Training.fromJson(dynamic json) {
    _id = json['id'];
    _catId = json['cat_id'];
    _trainingTitle = json['training_title'];
    _trainingSubTitle = json['training_sub_title'];
    _trainingMetaDesc = json['training_meta_desc'];
    _metaKeywords = json['meta_keywords'];
    _h2ForSeo = json['h2_for_seo'];
    _trainingName = json['training_name'];
    _trainingSlug = json['training_slug'];
    _trainingShortDesc = json['training_short_desc'];
    _preRequisite = json['pre_requisite'];
    _certificateCode = json['certificate_code'];
    _trainingImage = json['training_image'];
    _publicationStatus = json['publication_status'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _catId;
  dynamic _trainingTitle;
  dynamic _trainingSubTitle;
  String? _trainingMetaDesc;
  String? _metaKeywords;
  String? _h2ForSeo;
  String? _trainingName;
  String? _trainingSlug;
  String? _trainingShortDesc;
  String? _preRequisite;
  String? _certificateCode;
  String? _trainingImage;
  num? _publicationStatus;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
Training copyWith({  num? id,
  num? catId,
  dynamic trainingTitle,
  dynamic trainingSubTitle,
  String? trainingMetaDesc,
  String? metaKeywords,
  String? h2ForSeo,
  String? trainingName,
  String? trainingSlug,
  String? trainingShortDesc,
  String? preRequisite,
  String? certificateCode,
  String? trainingImage,
  num? publicationStatus,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => Training(  id: id ?? _id,
  catId: catId ?? _catId,
  trainingTitle: trainingTitle ?? _trainingTitle,
  trainingSubTitle: trainingSubTitle ?? _trainingSubTitle,
  trainingMetaDesc: trainingMetaDesc ?? _trainingMetaDesc,
  metaKeywords: metaKeywords ?? _metaKeywords,
  h2ForSeo: h2ForSeo ?? _h2ForSeo,
  trainingName: trainingName ?? _trainingName,
  trainingSlug: trainingSlug ?? _trainingSlug,
  trainingShortDesc: trainingShortDesc ?? _trainingShortDesc,
  preRequisite: preRequisite ?? _preRequisite,
  certificateCode: certificateCode ?? _certificateCode,
  trainingImage: trainingImage ?? _trainingImage,
  publicationStatus: publicationStatus ?? _publicationStatus,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get catId => _catId;
  dynamic get trainingTitle => _trainingTitle;
  dynamic get trainingSubTitle => _trainingSubTitle;
  String? get trainingMetaDesc => _trainingMetaDesc;
  String? get metaKeywords => _metaKeywords;
  String? get h2ForSeo => _h2ForSeo;
  String? get trainingName => _trainingName;
  String? get trainingSlug => _trainingSlug;
  String? get trainingShortDesc => _trainingShortDesc;
  String? get preRequisite => _preRequisite;
  String? get certificateCode => _certificateCode;
  String? get trainingImage => _trainingImage;
  num? get publicationStatus => _publicationStatus;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cat_id'] = _catId;
    map['training_title'] = _trainingTitle;
    map['training_sub_title'] = _trainingSubTitle;
    map['training_meta_desc'] = _trainingMetaDesc;
    map['meta_keywords'] = _metaKeywords;
    map['h2_for_seo'] = _h2ForSeo;
    map['training_name'] = _trainingName;
    map['training_slug'] = _trainingSlug;
    map['training_short_desc'] = _trainingShortDesc;
    map['pre_requisite'] = _preRequisite;
    map['certificate_code'] = _certificateCode;
    map['training_image'] = _trainingImage;
    map['publication_status'] = _publicationStatus;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Billing {
  Billing({
      num? id, 
      num? studentId, 
      num? batchId, 
      num? courseId, 
      String? amount, 
      num? paymentType, 
      String? paymentNote, 
      String? discountType, 
      num? discountAmount, 
      String? createdAt, 
      String? updatedAt, 
      CourseRegStudents? courseRegStudents, 
      List<Payment>? payment,}){
    _id = id;
    _studentId = studentId;
    _batchId = batchId;
    _courseId = courseId;
    _amount = amount;
    _paymentType = paymentType;
    _paymentNote = paymentNote;
    _discountType = discountType;
    _discountAmount = discountAmount;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _courseRegStudents = courseRegStudents;
    _payment = payment;
}

  Billing.fromJson(dynamic json) {
    _id = json['id'];
    _studentId = json['student_id'];
    _batchId = json['batch_id'];
    _courseId = json['course_id'];
    _amount = json['amount'];
    _paymentType = json['payment_type'];
    _paymentNote = json['payment_note'];
    _discountType = json['discount_type'];
    _discountAmount = json['discount_amount'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _courseRegStudents = json['course_reg_students'] != null ? CourseRegStudents.fromJson(json['course_reg_students']) : null;
    if (json['payment'] != null) {
      _payment = [];
      json['payment'].forEach((v) {
        _payment?.add(Payment.fromJson(v));
      });
    }
  }
  num? _id;
  num? _studentId;
  num? _batchId;
  num? _courseId;
  String? _amount;
  num? _paymentType;
  String? _paymentNote;
  String? _discountType;
  num? _discountAmount;
  String? _createdAt;
  String? _updatedAt;
  CourseRegStudents? _courseRegStudents;
  List<Payment>? _payment;
Billing copyWith({  num? id,
  num? studentId,
  num? batchId,
  num? courseId,
  String? amount,
  num? paymentType,
  String? paymentNote,
  String? discountType,
  num? discountAmount,
  String? createdAt,
  String? updatedAt,
  CourseRegStudents? courseRegStudents,
  List<Payment>? payment,
}) => Billing(  id: id ?? _id,
  studentId: studentId ?? _studentId,
  batchId: batchId ?? _batchId,
  courseId: courseId ?? _courseId,
  amount: amount ?? _amount,
  paymentType: paymentType ?? _paymentType,
  paymentNote: paymentNote ?? _paymentNote,
  discountType: discountType ?? _discountType,
  discountAmount: discountAmount ?? _discountAmount,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  courseRegStudents: courseRegStudents ?? _courseRegStudents,
  payment: payment ?? _payment,
);
  num? get id => _id;
  num? get studentId => _studentId;
  num? get batchId => _batchId;
  num? get courseId => _courseId;
  String? get amount => _amount;
  num? get paymentType => _paymentType;
  String? get paymentNote => _paymentNote;
  String? get discountType => _discountType;
  num? get discountAmount => _discountAmount;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  CourseRegStudents? get courseRegStudents => _courseRegStudents;
  List<Payment>? get payment => _payment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['student_id'] = _studentId;
    map['batch_id'] = _batchId;
    map['course_id'] = _courseId;
    map['amount'] = _amount;
    map['payment_type'] = _paymentType;
    map['payment_note'] = _paymentNote;
    map['discount_type'] = _discountType;
    map['discount_amount'] = _discountAmount;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_courseRegStudents != null) {
      map['course_reg_students'] = _courseRegStudents?.toJson();
    }
    if (_payment != null) {
      map['payment'] = _payment?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Payment {
  Payment({
      num? id, 
      num? billingId, 
      String? payStatus, 
      String? amount, 
      String? pgTxnid, 
      String? merTxnid, 
      String? bankTxn, 
      String? cardType, 
      String? optA, 
      String? ipAddress, 
      String? cardNumber, 
      String? cardHolder, 
      String? payTime, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _billingId = billingId;
    _payStatus = payStatus;
    _amount = amount;
    _pgTxnid = pgTxnid;
    _merTxnid = merTxnid;
    _bankTxn = bankTxn;
    _cardType = cardType;
    _optA = optA;
    _ipAddress = ipAddress;
    _cardNumber = cardNumber;
    _cardHolder = cardHolder;
    _payTime = payTime;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Payment.fromJson(dynamic json) {
    _id = json['id'];
    _billingId = json['billing_id'];
    _payStatus = json['pay_status'];
    _amount = json['amount'];
    _pgTxnid = json['pg_txnid'];
    _merTxnid = json['mer_txnid'];
    _bankTxn = json['bank_txn'];
    _cardType = json['card_type'];
    _optA = json['opt_a'];
    _ipAddress = json['ip_address'];
    _cardNumber = json['card_number'];
    _cardHolder = json['card_holder'];
    _payTime = json['pay_time'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _billingId;
  String? _payStatus;
  String? _amount;
  String? _pgTxnid;
  String? _merTxnid;
  String? _bankTxn;
  String? _cardType;
  String? _optA;
  String? _ipAddress;
  String? _cardNumber;
  String? _cardHolder;
  String? _payTime;
  String? _createdAt;
  String? _updatedAt;
Payment copyWith({  num? id,
  num? billingId,
  String? payStatus,
  String? amount,
  String? pgTxnid,
  String? merTxnid,
  String? bankTxn,
  String? cardType,
  String? optA,
  String? ipAddress,
  String? cardNumber,
  String? cardHolder,
  String? payTime,
  String? createdAt,
  String? updatedAt,
}) => Payment(  id: id ?? _id,
  billingId: billingId ?? _billingId,
  payStatus: payStatus ?? _payStatus,
  amount: amount ?? _amount,
  pgTxnid: pgTxnid ?? _pgTxnid,
  merTxnid: merTxnid ?? _merTxnid,
  bankTxn: bankTxn ?? _bankTxn,
  cardType: cardType ?? _cardType,
  optA: optA ?? _optA,
  ipAddress: ipAddress ?? _ipAddress,
  cardNumber: cardNumber ?? _cardNumber,
  cardHolder: cardHolder ?? _cardHolder,
  payTime: payTime ?? _payTime,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get billingId => _billingId;
  String? get payStatus => _payStatus;
  String? get amount => _amount;
  String? get pgTxnid => _pgTxnid;
  String? get merTxnid => _merTxnid;
  String? get bankTxn => _bankTxn;
  String? get cardType => _cardType;
  String? get optA => _optA;
  String? get ipAddress => _ipAddress;
  String? get cardNumber => _cardNumber;
  String? get cardHolder => _cardHolder;
  String? get payTime => _payTime;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['billing_id'] = _billingId;
    map['pay_status'] = _payStatus;
    map['amount'] = _amount;
    map['pg_txnid'] = _pgTxnid;
    map['mer_txnid'] = _merTxnid;
    map['bank_txn'] = _bankTxn;
    map['card_type'] = _cardType;
    map['opt_a'] = _optA;
    map['ip_address'] = _ipAddress;
    map['card_number'] = _cardNumber;
    map['card_holder'] = _cardHolder;
    map['pay_time'] = _payTime;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}




