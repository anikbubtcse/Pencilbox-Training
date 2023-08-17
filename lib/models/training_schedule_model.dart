class TrainingScheduleModel {
  TrainingScheduleModel({
    num? id,
    num? batchId,
    dynamic workshopId,
    String? trainingDay,
    String? startTime,
    String? endTime,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    _id = id;
    _batchId = batchId;
    _workshopId = workshopId;
    _trainingDay = trainingDay;
    _startTime = startTime;
    _endTime = endTime;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  TrainingScheduleModel.fromJson(dynamic json) {
    _id = json['id'];
    _batchId = json['batch_id'];
    _workshopId = json['workshop_id'];
    _trainingDay = json['training_day'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  num? _batchId;
  dynamic _workshopId;
  String? _trainingDay;
  String? _startTime;
  String? _endTime;
  dynamic _createdAt;
  dynamic _updatedAt;

  TrainingScheduleModel copyWith({
    num? id,
    num? batchId,
    dynamic workshopId,
    String? trainingDay,
    String? startTime,
    String? endTime,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      TrainingScheduleModel(
        id: id ?? _id,
        batchId: batchId ?? _batchId,
        workshopId: workshopId ?? _workshopId,
        trainingDay: trainingDay ?? _trainingDay,
        startTime: startTime ?? _startTime,
        endTime: endTime ?? _endTime,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  num? get batchId => _batchId;

  dynamic get workshopId => _workshopId;

  String? get trainingDay => _trainingDay;

  String? get startTime => _startTime;

  String? get endTime => _endTime;

  dynamic get createdAt => _createdAt;

  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['batch_id'] = _batchId;
    map['workshop_id'] = _workshopId;
    map['training_day'] = _trainingDay;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
