class BlogArchivesModel {
  BlogArchivesModel({
      this.year, 
      this.month, 
      this.monthname, 
      this.postCount,});

  BlogArchivesModel.fromJson(dynamic json) {
    year = json['year'];
    month = json['month'];
    monthname = json['monthname'];
    postCount = json['post_count'];
  }
  num? year;
  num? month;
  String? monthname;
  num? postCount;
BlogArchivesModel copyWith({  num? year,
  num? month,
  String? monthname,
  num? postCount,
}) => BlogArchivesModel(  year: year ?? this.year,
  month: month ?? this.month,
  monthname: monthname ?? this.monthname,
  postCount: postCount ?? this.postCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = year;
    map['month'] = month;
    map['monthname'] = monthname;
    map['post_count'] = postCount;
    return map;
  }

}