class CourseModuleModel {
  num? id;
  num? trainingId;
  String? moduleName;
  String? moduleDesc;
  dynamic createdAt;
  dynamic updatedAt;
  bool? isExpanded;

  CourseModuleModel({
    this.id,
    this.trainingId,
    this.moduleName,
    this.moduleDesc,
    this.createdAt,
    this.updatedAt,
    this.isExpanded = false,
  });

  CourseModuleModel.fromJson(dynamic json) {
    id = json['id'];
    trainingId = json['training_id'];
    moduleName = json['module_name'];
    moduleDesc = json['module_desc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  CourseModuleModel copyWith({
    num? id,
    num? trainingId,
    String? moduleName,
    String? moduleDesc,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      CourseModuleModel(
        id: id ?? this.id,
        trainingId: trainingId ?? this.trainingId,
        moduleName: moduleName ?? this.moduleName,
        moduleDesc: moduleDesc ?? this.moduleDesc,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['training_id'] = trainingId;
    map['module_name'] = moduleName;
    map['module_desc'] = moduleDesc;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
