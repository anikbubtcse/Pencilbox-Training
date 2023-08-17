class PopularBlogModel {
  PopularBlogModel({
    this.id,
    this.title,
    this.blogSubTitle,
    this.blogMetaDesc,
    this.metaKeywords,
    this.h2ForSeo,
    this.authorName,
    this.blogShortDesc,
    this.blogPost,
    this.userId,
    this.blogImage,
    this.publicationStatus,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.category,
    this.blogtag,
  });

  PopularBlogModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    blogSubTitle = json['blog_sub_title'];
    blogMetaDesc = json['blog_meta_desc'];
    metaKeywords = json['meta_keywords'];
    h2ForSeo = json['h2_for_seo'];
    authorName = json['author_name'];
    blogShortDesc = json['blog_short_desc'];
    blogPost = json['blog_post'];
    userId = json['user_id'];
    blogImage = json['blog_image'];
    publicationStatus = json['publication_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    category = json['category'];
    if (json['blogtag'] != null) {
      blogtag = [];
      json['blogtag'].forEach((v) {
        blogtag?.add(Blogtag.fromJson(v));
      });
    }
  }

  num? id;
  String? title;
  dynamic blogSubTitle;
  String? blogMetaDesc;
  String? metaKeywords;
  String? h2ForSeo;
  String? authorName;
  String? blogShortDesc;
  String? blogPost;
  num? userId;
  String? blogImage;
  num? publicationStatus;
  String? createdAt;
  String? updatedAt;
  User? user;
  dynamic category;
  List<Blogtag>? blogtag;

  PopularBlogModel copyWith({
    num? id,
    String? title,
    dynamic blogSubTitle,
    String? blogMetaDesc,
    String? metaKeywords,
    String? h2ForSeo,
    String? authorName,
    String? blogShortDesc,
    String? blogPost,
    num? userId,
    String? blogImage,
    num? publicationStatus,
    String? createdAt,
    String? updatedAt,
    User? user,
    dynamic category,
    List<Blogtag>? blogtag,
  }) =>
      PopularBlogModel(
        id: id ?? this.id,
        title: title ?? this.title,
        blogSubTitle: blogSubTitle ?? this.blogSubTitle,
        blogMetaDesc: blogMetaDesc ?? this.blogMetaDesc,
        metaKeywords: metaKeywords ?? this.metaKeywords,
        h2ForSeo: h2ForSeo ?? this.h2ForSeo,
        authorName: authorName ?? this.authorName,
        blogShortDesc: blogShortDesc ?? this.blogShortDesc,
        blogPost: blogPost ?? this.blogPost,
        userId: userId ?? this.userId,
        blogImage: blogImage ?? this.blogImage,
        publicationStatus: publicationStatus ?? this.publicationStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        user: user ?? this.user,
        category: category ?? this.category,
        blogtag: blogtag ?? this.blogtag,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['blog_sub_title'] = blogSubTitle;
    map['blog_meta_desc'] = blogMetaDesc;
    map['meta_keywords'] = metaKeywords;
    map['h2_for_seo'] = h2ForSeo;
    map['author_name'] = authorName;
    map['blog_short_desc'] = blogShortDesc;
    map['blog_post'] = blogPost;
    map['user_id'] = userId;
    map['blog_image'] = blogImage;
    map['publication_status'] = publicationStatus;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['category'] = category;
    if (blogtag != null) {
      map['blogtag'] = blogtag?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Blogtag {
  Blogtag({
    this.id,
    this.blogId,
    this.catId,
    this.createdAt,
    this.updatedAt,
    this.blogtags,
  });

  Blogtag.fromJson(dynamic json) {
    id = json['id'];
    blogId = json['blog_id'];
    catId = json['cat_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    blogtags =
        json['blogtags'] != null ? Blogtags.fromJson(json['blogtags']) : null;
  }

  num? id;
  num? blogId;
  num? catId;
  String? createdAt;
  String? updatedAt;
  Blogtags? blogtags;

  Blogtag copyWith({
    num? id,
    num? blogId,
    num? catId,
    String? createdAt,
    String? updatedAt,
    Blogtags? blogtags,
  }) =>
      Blogtag(
        id: id ?? this.id,
        blogId: blogId ?? this.blogId,
        catId: catId ?? this.catId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        blogtags: blogtags ?? this.blogtags,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['blog_id'] = blogId;
    map['cat_id'] = catId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (blogtags != null) {
      map['blogtags'] = blogtags?.toJson();
    }
    return map;
  }
}

class Blogtags {
  Blogtags({
    this.id,
    this.catName,
    this.createdAt,
    this.updatedAt,
  });

  Blogtags.fromJson(dynamic json) {
    id = json['id'];
    catName = json['cat_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  String? catName;
  String? createdAt;
  String? updatedAt;

  Blogtags copyWith({
    num? id,
    String? catName,
    String? createdAt,
    String? updatedAt,
  }) =>
      Blogtags(
        id: id ?? this.id,
        catName: catName ?? this.catName,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['cat_name'] = catName;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phoneNo,
    this.address,
    this.role,
    this.seipRole,
    this.seipPermission,
    this.pencilboxPermission,
    this.photo,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNo = json['phone_no'];
    address = json['address'];
    role = json['role'];
    seipRole = json['seip_role'];
    seipPermission = json['seip_permission'];
    pencilboxPermission = json['pencilbox_permission'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  String? name;
  String? email;
  String? phoneNo;
  String? address;
  num? role;
  num? seipRole;
  num? seipPermission;
  num? pencilboxPermission;
  String? photo;
  String? createdAt;
  String? updatedAt;

  User copyWith({
    num? id,
    String? name,
    String? email,
    String? phoneNo,
    String? address,
    num? role,
    num? seipRole,
    num? seipPermission,
    num? pencilboxPermission,
    String? photo,
    String? createdAt,
    String? updatedAt,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNo: phoneNo ?? this.phoneNo,
        address: address ?? this.address,
        role: role ?? this.role,
        seipRole: seipRole ?? this.seipRole,
        seipPermission: seipPermission ?? this.seipPermission,
        pencilboxPermission: pencilboxPermission ?? this.pencilboxPermission,
        photo: photo ?? this.photo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone_no'] = phoneNo;
    map['address'] = address;
    map['role'] = role;
    map['seip_role'] = seipRole;
    map['seip_permission'] = seipPermission;
    map['pencilbox_permission'] = pencilboxPermission;
    map['photo'] = photo;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
