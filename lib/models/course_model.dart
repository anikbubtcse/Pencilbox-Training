class CourseModel {
  CourseModel({
    int? id,
    int? catId,
    String? trainingName,
    String? trainingSlug,
    String? trainingShortDesc,
    String? preRequisite,
    String? certificateCode,
    String? trainingImage,
    int? publicationStatus,
    String? createdAt,
    String? updatedAt,
    String? batchType,
    int? trainingId,
    int? currentBatchId,
    String? batchName,
    int? trainingPrice,
    String? batchDesc,
    int? collaborative,
    dynamic collaBatchId,
    dynamic collaBatchName,
    dynamic partnerName,
    int? classNo,
    int? hours,
    int? seat,
    String? startDate,
    String? endDate,
    String? lastDate,
    dynamic earlyBirdDate,
    dynamic discountPrice,
    dynamic promotionalDesc,
    String? venue,
    String? mainImage,
    int? featured,
    int? batchId,
    dynamic workshopId,
    dynamic eventId,
    int? trainerId,
    String? catName,
    String? catDesc,
    dynamic catImage,
    String? catIcon,
    int? status,
    bool categoryChecked = false,
  }) {
    _id = id;
    _catId = catId;
    _trainingName = trainingName;
    _trainingSlug = trainingSlug;
    _trainingShortDesc = trainingShortDesc;
    _preRequisite = preRequisite;
    _certificateCode = certificateCode;
    _trainingImage = trainingImage;
    _publicationStatus = publicationStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
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
    _featured = featured;
    _batchId = batchId;
    _workshopId = workshopId;
    _eventId = eventId;
    _trainerId = trainerId;
    _catName = catName;
    _catDesc = catDesc;
    _catImage = catImage;
    _catIcon = catIcon;
    _status = status;
  }

  CourseModel.fromJson(dynamic json) {
    _id = json['id'];
    _catId = json['cat_id'];
    _trainingName = json['training_name'];
    _trainingSlug = json['training_slug'];
    _trainingShortDesc = json['training_short_desc'];
    _preRequisite = json['pre_requisite'];
    _certificateCode = json['certificate_code'];
    _trainingImage = json['training_image'];
    _publicationStatus = json['publication_status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
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
    _featured = json['featured'];
    _batchId = json['batch_id'];
    _workshopId = json['workshop_id'];
    _eventId = json['event_id'];
    _trainerId = json['trainer_id'];
    _catName = json['cat_name'];
    _catDesc = json['cat_desc'];
    _catImage = json['cat_image'];
    _catIcon = json['cat_icon'];
    _status = json['status'];
  }

  int? _id;
  int? _catId;
  String? _trainingName;
  String? _trainingSlug;
  String? _trainingShortDesc;
  String? _preRequisite;
  String? _certificateCode;
  String? _trainingImage;
  int? _publicationStatus;
  String? _createdAt;
  String? _updatedAt;
  String? _batchType;
  int? _trainingId;
  int? _currentBatchId;
  String? _batchName;
  int? _trainingPrice;
  String? _batchDesc;
  int? _collaborative;
  dynamic _collaBatchId;
  dynamic _collaBatchName;
  dynamic _partnerName;
  int? _classNo;
  int? _hours;
  int? _seat;
  String? _startDate;
  String? _endDate;
  String? _lastDate;
  dynamic _earlyBirdDate;
  dynamic _discountPrice;
  dynamic _promotionalDesc;
  String? _venue;
  String? _mainImage;
  int? _featured;
  int? _batchId;
  dynamic _workshopId;
  dynamic _eventId;
  int? _trainerId;
  String? _catName;
  String? _catDesc;
  dynamic _catImage;
  String? _catIcon;
  int? _status;
  bool categoryChecked = false;

  CourseModel copyWith({
    int? id,
    int? catId,
    String? trainingName,
    String? trainingSlug,
    String? trainingShortDesc,
    String? preRequisite,
    String? certificateCode,
    String? trainingImage,
    int? publicationStatus,
    String? createdAt,
    String? updatedAt,
    String? batchType,
    int? trainingId,
    int? currentBatchId,
    String? batchName,
    int? trainingPrice,
    String? batchDesc,
    int? collaborative,
    dynamic collaBatchId,
    dynamic collaBatchName,
    dynamic partnerName,
    int? classNo,
    int? hours,
    int? seat,
    String? startDate,
    String? endDate,
    String? lastDate,
    dynamic earlyBirdDate,
    dynamic discountPrice,
    dynamic promotionalDesc,
    String? venue,
    String? mainImage,
    int? featured,
    int? batchId,
    dynamic workshopId,
    dynamic eventId,
    int? trainerId,
    String? catName,
    String? catDesc,
    dynamic catImage,
    String? catIcon,
    int? status,
  }) =>
      CourseModel(
        id: id ?? _id,
        catId: catId ?? _catId,
        trainingName: trainingName ?? _trainingName,
        trainingSlug: trainingSlug ?? _trainingSlug,
        trainingShortDesc: trainingShortDesc ?? _trainingShortDesc,
        preRequisite: preRequisite ?? _preRequisite,
        certificateCode: certificateCode ?? _certificateCode,
        trainingImage: trainingImage ?? _trainingImage,
        publicationStatus: publicationStatus ?? _publicationStatus,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
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
        featured: featured ?? _featured,
        batchId: batchId ?? _batchId,
        workshopId: workshopId ?? _workshopId,
        eventId: eventId ?? _eventId,
        trainerId: trainerId ?? _trainerId,
        catName: catName ?? _catName,
        catDesc: catDesc ?? _catDesc,
        catImage: catImage ?? _catImage,
        catIcon: catIcon ?? _catIcon,
        status: status ?? _status,
      );

  int? get id => _id;

  int? get catId => _catId;

  String? get trainingName => _trainingName;

  String? get trainingSlug => _trainingSlug;

  String? get trainingShortDesc => _trainingShortDesc;

  String? get preRequisite => _preRequisite;

  String? get certificateCode => _certificateCode;

  String? get trainingImage => _trainingImage;

  int? get publicationStatus => _publicationStatus;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get batchType => _batchType;

  int? get trainingId => _trainingId;

  int? get currentBatchId => _currentBatchId;

  String? get batchName => _batchName;

  int? get trainingPrice => _trainingPrice;

  String? get batchDesc => _batchDesc;

  int? get collaborative => _collaborative;

  dynamic get collaBatchId => _collaBatchId;

  dynamic get collaBatchName => _collaBatchName;

  dynamic get partnerName => _partnerName;

  int? get classNo => _classNo;

  int? get hours => _hours;

  int? get seat => _seat;

  String? get startDate => _startDate;

  String? get endDate => _endDate;

  String? get lastDate => _lastDate;

  dynamic get earlyBirdDate => _earlyBirdDate;

  dynamic get discountPrice => _discountPrice;

  dynamic get promotionalDesc => _promotionalDesc;

  String? get venue => _venue;

  String? get mainImage => _mainImage;

  int? get featured => _featured;

  int? get batchId => _batchId;

  dynamic get workshopId => _workshopId;

  dynamic get eventId => _eventId;

  int? get trainerId => _trainerId;

  String? get catName => _catName;

  String? get catDesc => _catDesc;

  dynamic get catImage => _catImage;

  String? get catIcon => _catIcon;

  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cat_id'] = _catId;
    map['training_name'] = _trainingName;
    map['training_slug'] = _trainingSlug;
    map['training_short_desc'] = _trainingShortDesc;
    map['pre_requisite'] = _preRequisite;
    map['certificate_code'] = _certificateCode;
    map['training_image'] = _trainingImage;
    map['publication_status'] = _publicationStatus;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
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
    map['featured'] = _featured;
    map['batch_id'] = _batchId;
    map['workshop_id'] = _workshopId;
    map['event_id'] = _eventId;
    map['trainer_id'] = _trainerId;
    map['cat_name'] = _catName;
    map['cat_desc'] = _catDesc;
    map['cat_image'] = _catImage;
    map['cat_icon'] = _catIcon;
    map['status'] = _status;
    return map;
  }

  @override
  String toString() {
    return 'CourseModel{_id: $_id, _catId: $_catId, _trainingName: $_trainingName, _trainingSlug: $_trainingSlug, _trainingShortDesc: $_trainingShortDesc, _preRequisite: $_preRequisite, _certificateCode: $_certificateCode, _trainingImage: $_trainingImage, _publicationStatus: $_publicationStatus, _createdAt: $_createdAt, _updatedAt: $_updatedAt, _batchType: $_batchType, _trainingId: $_trainingId, _currentBatchId: $_currentBatchId, _batchName: $_batchName, _trainingPrice: $_trainingPrice, _batchDesc: $_batchDesc, _collaborative: $_collaborative, _collaBatchId: $_collaBatchId, _collaBatchName: $_collaBatchName, _partnerName: $_partnerName, _classNo: $_classNo, _hours: $_hours, _seat: $_seat, _startDate: $_startDate, _endDate: $_endDate, _lastDate: $_lastDate, _earlyBirdDate: $_earlyBirdDate, _discountPrice: $_discountPrice, _promotionalDesc: $_promotionalDesc, _venue: $_venue, _mainImage: $_mainImage, _featured: $_featured, _batchId: $_batchId, _workshopId: $_workshopId, _eventId: $_eventId, _trainerId: $_trainerId, _catName: $_catName, _catDesc: $_catDesc, _catImage: $_catImage, _catIcon: $_catIcon, _status: $_status}';
  }
}
