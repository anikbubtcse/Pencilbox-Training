import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:screen_design/models/event_model.dart';
import '../helper/helper_method.dart';
import '../provider/event_provider.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late EventProvider eventProvider;
  bool callOnce = true;
  int check = 0;

  @override
  void didChangeDependencies() {
    eventProvider = Provider.of(context, listen: true);

    if (callOnce) {
      eventProvider.getCategoryWiseEvents(19);
      callOnce = false;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'Event',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff212121)),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: eventProvider.eventCategoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              check = index;
                            });
                            eventProvider.getCategoryWiseEvents(
                                eventProvider.eventCategoryList[index].id!);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                border: Border.all(
                                    color: check == index
                                        ? Colors.red
                                        : Color(0xffDDDDDD))),
                            child: Text(
                              eventProvider.eventCategoryList[index].catName!,
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
              eventProvider.categoryWiseEventList.isEmpty
                  ? const Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Center(child: Text('No event found!')),
                      ],
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: eventProvider.categoryWiseEventList.length,
                      itemBuilder: (contex, index) {
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
                                        'https://pencilbox.edu.bd/${eventProvider.categoryWiseEventList[index].eventImage}',
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width / 2,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Image.asset('images/placeholder.png'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    eventProvider.categoryWiseEventList[index]
                                        .eventName!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff292929)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
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
                                                  DateTime.parse(eventProvider
                                                      .categoryWiseEventList[
                                                          index]
                                                      .eventDate!)),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      const Color(0xff808080)),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'images/timer.png',
                                              height: 13,
                                              width: 13,
                                              color: Color(0xff808080),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              '${eventProvider.categoryWiseEventList[index].startTime!} - ${eventProvider.categoryWiseEventList[index].endTime!}',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      const Color(0xff808080)),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'images/coin.png',
                                              height: 13,
                                              width: 13,
                                              color: Color(0xff808080),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              eventProvider
                                                          .categoryWiseEventList[
                                                              index]
                                                          .price!
                                                          .toString() ==
                                                      '0'
                                                  ? 'Free'
                                                  : eventProvider
                                                      .categoryWiseEventList[
                                                          index]
                                                      .price!,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      const Color(0xff808080)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                              'event_details_page',
                                              arguments: eventProvider.categoryWiseEventList[index]);
                                        },
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    const Color((0xffDB1E37)))),
                                        child: Text(
                                          'Read more',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xffFFFFFF)),
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
        ),
      ),
    );
  }
}
