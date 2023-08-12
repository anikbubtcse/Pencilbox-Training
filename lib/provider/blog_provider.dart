import 'package:flutter/cupertino.dart';
import 'package:screen_design/models/blog_archives_model.dart';
import 'package:screen_design/models/blog_category_model.dart';
import 'package:screen_design/models/latest_blog_model.dart';
import 'package:screen_design/models/popular_blog_model.dart';
import 'package:screen_design/service/blog_service.dart';
import 'package:intl/intl.dart';

class BlogProvider extends ChangeNotifier {
  List<LatestBlogModel> allLatestBlogList = [];
  List<PopularBlogModel> allPopularBlogList = [];
  List<BlogCategoryModel> allBlogCategoryList = [];
  List<LatestBlogModel> blogByCategoryNameList = [];
  List<BlogArchivesModel> allBlogArchivesList = [];
  List<LatestBlogModel> sortedBlogByMonthList = [];

  getLatestBlogServiceData() async {
    allLatestBlogList.clear();
    dynamic data = await BlogService.getLatestBlog();

    if (data != null) {
      for (Map i in data) {
        allLatestBlogList.add(LatestBlogModel.fromJson(i));
      }
    }

    notifyListeners();
  }

  getPopularBlogServiceData() async {
    allPopularBlogList.clear();
    dynamic data = await BlogService.getPopularBlog();

    for (Map i in data) {
      allPopularBlogList.add(PopularBlogModel.fromJson(i));
    }
    notifyListeners();
    print('allPopularBlogList.length: ${allPopularBlogList.length}');
  }

  getBlogCategoryServiceData() async {
    allBlogCategoryList.clear();
    dynamic data = await BlogService.getBlogCategory();

    for (Map i in data) {
      allBlogCategoryList.add(BlogCategoryModel.fromJson(i));
    }
    notifyListeners();
  }

  getCategoryWiseBlog(String CategoryName) {
    blogByCategoryNameList.clear();
    allLatestBlogList.forEach((element) {
      element.blogtag!.forEach((elements) {
        if (elements.blogtags!.catName == CategoryName) {
          blogByCategoryNameList.add(element);
        }
      });
    });
  }

  getArchivesBlogServiceData() async {
    allBlogArchivesList.clear();
    dynamic data = await BlogService.getArchivesBlog();

    for (Map i in data) {
      allBlogArchivesList.add(BlogArchivesModel.fromJson(i));
    }
    notifyListeners();
  }

  getBlogByCategory(num year, num month) {
    sortedBlogByMonthList.clear();
    final formattedGivenDate =
        DateFormat.yMMMM().format(DateTime(year.toInt(), month.toInt()));
    allLatestBlogList.forEach((element) {
      String createdAt = element.createdAt!;
      final formattedBlogDate =
          DateFormat.yMMMM().format(DateTime.parse(createdAt));

      if (formattedGivenDate == formattedBlogDate) {
        sortedBlogByMonthList.add(element);
      }
    });
  }
}
