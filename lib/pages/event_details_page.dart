import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/event_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventDetailsPage extends StatefulWidget {
  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  late Events eventDetails;
  final List<BatchTrainer> selectedEventTrainerList = [];
  bool callOnce = true;

  @override
  void didChangeDependencies() {
    eventDetails = ModalRoute.of(context)!.settings.arguments as Events;
    if (callOnce == true) {
      findTheTrainers(eventDetails);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 160,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://pencilbox.edu.bd/frontend/assets/img/slider/event-bg-2.jpg'),
                          fit: BoxFit.fitHeight)),
                  alignment: Alignment.center,
                ),
                Container(
                  color: Colors.grey.withOpacity(.5),
                  height: 160,
                ),
                Center(
                  child: Text(
                    'Events',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            EventsItem(eventDetails),
          ],
        ),
      ),
    );
  }

  Container EventsItem(Events eventDetails) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    DateFormat('dd-MMM-yyyy').format(DateTime.parse(
                      eventDetails.eventDate!,
                    )),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.system_security_update_good_rounded),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat('EEEE').format(
                      DateTime.parse(
                        eventDetails.eventDate!,
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.update),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${eventDetails.startTime!}-${eventDetails.endTime!}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              SizedBox(
                width: 2,
              ),
              Icon(Icons.money_sharp),
              SizedBox(
                width: 5,
              ),
              Text(
                eventDetails.price == '0' ? 'Free' : eventDetails.price!,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            eventDetails.eventName!,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Image.network('https://pencilbox.edu.bd/${eventDetails.eventImage}'),
          Html(
            data: eventDetails.eventLongDesc!,
            style: {
              "body": Style(
                fontSize: FontSize(14),
                fontWeight: FontWeight.w400,
              ),
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Speakers For This Event',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          ...selectedEventTrainerList
              .map((trainer) => Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xffFDAC1F), width: 5)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                    width: 2, color: Color(0xffFDAC1F)),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      'https://pencilbox.edu.bd/' +
                                          trainer.trainer!.trainerImage!),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Trainer',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10.0, right: 10),
                                child: Text(
                                  trainer.trainer!.trainerName!.toUpperCase(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: SvgPicture.asset(
                                    'images/facebook.svg',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: SvgPicture.asset(
                                    'images/instagram.svg',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: SvgPicture.asset(
                                    'images/twitter.svg',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: SvgPicture.asset(
                                    'images/linkedin.svg',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    'images/mail.png',
                                    height: 20,
                                    width: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            color: Color(0xffE6E6E6),
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Contact Info'.toUpperCase(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.phone_android,
                                        size: 22,
                                      ),
                                      Text(
                                        '+880 ' +
                                            trainer.trainer!.trainerPhone!
                                                .toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.call,
                                        size: 22,
                                      ),
                                      Text(
                                        ' +088 02 4010090',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.mail,
                                        size: 22,
                                      ),
                                      Text(
                                        ' ' + trainer.trainer!.trainerEmail!,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ))
              .toList()
        ],
      ),
    );
  }

  void findTheTrainers(Events eventDetails) {
    eventDetails.batchTrainer!.forEach((element) {
      selectedEventTrainerList.add(element);
    });

    print('selectedEventTrainerList ${selectedEventTrainerList.length}');
  }
}
