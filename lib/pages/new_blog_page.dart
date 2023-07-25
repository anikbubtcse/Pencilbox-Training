import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewBlogPage extends StatefulWidget {
  const NewBlogPage({super.key});

  @override
  State<NewBlogPage> createState() => _NewBlogPageState();
}

class _NewBlogPageState extends State<NewBlogPage> {
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
                  child: Container(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
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
                                BorderSide(color: Colors.red, width: 1)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
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
                    Row(
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
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                border: Border.all(color: Color(0xffDDDDDD))),
                            child: Text(
                              'Education',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff262626)),
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (contex, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(19),
                                    child: Image.asset(
                                      'images/blog_image.jpg',
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Positioned(
                                    top: 5,
                                    right: 5,
                                    child: CircleAvatar(
                                      radius: 15,
                                      child: Icon(
                                        Icons.favorite_border_outlined,
                                        color: Color(0xff000000),
                                      ),
                                      backgroundColor: Color(0xffAFAFAF),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'F-Commerce in Bangladesh',
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff292929)),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Saddam Hossain',
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            '17-11-2022',
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                color: Color(0xff808080)),
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
                                            'Technology',
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                color: Color(0xff808080)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color((0xffDB1E37)))),
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
                    })
              ],
            ),
          )),
    );
  }
}
