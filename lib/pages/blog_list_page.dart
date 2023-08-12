import 'package:flutter/material.dart';
import 'package:screen_design/provider/blog_provider.dart';
import 'package:provider/provider.dart';

import '../models/latest_blog_model.dart';

class BlogListPage extends StatefulWidget {
  const BlogListPage({super.key});

  @override
  State<BlogListPage> createState() => _BlogListPageState();
}

class _BlogListPageState extends State<BlogListPage> {
  late List list;
  late BlogProvider blogProvider;
  late int id;
  bool callOnce = true;
  late List<LatestBlogModel> sortedBlogByMonthList = [];

  @override
  void didChangeDependencies() {
    list = ModalRoute.of(context)!.settings.arguments as List;
    id = list[0];
    blogProvider = Provider.of(context, listen: true);
    if (callOnce) {
      if (id == 1) {
        blogProvider.getCategoryWiseBlog(list[1]);
        print(blogProvider.blogByCategoryNameList.length);

      }

      if (id == 2) {
        sortedBlogByMonthList = list[1];
      }

      callOnce = false;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff2E5A88),
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            id == 1 ? list[1] : 'Blogs',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: GridView.builder(
                padding: const EdgeInsets.only(left: 10, right: 10),
                itemCount: id == 1
                    ? blogProvider.blogByCategoryNameList.length
                    : sortedBlogByMonthList.length,
                itemBuilder: (context, index) => Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.network(id == 1
                                      ? 'https://pencilbox.edu.bd/${blogProvider.blogByCategoryNameList[index].blogImage}'
                                      : 'https://pencilbox.edu.bd/${sortedBlogByMonthList[index].blogImage}'),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                                id == 1
                                    ? blogProvider
                                        .blogByCategoryNameList[index].title!
                                    : sortedBlogByMonthList[index].title!,
                                style: TextStyle(fontSize: 12),
                                maxLines: 2),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 4.0, right: 8, bottom: 8, top: 4),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {
                                    id == 1
                                        ? Navigator.of(context).pushNamed(
                                            'read_blog_page',
                                            arguments: [
                                                3,
                                                blogProvider
                                                        .blogByCategoryNameList[
                                                    index]
                                              ])
                                        : Navigator.of(context).pushNamed(
                                            'read_blog_page',
                                            arguments: [
                                                4,
                                                sortedBlogByMonthList[index]
                                              ]);
                                  },
                                  child: Card(
                                    elevation: 3,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.purple,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 12.0,
                                            right: 12,
                                            top: 5,
                                            bottom: 5),
                                        child: Text(
                                          'Read More',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 2,
                ),
              ));
  }
}
