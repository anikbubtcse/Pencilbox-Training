class BlogCategoryModel {
  BlogCategoryModel({
    this.id,
    this.catName,
    this.createdAt,
    this.updatedAt,
    this.blog,
  });

  BlogCategoryModel.fromJson(dynamic json) {
    id = json['id'];
    catName = json['cat_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['blog'] != null) {
      blog = [];
      json['blog'].forEach((v) {
        blog?.add(Blog.fromJson(v));
      });
    }
  }

  num? id;
  String? catName;
  String? createdAt;
  String? updatedAt;
  List<Blog>? blog;

  BlogCategoryModel copyWith({
    num? id,
    String? catName,
    String? createdAt,
    String? updatedAt,
    List<Blog>? blog,
  }) =>
      BlogCategoryModel(
        id: id ?? this.id,
        catName: catName ?? this.catName,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        blog: blog ?? this.blog,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['cat_name'] = catName;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (blog != null) {
      map['blog'] = blog?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Blog {
  Blog({
    this.id,
    this.blogId,
    this.catId,
    this.createdAt,
    this.updatedAt,
  });

  Blog.fromJson(dynamic json) {
    id = json['id'];
    blogId = json['blog_id'];
    catId = json['cat_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  num? blogId;
  num? catId;
  String? createdAt;
  String? updatedAt;

  Blog copyWith({
    num? id,
    num? blogId,
    num? catId,
    String? createdAt,
    String? updatedAt,
  }) =>
      Blog(
        id: id ?? this.id,
        blogId: blogId ?? this.blogId,
        catId: catId ?? this.catId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['blog_id'] = blogId;
    map['cat_id'] = catId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
