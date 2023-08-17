class TrainerModel {
  TrainerModel({
    this.id,
    this.trainerName,
    this.trainerTitle,
    this.trainerTrack,
    this.trainerPhone,
    this.trainerEmail,
    this.trainerAddress,
    this.trainerFacebook,
    this.trainerTwitter,
    this.trainerInstagram,
    this.trainerYoutube,
    this.trainerLinkdin,
    this.trainerBio,
    this.trainerImage,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  TrainerModel.fromJson(dynamic json) {
    id = json['id'];
    trainerName = json['trainer_name'];
    trainerTitle = json['trainer_title'];
    trainerTrack = json['trainer_track'];
    trainerPhone = json['trainer_phone'];
    trainerEmail = json['trainer_email'];
    trainerAddress = json['trainer_address'];
    trainerFacebook = json['trainer_facebook'];
    trainerTwitter = json['trainer_twitter'];
    trainerInstagram = json['trainer_instagram'];
    trainerYoutube = json['trainer_youtube'];
    trainerLinkdin = json['trainer_linkdin'];
    trainerBio = json['trainer_bio'];
    trainerImage = json['trainer_image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  String? trainerName;
  String? trainerTitle;
  String? trainerTrack;
  String? trainerPhone;
  String? trainerEmail;
  String? trainerAddress;
  String? trainerFacebook;
  String? trainerTwitter;
  String? trainerInstagram;
  dynamic trainerYoutube;
  String? trainerLinkdin;
  String? trainerBio;
  String? trainerImage;
  num? status;
  String? createdAt;
  String? updatedAt;

  TrainerModel copyWith({
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
      TrainerModel(
        id: id ?? this.id,
        trainerName: trainerName ?? this.trainerName,
        trainerTitle: trainerTitle ?? this.trainerTitle,
        trainerTrack: trainerTrack ?? this.trainerTrack,
        trainerPhone: trainerPhone ?? this.trainerPhone,
        trainerEmail: trainerEmail ?? this.trainerEmail,
        trainerAddress: trainerAddress ?? this.trainerAddress,
        trainerFacebook: trainerFacebook ?? this.trainerFacebook,
        trainerTwitter: trainerTwitter ?? this.trainerTwitter,
        trainerInstagram: trainerInstagram ?? this.trainerInstagram,
        trainerYoutube: trainerYoutube ?? this.trainerYoutube,
        trainerLinkdin: trainerLinkdin ?? this.trainerLinkdin,
        trainerBio: trainerBio ?? this.trainerBio,
        trainerImage: trainerImage ?? this.trainerImage,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['trainer_name'] = trainerName;
    map['trainer_title'] = trainerTitle;
    map['trainer_track'] = trainerTrack;
    map['trainer_phone'] = trainerPhone;
    map['trainer_email'] = trainerEmail;
    map['trainer_address'] = trainerAddress;
    map['trainer_facebook'] = trainerFacebook;
    map['trainer_twitter'] = trainerTwitter;
    map['trainer_instagram'] = trainerInstagram;
    map['trainer_youtube'] = trainerYoutube;
    map['trainer_linkdin'] = trainerLinkdin;
    map['trainer_bio'] = trainerBio;
    map['trainer_image'] = trainerImage;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
