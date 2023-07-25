import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:screen_design/custom/header.dart';
import 'package:screen_design/custom/header_menu.dart';
import 'package:provider/provider.dart';
import 'package:screen_design/helper/helper_method.dart';
import '../provider/blog_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  late BlogProvider blogProvider;
  late ScrollController scrollController;
  Color appBarBg = Colors.white;
  bool callOnce = true;
  bool show = false;
  int count = 5;
  int increment = 0;
  bool check = true;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          show = true;
          appBarBg = Colors.white;
        });
      }

      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          show = false;
          appBarBg = Colors.pink;
        });
      }
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    blogProvider = Provider.of(context, listen: true);
    if (callOnce) {
      blogProvider.getLatestBlogServiceData();
      blogProvider.getPopularBlogServiceData();
      blogProvider.getBlogCategoryServiceData();
      blogProvider.getArchivesBlogServiceData();
      callOnce = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: show
              ? const IconThemeData(color: Colors.black)
              : const IconThemeData(color: Colors.white),
          backgroundColor: show ? Colors.white : Color(0xff2E5A88),
          title: show
              ? const Hero(tag: 'menu', child: HeaderMenu())
              : Hero(
                  tag: 'menu',
                  child: Header(title: 'Blogs', icon: Icons.book_outlined))),
      body: ListView(
        controller: scrollController,
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        children: [
          HeaderMenu(),
          const SizedBox(
            height: 5,
          ),

          //Latest Blogs

          blogProvider.allLatestBlogList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: count,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: CachedNetworkImage(
                              imageUrl: check
                                  ? 'https://pencilbox.edu.bd/${blogProvider.allLatestBlogList[index + increment].blogImage!}'
                                  : 'https://pencilbox.edu.bd/${blogProvider.allLatestBlogList[index + increment].blogImage!}',
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Image.asset(
                                'images/placeholder.png',
                                fit: BoxFit.cover,
                                height: 300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.check_box,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        Text(blogProvider
                                            .allLatestBlogList[index]
                                            .authorName!),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.timer,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        Text(HelperMethod.getDateFormat(
                                            'dd MMM yyyy',
                                            DateTime.parse(blogProvider
                                                .allLatestBlogList[index]
                                                .createdAt!))),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.calendar_month,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    Text(blogProvider.allLatestBlogList[index]
                                        .blogtag!.first.blogtags!.catName!),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: FittedBox(
                                child: Text(
                                    blogProvider
                                        .allLatestBlogList[index].title!,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.orange),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        'read_blog_page',
                                        arguments: [
                                          1,
                                          blogProvider.allLatestBlogList[index]
                                        ]);
                                  },
                                  child: const FittedBox(
                                    child: Text(
                                      'Read More',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
          blogProvider.allLatestBlogList.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      child: ElevatedButton(
                          onPressed: increment >= count
                              ? () {
                                  setState(() {
                                    increment = increment - 5;
                                    check = false;
                                  });
                                }
                              : null,
                          child: Text('Previous')),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(
                          onPressed:
                              increment < blogProvider.allLatestBlogList.length
                                  ? () {
                                      setState(() {
                                        increment = increment + 5;
                                        check = true;
                                      });
                                    }
                                  : null,
                          child: Text('Next')),
                    ),
                  ],
                )
              : Text(''),

          //Blog Categoryy

          SizedBox(
            height: 10,
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'see all>>',
                style: TextStyle(fontSize: 15, color: Colors.red),
              ),
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          // Blog category

          SizedBox(
            height: 90,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: blogProvider.allBlogCategoryList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            'blog_list_page',
                            arguments: [1, blogProvider
                                .allBlogCategoryList[index].catName!]);
                      },
                      child: Card(
                        //elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Align(
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            blogProvider.allBlogCategoryList[index].catName!,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),

          const SizedBox(
            height: 10,
          ),

          //Popular Blogs

          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Populer Blogs',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                blogProvider.allPopularBlogList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: Colors.black,
                      ))
                    : ListView.builder(
                        itemCount: blogProvider.allPopularBlogList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                SizedBox(
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          'read_blog_page',
                                          arguments: [
                                            2,
                                            blogProvider
                                                .allPopularBlogList[index]
                                          ]);
                                    },
                                    leading: CachedNetworkImage(
                                      imageUrl:
                                          'https://pencilbox.edu.bd/${blogProvider.allPopularBlogList[index].blogImage!}',
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset('images/placeholder.png'),
                                    ),
                                    title: Text(blogProvider
                                        .allPopularBlogList[index].title!),
                                    subtitle: Text(HelperMethod.getDateFormat(
                                        'yyyy-MM-dd',
                                        DateTime.parse(blogProvider
                                            .allPopularBlogList[index]
                                            .createdAt!))),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            )),
                      ),
              ],
            ),
          ),

          //blog archive

          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Blogs By Months',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                ListView.builder(
                  itemCount: blogProvider.allBlogArchivesList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            blogProvider.getBlogByCategory(
                                blogProvider.allBlogArchivesList[index].year!,
                                blogProvider.allBlogArchivesList[index].month!);
                            Navigator.of(context).pushNamed('blog_list_page', arguments: [2, blogProvider.sortedBlogByMonthList ]);

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${blogProvider.allBlogArchivesList[index].monthname!} (${blogProvider.allBlogArchivesList[index].year})',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.blue),
                              ),
                              Text(
                                ' (${blogProvider.allBlogArchivesList[index].postCount.toString()})',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          color: Colors.black12,
                          height: 1,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
