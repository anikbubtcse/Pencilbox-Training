class EventModel {
  EventModel({
    List<Events>? events,
    List<EventCategory>? eventCategory,
  }) {
    _events = events;
    _eventCategory = eventCategory;
  }

  EventModel.fromJson(dynamic json) {
    if (json['events'] != null) {
      _events = [];
      json['events'].forEach((v) {
        _events?.add(Events.fromJson(v));
      });
    }
    if (json['eventCategory'] != null) {
      _eventCategory = [];
      json['eventCategory'].forEach((v) {
        _eventCategory?.add(EventCategory.fromJson(v));
      });
    }
  }

  List<Events>? _events;
  List<EventCategory>? _eventCategory;

  EventModel copyWith({
    List<Events>? events,
    List<EventCategory>? eventCategory,
  }) =>
      EventModel(
        events: events ?? _events,
        eventCategory: eventCategory ?? _eventCategory,
      );

  List<Events>? get events => _events;

  List<EventCategory>? get eventCategory => _eventCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_events != null) {
      map['events'] = _events?.map((v) => v.toJson()).toList();
    }
    if (_eventCategory != null) {
      map['eventCategory'] = _eventCategory?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class EventCategory {
  EventCategory({
    num? id,
    String? catName,
    String? catDesc,
    dynamic catImage,
    String? catIcon,
    num? status,
    String? createdAt,
    String? updatedAt,
    List<Event>? event,
  }) {
    _id = id;
    _catName = catName;
    _catDesc = catDesc;
    _catImage = catImage;
    _catIcon = catIcon;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _event = event;
  }

  EventCategory.fromJson(dynamic json) {
    _id = json['id'];
    _catName = json['cat_name'];
    _catDesc = json['cat_desc'];
    _catImage = json['cat_image'];
    _catIcon = json['cat_icon'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['event'] != null) {
      _event = [];
      json['event'].forEach((v) {
        _event?.add(Event.fromJson(v));
      });
    }
  }

  num? _id;
  String? _catName;
  String? _catDesc;
  dynamic _catImage;
  String? _catIcon;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  List<Event>? _event;

  EventCategory copyWith({
    num? id,
    String? catName,
    String? catDesc,
    dynamic catImage,
    String? catIcon,
    num? status,
    String? createdAt,
    String? updatedAt,
    List<Event>? event,
  }) =>
      EventCategory(
        id: id ?? _id,
        catName: catName ?? _catName,
        catDesc: catDesc ?? _catDesc,
        catImage: catImage ?? _catImage,
        catIcon: catIcon ?? _catIcon,
        status: status ?? _status,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        event: event ?? _event,
      );

  num? get id => _id;

  String? get catName => _catName;

  String? get catDesc => _catDesc;

  dynamic get catImage => _catImage;

  String? get catIcon => _catIcon;

  num? get status => _status;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  List<Event>? get event => _event;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cat_name'] = _catName;
    map['cat_desc'] = _catDesc;
    map['cat_image'] = _catImage;
    map['cat_icon'] = _catIcon;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_event != null) {
      map['event'] = _event?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Event {
  Event({
    num? id,
    num? catId,
    String? eventName,
    String? eventShortDesc,
    String? eventLongDesc,
    num? collaborative,
    dynamic partnerName,
    String? eventDate,
    String? endDate,
    String? startTime,
    String? endTime,
    String? price,
    num? hours,
    num? seat,
    String? venue,
    String? eventImage,
    num? publicationStatus,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _catId = catId;
    _eventName = eventName;
    _eventShortDesc = eventShortDesc;
    _eventLongDesc = eventLongDesc;
    _collaborative = collaborative;
    _partnerName = partnerName;
    _eventDate = eventDate;
    _endDate = endDate;
    _startTime = startTime;
    _endTime = endTime;
    _price = price;
    _hours = hours;
    _seat = seat;
    _venue = venue;
    _eventImage = eventImage;
    _publicationStatus = publicationStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Event.fromJson(dynamic json) {
    _id = json['id'];
    _catId = json['cat_id'];
    _eventName = json['event_name'];
    _eventShortDesc = json['event_short_desc'];
    _eventLongDesc = json['event_long_desc'];
    _collaborative = json['collaborative'];
    _partnerName = json['partner_name'];
    _eventDate = json['event_date'];
    _endDate = json['end_date'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _price = json['price'];
    _hours = json['hours'];
    _seat = json['seat'];
    _venue = json['venue'];
    _eventImage = json['event_image'];
    _publicationStatus = json['publication_status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  num? _catId;
  String? _eventName;
  String? _eventShortDesc;
  String? _eventLongDesc;
  num? _collaborative;
  dynamic _partnerName;
  String? _eventDate;
  String? _endDate;
  String? _startTime;
  String? _endTime;
  String? _price;
  num? _hours;
  num? _seat;
  String? _venue;
  String? _eventImage;
  num? _publicationStatus;
  String? _createdAt;
  String? _updatedAt;

  Event copyWith({
    num? id,
    num? catId,
    String? eventName,
    String? eventShortDesc,
    String? eventLongDesc,
    num? collaborative,
    dynamic partnerName,
    String? eventDate,
    String? endDate,
    String? startTime,
    String? endTime,
    String? price,
    num? hours,
    num? seat,
    String? venue,
    String? eventImage,
    num? publicationStatus,
    String? createdAt,
    String? updatedAt,
  }) =>
      Event(
        id: id ?? _id,
        catId: catId ?? _catId,
        eventName: eventName ?? _eventName,
        eventShortDesc: eventShortDesc ?? _eventShortDesc,
        eventLongDesc: eventLongDesc ?? _eventLongDesc,
        collaborative: collaborative ?? _collaborative,
        partnerName: partnerName ?? _partnerName,
        eventDate: eventDate ?? _eventDate,
        endDate: endDate ?? _endDate,
        startTime: startTime ?? _startTime,
        endTime: endTime ?? _endTime,
        price: price ?? _price,
        hours: hours ?? _hours,
        seat: seat ?? _seat,
        venue: venue ?? _venue,
        eventImage: eventImage ?? _eventImage,
        publicationStatus: publicationStatus ?? _publicationStatus,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  num? get catId => _catId;

  String? get eventName => _eventName;

  String? get eventShortDesc => _eventShortDesc;

  String? get eventLongDesc => _eventLongDesc;

  num? get collaborative => _collaborative;

  dynamic get partnerName => _partnerName;

  String? get eventDate => _eventDate;

  String? get endDate => _endDate;

  String? get startTime => _startTime;

  String? get endTime => _endTime;

  String? get price => _price;

  num? get hours => _hours;

  num? get seat => _seat;

  String? get venue => _venue;

  String? get eventImage => _eventImage;

  num? get publicationStatus => _publicationStatus;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cat_id'] = _catId;
    map['event_name'] = _eventName;
    map['event_short_desc'] = _eventShortDesc;
    map['event_long_desc'] = _eventLongDesc;
    map['collaborative'] = _collaborative;
    map['partner_name'] = _partnerName;
    map['event_date'] = _eventDate;
    map['end_date'] = _endDate;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['price'] = _price;
    map['hours'] = _hours;
    map['seat'] = _seat;
    map['venue'] = _venue;
    map['event_image'] = _eventImage;
    map['publication_status'] = _publicationStatus;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class Events {
  Events({
    num? id,
    num? catId,
    String? eventName,
    String? eventShortDesc,
    String? eventLongDesc,
    num? collaborative,
    dynamic partnerName,
    String? eventDate,
    String? endDate,
    String? startTime,
    String? endTime,
    String? price,
    num? hours,
    num? seat,
    String? venue,
    String? eventImage,
    num? publicationStatus,
    String? createdAt,
    String? updatedAt,
    List<BatchTrainer>? batchTrainer,
  }) {
    _id = id;
    _catId = catId;
    _eventName = eventName;
    _eventShortDesc = eventShortDesc;
    _eventLongDesc = eventLongDesc;
    _collaborative = collaborative;
    _partnerName = partnerName;
    _eventDate = eventDate;
    _endDate = endDate;
    _startTime = startTime;
    _endTime = endTime;
    _price = price;
    _hours = hours;
    _seat = seat;
    _venue = venue;
    _eventImage = eventImage;
    _publicationStatus = publicationStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _batchTrainer = batchTrainer;
  }

  Events.fromJson(dynamic json) {
    _id = json['id'];
    _catId = json['cat_id'];
    _eventName = json['event_name'];
    _eventShortDesc = json['event_short_desc'];
    _eventLongDesc = json['event_long_desc'];
    _collaborative = json['collaborative'];
    _partnerName = json['partner_name'];
    _eventDate = json['event_date'];
    _endDate = json['end_date'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _price = json['price'];
    _hours = json['hours'];
    _seat = json['seat'];
    _venue = json['venue'];
    _eventImage = json['event_image'];
    _publicationStatus = json['publication_status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['batch_trainer'] != null) {
      _batchTrainer = [];
      json['batch_trainer'].forEach((v) {
        _batchTrainer?.add(BatchTrainer.fromJson(v));
      });
    }
  }

  num? _id;
  num? _catId;
  String? _eventName;
  String? _eventShortDesc;
  String? _eventLongDesc;
  num? _collaborative;
  dynamic _partnerName;
  String? _eventDate;
  String? _endDate;
  String? _startTime;
  String? _endTime;
  String? _price;
  num? _hours;
  num? _seat;
  String? _venue;
  String? _eventImage;
  num? _publicationStatus;
  String? _createdAt;
  String? _updatedAt;
  List<BatchTrainer>? _batchTrainer;

  Events copyWith({
    num? id,
    num? catId,
    String? eventName,
    String? eventShortDesc,
    String? eventLongDesc,
    num? collaborative,
    dynamic partnerName,
    String? eventDate,
    String? endDate,
    String? startTime,
    String? endTime,
    String? price,
    num? hours,
    num? seat,
    String? venue,
    String? eventImage,
    num? publicationStatus,
    String? createdAt,
    String? updatedAt,
    List<BatchTrainer>? batchTrainer,
  }) =>
      Events(
        id: id ?? _id,
        catId: catId ?? _catId,
        eventName: eventName ?? _eventName,
        eventShortDesc: eventShortDesc ?? _eventShortDesc,
        eventLongDesc: eventLongDesc ?? _eventLongDesc,
        collaborative: collaborative ?? _collaborative,
        partnerName: partnerName ?? _partnerName,
        eventDate: eventDate ?? _eventDate,
        endDate: endDate ?? _endDate,
        startTime: startTime ?? _startTime,
        endTime: endTime ?? _endTime,
        price: price ?? _price,
        hours: hours ?? _hours,
        seat: seat ?? _seat,
        venue: venue ?? _venue,
        eventImage: eventImage ?? _eventImage,
        publicationStatus: publicationStatus ?? _publicationStatus,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        batchTrainer: batchTrainer ?? _batchTrainer,
      );

  num? get id => _id;

  num? get catId => _catId;

  String? get eventName => _eventName;

  String? get eventShortDesc => _eventShortDesc;

  String? get eventLongDesc => _eventLongDesc;

  num? get collaborative => _collaborative;

  dynamic get partnerName => _partnerName;

  String? get eventDate => _eventDate;

  String? get endDate => _endDate;

  String? get startTime => _startTime;

  String? get endTime => _endTime;

  String? get price => _price;

  num? get hours => _hours;

  num? get seat => _seat;

  String? get venue => _venue;

  String? get eventImage => _eventImage;

  num? get publicationStatus => _publicationStatus;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  List<BatchTrainer>? get batchTrainer => _batchTrainer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cat_id'] = _catId;
    map['event_name'] = _eventName;
    map['event_short_desc'] = _eventShortDesc;
    map['event_long_desc'] = _eventLongDesc;
    map['collaborative'] = _collaborative;
    map['partner_name'] = _partnerName;
    map['event_date'] = _eventDate;
    map['end_date'] = _endDate;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['price'] = _price;
    map['hours'] = _hours;
    map['seat'] = _seat;
    map['venue'] = _venue;
    map['event_image'] = _eventImage;
    map['publication_status'] = _publicationStatus;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_batchTrainer != null) {
      map['batch_trainer'] = _batchTrainer?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class BatchTrainer {
  BatchTrainer({
    num? id,
    dynamic batchId,
    dynamic workshopId,
    num? eventId,
    num? trainerId,
    String? createdAt,
    String? updatedAt,
    Trainer? trainer,
  }) {
    _id = id;
    _batchId = batchId;
    _workshopId = workshopId;
    _eventId = eventId;
    _trainerId = trainerId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _trainer = trainer;
  }

  BatchTrainer.fromJson(dynamic json) {
    _id = json['id'];
    _batchId = json['batch_id'];
    _workshopId = json['workshop_id'];
    _eventId = json['event_id'];
    _trainerId = json['trainer_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _trainer =
        json['trainer'] != null ? Trainer.fromJson(json['trainer']) : null;
  }

  num? _id;
  dynamic _batchId;
  dynamic _workshopId;
  num? _eventId;
  num? _trainerId;
  String? _createdAt;
  String? _updatedAt;
  Trainer? _trainer;

  BatchTrainer copyWith({
    num? id,
    dynamic batchId,
    dynamic workshopId,
    num? eventId,
    num? trainerId,
    String? createdAt,
    String? updatedAt,
    Trainer? trainer,
  }) =>
      BatchTrainer(
        id: id ?? _id,
        batchId: batchId ?? _batchId,
        workshopId: workshopId ?? _workshopId,
        eventId: eventId ?? _eventId,
        trainerId: trainerId ?? _trainerId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        trainer: trainer ?? _trainer,
      );

  num? get id => _id;

  dynamic get batchId => _batchId;

  dynamic get workshopId => _workshopId;

  num? get eventId => _eventId;

  num? get trainerId => _trainerId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Trainer? get trainer => _trainer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['batch_id'] = _batchId;
    map['workshop_id'] = _workshopId;
    map['event_id'] = _eventId;
    map['trainer_id'] = _trainerId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_trainer != null) {
      map['trainer'] = _trainer?.toJson();
    }
    return map;
  }
}

class Trainer {
  Trainer({
    num? id,
    String? trainerName,
    String? trainerTitle,
    String? trainerTrack,
    String? trainerPhone,
    String? trainerEmail,
    String? trainerAddress,
    String? trainerFacebook,
    String? trainerTwitter,
    String? trainerInstagram,
    dynamic trainerYoutube,
    String? trainerLinkdin,
    String? trainerBio,
    String? trainerImage,
    num? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _trainerName = trainerName;
    _trainerTitle = trainerTitle;
    _trainerTrack = trainerTrack;
    _trainerPhone = trainerPhone;
    _trainerEmail = trainerEmail;
    _trainerAddress = trainerAddress;
    _trainerFacebook = trainerFacebook;
    _trainerTwitter = trainerTwitter;
    _trainerInstagram = trainerInstagram;
    _trainerYoutube = trainerYoutube;
    _trainerLinkdin = trainerLinkdin;
    _trainerBio = trainerBio;
    _trainerImage = trainerImage;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Trainer.fromJson(dynamic json) {
    _id = json['id'];
    _trainerName = json['trainer_name'];
    _trainerTitle = json['trainer_title'];
    _trainerTrack = json['trainer_track'];
    _trainerPhone = json['trainer_phone'];
    _trainerEmail = json['trainer_email'];
    _trainerAddress = json['trainer_address'];
    _trainerFacebook = json['trainer_facebook'];
    _trainerTwitter = json['trainer_twitter'];
    _trainerInstagram = json['trainer_instagram'];
    _trainerYoutube = json['trainer_youtube'];
    _trainerLinkdin = json['trainer_linkdin'];
    _trainerBio = json['trainer_bio'];
    _trainerImage = json['trainer_image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _trainerName;
  String? _trainerTitle;
  String? _trainerTrack;
  String? _trainerPhone;
  String? _trainerEmail;
  String? _trainerAddress;
  String? _trainerFacebook;
  String? _trainerTwitter;
  String? _trainerInstagram;
  dynamic _trainerYoutube;
  String? _trainerLinkdin;
  String? _trainerBio;
  String? _trainerImage;
  num? _status;
  String? _createdAt;
  String? _updatedAt;

  Trainer copyWith({
    num? id,
    String? trainerName,
    String? trainerTitle,
    String? trainerTrack,
    String? trainerPhone,
    String? trainerEmail,
    String? trainerAddress,
    String? trainerFacebook,
    String? trainerTwitter,
    String? trainerInstagram,
    dynamic trainerYoutube,
    String? trainerLinkdin,
    String? trainerBio,
    String? trainerImage,
    num? status,
    String? createdAt,
    String? updatedAt,
  }) =>
      Trainer(
        id: id ?? _id,
        trainerName: trainerName ?? _trainerName,
        trainerTitle: trainerTitle ?? _trainerTitle,
        trainerTrack: trainerTrack ?? _trainerTrack,
        trainerPhone: trainerPhone ?? _trainerPhone,
        trainerEmail: trainerEmail ?? _trainerEmail,
        trainerAddress: trainerAddress ?? _trainerAddress,
        trainerFacebook: trainerFacebook ?? _trainerFacebook,
        trainerTwitter: trainerTwitter ?? _trainerTwitter,
        trainerInstagram: trainerInstagram ?? _trainerInstagram,
        trainerYoutube: trainerYoutube ?? _trainerYoutube,
        trainerLinkdin: trainerLinkdin ?? _trainerLinkdin,
        trainerBio: trainerBio ?? _trainerBio,
        trainerImage: trainerImage ?? _trainerImage,
        status: status ?? _status,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  String? get trainerName => _trainerName;

  String? get trainerTitle => _trainerTitle;

  String? get trainerTrack => _trainerTrack;

  String? get trainerPhone => _trainerPhone;

  String? get trainerEmail => _trainerEmail;

  String? get trainerAddress => _trainerAddress;

  String? get trainerFacebook => _trainerFacebook;

  String? get trainerTwitter => _trainerTwitter;

  String? get trainerInstagram => _trainerInstagram;

  dynamic get trainerYoutube => _trainerYoutube;

  String? get trainerLinkdin => _trainerLinkdin;

  String? get trainerBio => _trainerBio;

  String? get trainerImage => _trainerImage;

  num? get status => _status;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['trainer_name'] = _trainerName;
    map['trainer_title'] = _trainerTitle;
    map['trainer_track'] = _trainerTrack;
    map['trainer_phone'] = _trainerPhone;
    map['trainer_email'] = _trainerEmail;
    map['trainer_address'] = _trainerAddress;
    map['trainer_facebook'] = _trainerFacebook;
    map['trainer_twitter'] = _trainerTwitter;
    map['trainer_instagram'] = _trainerInstagram;
    map['trainer_youtube'] = _trainerYoutube;
    map['trainer_linkdin'] = _trainerLinkdin;
    map['trainer_bio'] = _trainerBio;
    map['trainer_image'] = _trainerImage;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
