import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_design/helper/helper_method.dart';
import 'package:screen_design/provider/blog_provider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  TextEditingController blogController = TextEditingController();
  late BlogProvider blogProvider;
  int popUpValue = 0;
  bool isChecked = false;
  String blogInfo = '';

  @override
  void didChangeDependencies() {
    blogProvider = Provider.of(context, listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'Blog',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      controller: blogController,
                      onChanged: (value) {
                        setState(() {
                          blogInfo = value;

                          if (blogInfo.isNotEmpty) {
                            setState(() {
                              isChecked = true;
                            });
                          }

                          if (blogInfo.isEmpty) {
                            setState(() {
                              isChecked = false;
                            });
                          }
                        });
                      },
                      decoration: InputDecoration(
                        suffixIcon: blogController.text.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 12.0),
                                child: IconButton(
                                  iconSize: 20,
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      blogController.clear();
                                      isChecked = false;
                                      blogInfo = '';
                                    });
                                  },
                                ),
                              )
                            : null,
                        label: Text(
                          'Search for article',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff878787)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                isChecked && blogInfo.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: blogProvider.allLatestBlogList.length,
                        itemBuilder: (contex, index) {
                          if (blogProvider.allLatestBlogList[index].title
                                  .toString()
                                  .toLowerCase()
                                  .contains(blogInfo.toLowerCase()) ||
                              blogProvider.allLatestBlogList[index].blogSubTitle
                                  .toString()
                                  .toLowerCase()
                                  .contains(blogInfo.toLowerCase())) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19)),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(19),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://pencilbox.edu.bd/${blogProvider.allLatestBlogList[index].blogImage!}',
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                                'images/placeholder.png'),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        blogProvider
                                            .allLatestBlogList[index].title!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff292929)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        blogProvider.allLatestBlogList[index]
                                            .authorName!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff716F6F)),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'images/date.png',
                                                  height: 13,
                                                  width: 13,
                                                  color: Color(0xff808080),
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  HelperMethod.getDateFormat(
                                                      'dd-MM-yyyy',
                                                      DateTime.parse(blogProvider
                                                          .allLatestBlogList[
                                                              index]
                                                          .createdAt!)),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: const Color(
                                                          0xff808080)),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'images/technology.png',
                                                  height: 13,
                                                  width: 13,
                                                  color: Color(0xff808080),
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  blogProvider
                                                      .allLatestBlogList[index]
                                                      .blogtag!
                                                      .first
                                                      .blogtags!
                                                      .catName!,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: const Color(
                                                          0xff808080)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pushNamed(
                                                  'read_blog_page',
                                                  arguments: [
                                                    1,
                                                    blogProvider
                                                            .allLatestBlogList[
                                                        index]
                                                  ]);
                                            },
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty
                                                    .all(RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10))),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color(
                                                            (0xffDB1E37)))),
                                            child: Text(
                                              'Read more',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xffFFFFFF)),
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }

                          return Container();
                        })
                    : Container(),
                isChecked == false
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Categories',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff212121)),
                              ),
                              InkWell(
                                onTap: () {
                                  showMenu(
                                      context: context,
                                      position: const RelativeRect.fromLTRB(
                                          100, 195, 30, 100),
                                      items: [
                                        PopupMenuItem(
                                            value: 1,
                                            height: 30,
                                            child: Text(
                                              "Latest Blogs",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            )),
                                        PopupMenuItem(
                                            value: 2,
                                            height: 30,
                                            child: Text(
                                              "Popular Blogs",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            )),
                                        PopupMenuItem(
                                            height: 30,
                                            child: PopupMenuButton(
                                              offset: Offset(-50, 15),
                                              position: PopupMenuPosition.under,
                                              child: Row(
                                                children: [
                                                  Text('Blogs by Months',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black)),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  Icon(Icons.arrow_drop_down),
                                                ],
                                              ),
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return [
                                                  ...blogProvider
                                                      .allBlogArchivesList
                                                      .map((data) {
                                                    return PopupMenuItem(
                                                        height: 15,
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            blogProvider
                                                                .getBlogByCategory(
                                                                    data.year!,
                                                                    data.month!);
                                                            Navigator.of(
                                                                    context)
                                                                .pushNamed(
                                                                    'blog_list_page',
                                                                    arguments: [
                                                                  2,
                                                                  blogProvider
                                                                      .sortedBlogByMonthList
                                                                ]);
                                                          },
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                  '${data.monthname!} (${data.year})  (${data.postCount.toString()})',
                                                                  style: GoogleFonts.poppins(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Colors
                                                                          .black)),
                                                              PopupMenuDivider(),
                                                            ],
                                                          ),
                                                        ));
                                                  }).toList(),
                                                ];
                                              },
                                            )),
                                      ]).then((value) {
                                    if (value != null) {
                                      if (value == 1) {
                                        print(value);
                                        setState(() {
                                          popUpValue = value;
                                        });
                                      }

                                      if (value == 2) {
                                        setState(() {
                                          print(value);
                                          popUpValue = value;
                                        });
                                      }
                                    }
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Sort by',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff212121)),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Image.asset(
                                      'images/bar_chart.png',
                                      height: 20,
                                      width: 20,
                                      color: Color(0xff000000),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 40,
                            child: blogProvider.allBlogCategoryList.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        blogProvider.allBlogCategoryList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                  'blog_list_page',
                                                  arguments: [
                                                    1,
                                                    blogProvider
                                                        .allBlogCategoryList[
                                                            index]
                                                        .catName!
                                                  ]);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(19),
                                                  border: Border.all(
                                                      color:
                                                          Color(0xffDDDDDD))),
                                              child: Text(
                                                blogProvider
                                                    .allBlogCategoryList[index]
                                                    .catName!,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          )
                                        ],
                                      );
                                    },
                                  ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          popUpValue == 0 || popUpValue == 1
                              ? blogProvider.allLatestBlogList.isEmpty
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          blogProvider.allLatestBlogList.length,
                                      itemBuilder: (contex, index) {
                                        return Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(19)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(19),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        'https://pencilbox.edu.bd/${blogProvider.allLatestBlogList[index].blogImage!}',
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    fit: BoxFit.cover,
                                                    placeholder: (context,
                                                            url) =>
                                                        const Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        Image.asset(
                                                            'images/placeholder.png'),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    blogProvider
                                                        .allLatestBlogList[
                                                            index]
                                                        .title!,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xff292929)),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    blogProvider
                                                        .allLatestBlogList[
                                                            index]
                                                        .authorName!,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color:
                                                            Color(0xff716F6F)),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              'images/date.png',
                                                              height: 13,
                                                              width: 13,
                                                              color: Color(
                                                                  0xff808080),
                                                            ),
                                                            const SizedBox(
                                                              width: 3,
                                                            ),
                                                            Text(
                                                              HelperMethod.getDateFormat(
                                                                  'dd-MM-yyyy',
                                                                  DateTime.parse(blogProvider
                                                                      .allLatestBlogList[
                                                                          index]
                                                                      .createdAt!)),
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  color: const Color(
                                                                      0xff808080)),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              'images/technology.png',
                                                              height: 13,
                                                              width: 13,
                                                              color: Color(
                                                                  0xff808080),
                                                            ),
                                                            const SizedBox(
                                                              width: 3,
                                                            ),
                                                            Text(
                                                              blogProvider
                                                                  .allLatestBlogList[
                                                                      index]
                                                                  .blogtag!
                                                                  .first
                                                                  .blogtags!
                                                                  .catName!,
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  color: const Color(
                                                                      0xff808080)),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pushNamed(
                                                                  'read_blog_page',
                                                                  arguments: [
                                                                1,
                                                                blogProvider
                                                                        .allLatestBlogList[
                                                                    index]
                                                              ]);
                                                        },
                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10))),
                                                            backgroundColor:
                                                                MaterialStateProperty.all(
                                                                    const Color(
                                                                        (0xffDB1E37)))),
                                                        child: Text(
                                                          'Read more',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Color(
                                                                      0xffFFFFFF)),
                                                        ))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      })
                              : blogProvider.allPopularBlogList.isEmpty
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: blogProvider
                                          .allPopularBlogList.length,
                                      itemBuilder: (contex, index) {
                                        return Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(19)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(19),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        'https://pencilbox.edu.bd/${blogProvider.allPopularBlogList[index].blogImage!}',
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    fit: BoxFit.cover,
                                                    placeholder: (context,
                                                            url) =>
                                                        const Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        Image.asset(
                                                            'images/placeholder.png'),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    blogProvider
                                                        .allPopularBlogList[
                                                            index]
                                                        .title!,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xff292929)),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    blogProvider
                                                        .allPopularBlogList[
                                                            index]
                                                        .authorName!,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color:
                                                            Color(0xff716F6F)),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              'images/date.png',
                                                              height: 13,
                                                              width: 13,
                                                              color: Color(
                                                                  0xff808080),
                                                            ),
                                                            const SizedBox(
                                                              width: 3,
                                                            ),
                                                            Text(
                                                              HelperMethod.getDateFormat(
                                                                  'dd-MM-yyyy',
                                                                  DateTime.parse(blogProvider
                                                                      .allPopularBlogList[
                                                                          index]
                                                                      .createdAt!)),
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  color: const Color(
                                                                      0xff808080)),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              'images/technology.png',
                                                              height: 13,
                                                              width: 13,
                                                              color: Color(
                                                                  0xff808080),
                                                            ),
                                                            const SizedBox(
                                                              width: 3,
                                                            ),
                                                            Text(
                                                              blogProvider
                                                                  .allPopularBlogList[
                                                                      index]
                                                                  .blogtag!
                                                                  .first
                                                                  .blogtags!
                                                                  .catName!,
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  color: const Color(
                                                                      0xff808080)),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pushNamed(
                                                                  'read_blog_page',
                                                                  arguments: [
                                                                2,
                                                                blogProvider
                                                                        .allPopularBlogList[
                                                                    index]
                                                              ]);
                                                        },
                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10))),
                                                            backgroundColor:
                                                                MaterialStateProperty.all(
                                                                    const Color(
                                                                        (0xffDB1E37)))),
                                                        child: Text(
                                                          'Read more',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Color(
                                                                      0xffFFFFFF)),
                                                        ))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      })
                        ],
                      )
                    : Container(),
              ],
            ),
          )),
    );
  }
}
