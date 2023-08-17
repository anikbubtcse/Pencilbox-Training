import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_design/helper/helper_method.dart';
import 'package:screen_design/models/student_info_model.dart';
import 'package:screen_design/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late UserProvider userProvider;

  @override
  void didChangeDependencies() {
    userProvider = Provider.of(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff2E5A88),
        centerTitle: true,
        title: Text(
          'Your Enrolled Courses',
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: userProvider.billingList.length,
          itemBuilder: (context, index) {
            var training = userProvider
                .billingList[index].courseRegStudents!.batch!.training;
            String courseStatus = '';

            if (DateTime.parse(userProvider.billingList[index]
                        .courseRegStudents!.batch!.startDate!)
                    .isBefore(DateTime.now()) &&
                DateTime.parse(userProvider
                        .billingList[index].courseRegStudents!.batch!.endDate!)
                    .isAfter(DateTime.now())) {
              courseStatus = 'Running';
            } else if (DateTime.parse(userProvider
                    .billingList[index].courseRegStudents!.batch!.endDate!)
                .isBefore(DateTime.now())) {
              courseStatus = 'End';
            } else if (DateTime.parse(userProvider
                    .billingList[index].courseRegStudents!.batch!.startDate!)
                .isAfter(DateTime.now())) {
              courseStatus = 'Upcoming';
            }

            return ExpansionTileCard(
              title: FittedBox(
                  child: Text(training!.trainingName!,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black))),
              subtitle: RichText(
                text: TextSpan(
                  text: 'Course Status: ',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  children: [
                    TextSpan(
                        text: courseStatus,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.purple)),
                  ],
                ),
              ),
              children: [
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Basic Info:',
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        'Training Name: ${training.trainingName!}',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        maxLines: 2,
                      ),
                      Text(
                        'Batch No: ${userProvider.billingList[index].courseRegStudents!.batch!.currentBatchId}',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Text(
                        'Start Date: ${HelperMethod.getDateFormat('dd-MM-yyyy', DateTime.parse(userProvider.billingList[index].courseRegStudents!.batch!.startDate!))}',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Text(
                        'End Date: ${HelperMethod.getDateFormat('dd-MM-yyyy', DateTime.parse(userProvider.billingList[index].courseRegStudents!.batch!.endDate!))}',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                paymentHistoryButton(index, context);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.purple)),
                              child: Text('History',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white))),
                          ElevatedButton(
                              onPressed: () {
                                paymentInfoButton(index, context);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.purple)),
                              child: Text('Payment Info',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white))),
                          ElevatedButton(
                              onPressed: () {
                                reviewButton(context, training, index);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.purple)),
                              child: Text('Review',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white))),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }

  void reviewButton(BuildContext context, Training training, int index) {
    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
          dialogAlignment: Alignment.topLeft,
          customColumns: [
            Container(
                height: 70,
                child: Image.asset(
                  'images/pencilbox_logo.png',
                  fit: BoxFit.contain,
                )),
            Text(
              'Rate this course: ',
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Align(
              alignment: Alignment.center,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBar.builder(
                    initialRating: 5,
                    itemSize: 26,
                    minRating: 2,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print('Ratrating: ${rating}');
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Color(0xFF000052),
                          width: 1,
                        )),
                    labelText: 'Share your experience...'),
              ),
            )
          ],
          confirmButtonText: 'Close',
          onConfirm: () {
            Navigator.of(context).pop();
          }),
    );
  }

  void paymentInfoButton(int index, BuildContext context) {
    num totalPaidAmount = 0;
    List<Payment> paymentList = userProvider.billingList[index].payment!;

    paymentList.forEach((element) {
      totalPaidAmount = totalPaidAmount + num.parse(element.amount!);
    });

    num? totalDueAmount = userProvider
            .billingList[index].courseRegStudents!.batch!.trainingPrice! -
        userProvider.billingList[index].discountAmount! -
        totalPaidAmount;

    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
          dialogAlignment: Alignment.topLeft,
          customColumns: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: Table(
                border: TableBorder.all(width: 1.0, color: Colors.black),
                children: [
                  TableRow(children: [
                    Center(
                        child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "Course Fee",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff000000)),
                        maxLines: 2,
                      ),
                    )),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "Given",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff000000)),
                        maxLines: 2,
                      ),
                    )),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: FittedBox(
                        child: Text(
                          "Discount",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff000000)),
                          maxLines: 2,
                        ),
                      ),
                    )),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "Due Amount",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff000000)),
                        maxLines: 2,
                      ),
                    )),
                  ]),
                  TableRow(children: [
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: FittedBox(
                        child: Text(
                          userProvider.billingList[index].courseRegStudents!
                              .batch!.trainingPrice
                              .toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff000000)),
                        ),
                      ),
                    )),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        totalPaidAmount.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff000000)),
                      ),
                    )),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        userProvider.billingList[index].discountAmount!
                            .toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff000000)),
                      ),
                    )),
                    Center(
                      child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text((totalDueAmount.toString()),
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff000000)))),
                    )
                  ])
                ],
              ),
            ),
          ],
          confirmButtonText: 'Close',
          onConfirm: () {
            Navigator.of(context).pop();
          }),
    );
  }

  void paymentHistoryButton(int index, BuildContext context) {
    List<Payment> paymentList = userProvider.billingList[index].payment!;

    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
          dialogAlignment: Alignment.topLeft,
          customColumns: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(width: 1, color: Colors.black),
                children: [
                  TableRow(children: [
                    Center(
                        child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: FittedBox(
                        child: Text(
                          "Date",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff000000)),
                        ),
                      ),
                    )),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: FittedBox(
                        child: Text(
                          "Amount",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff000000)),
                        ),
                      ),
                    )),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: FittedBox(
                        child: Text(
                          "Method",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff000000)),
                        ),
                      ),
                    )),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: FittedBox(
                        child: Text(
                          "Discount",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff000000)),
                        ),
                      ),
                    )),
                  ]),
                  ...paymentList.map((data) {
                    return TableRow(children: [
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: FittedBox(
                          child: Text(
                            HelperMethod.getDateFormat(
                                'dd-MM-yy', DateTime.parse(data.createdAt!)),
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff000000)),
                          ),
                        ),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          data.amount.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff000000)),
                        ),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          userProvider.billingList[index].paymentNote!,
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff000000)),
                        ),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          userProvider.billingList[index].discountAmount!
                              .toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff000000)),
                        ),
                      )),
                    ]);
                  }).toList(),
                ],
              ),
            )
          ],
          onConfirm: () {
            Navigator.of(context).pop();
          },
          confirmButtonText: 'Close'),
    );
  }
}
