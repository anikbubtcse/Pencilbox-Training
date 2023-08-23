import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_design/provider/course_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> favoriteList = [];
  late CourseProvider courseProvider;

  Future<void> addToFavorite() async {
    final SharedPreferences favoritePrefs =
        await SharedPreferences.getInstance();
    favoriteList = favoritePrefs.getStringList('items') ?? [];
    favoriteList.forEach((element) {
      print('Course Id: ${element.toString()}');
    });
    print('favoriteList.length: ${favoriteList.length}');
  }

  @override
  void initState() {
    addToFavorite().then((value) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    courseProvider = Provider.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'Favorite',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: favoriteList.isEmpty
                ? const Center(child: Text('Nothing found!'))
                : ListView.builder(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    itemCount: courseProvider.fullCourseList.length,
                    itemBuilder: (context, index) {
                      final course = courseProvider.fullCourseList[index];

                      if (favoriteList.contains(course.id.toString())) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(19),
                                    child: Image.network(
                                      'https://pencilbox.edu.bd/${course.trainingImage}' ??
                                          '',
                                      height:
                                          MediaQuery.of(context).size.width / 3,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  course.trainingName!,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff292929),
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {

                                                      Navigator.of(context).pushNamed('course_module_page', arguments: course);

                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      backgroundColor: DateTime
                                                                  .parse(course
                                                                      .startDate!)
                                                              .isAfter(DateTime
                                                                  .now())
                                                          ? Color(0xffDB1E37)
                                                          : Colors.grey,
                                                    ),
                                                    child: Text(
                                                      DateTime.parse(course
                                                                  .startDate!)
                                                              .isAfter(DateTime
                                                                  .now())
                                                          ? 'Buy'
                                                          : "Details",
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color(
                                                              0xffFFFFFF)),
                                                    )),
                                                Text(
                                                  '${course.trainingPrice}/-BDT',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xffDB1E37)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          top: -15,
                                          right: -10,
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.favorite,
                                                color: Color(
                                                  0xffDB1E37,
                                                ),
                                                size: 13,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
          ),
        ],
      ),
    );
  }
}
