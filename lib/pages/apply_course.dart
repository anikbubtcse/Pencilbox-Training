import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_design/helper/helper_method.dart';
import 'package:screen_design/models/course_model.dart';
import 'package:screen_design/provider/trainer_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';

class ApplyCoursePage extends StatefulWidget {
  const ApplyCoursePage({super.key});

  @override
  State<ApplyCoursePage> createState() => _ApplyCoursePageState();
}

class _ApplyCoursePageState extends State<ApplyCoursePage> {
  late CourseModel courseModel;
  late TrainerProvider trainerProvider;
  bool check = false;
  bool callOnce = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void didChangeDependencies() {
    courseModel = ModalRoute.of(context)!.settings.arguments as CourseModel;
    trainerProvider = Provider.of(context);
    print('courseModel.batchId: ${courseModel.batchId}');
    print('courseModel.trainingId: ${courseModel.trainingId}');

    if (callOnce) {
      trainerProvider.getTrainingSchedulesByBatchId(courseModel.batchId!);
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
          'Apply for this course',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${courseModel.trainingName!} - ' +
                      'Batch No : ${courseModel.currentBatchId}',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.circle,
                      size: 5,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Start Date : ${HelperMethod.getDateFormat('dd-MM-yyyy', DateTime.parse(courseModel.startDate!))}',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.circle,
                      size: 5,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Duration : ${courseModel.hours} hours',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.circle,
                      size: 5,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'No. of Classes : ${courseModel.classNo}',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.circle,
                      size: 5,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Registration Deadline : ${courseModel.lastDate}',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.circle,
                      size: 5,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Class Schedule : ',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                  ],
                ),
                ...trainerProvider.trainingSchedulesByBatchIdList.map((e) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.circle,
                        size: 5,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        '${e.trainingDay} ' +
                            '(${DateFormat('hh:mm a').format(DateTime.parse('${DateFormat('yyyy-MM-dd').format(DateTime.now())} ${e.startTime!}'))} - ${DateFormat('hh:mm a').format(DateTime.parse('${DateFormat('yyyy-MM-dd').format(DateTime.now())} ' + e.endTime!))})',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  );
                }),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Full Name",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff191D23))),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: fullNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Full Name is required';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            filled: true,
                            fillColor: Color(0xffFFFFFF),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red)),
                            hintText: "John Stewart",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff999999))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Email Address",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff191D23))),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is required';
                          } else if (!EmailValidator.validate(value)) {
                            return 'Please give us a valid email';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            filled: true,
                            fillColor: Color(0xffFFFFFF),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red)),
                            hintText: "anikbubtcse@gmail.com",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff999999))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Phone Number",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff191D23))),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phoneNumberController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Phone Number is required';
                          } else if (value.length != 11) {
                            return 'The phone number must be 11 digits';
                          } else if (!value
                              .contains(RegExp(r'^01[3-9][0-9]{8}$'))) {
                            return 'The phone number format is invalid';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            filled: true,
                            fillColor: Color(0xffFFFFFF),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red)),
                            hintText: "01752045464",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff999999))),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                activeColor: Colors.red,
                                value: check,
                                onChanged: (value) {
                                  setState(() {
                                    print(check);
                                    check = value!;
                                  });
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('I\'m not a robot'),
                          ],
                        ),
                        Image.asset(
                          'images/capcha.png',
                          height: 40,
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: check == false
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              completeRegistration();
                            }
                          },
                    child: Text(
                      'Apply Now',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  completeRegistration() async {
    EasyLoading.show();

    try {
      final response = await http.post(
          Uri.parse('https://pencilbox.edu.bd/api/course-registration'),
          body: {
            'email_address': emailController.text,
            'phone_number': phoneNumberController.text,
            'batch_id': courseModel.batchId.toString(),
            'training_id': courseModel.trainingId.toString(),
            'full_name': fullNameController.text,
            'only_course': '6'
          });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        if (data['304'] == null) {
          EasyLoading.dismiss();

          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  onConfirm: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacementNamed('checkout_page',
                        arguments: [courseModel, data['course_reg_id']]);
                  },
                  showCancelBtn: true,
                  cancelButtonText: 'Pay Later',
                  type: ArtSweetAlertType.success,
                  title: 'Congratulations',
                  text:
                      'Registration succesful for ' + courseModel.trainingName!,
                  confirmButtonText: 'Pay Online'));
        } else {
          EasyLoading.dismiss();
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.danger,
                  title: 'Opps..!',
                  text: data['304'],
                  confirmButtonText: 'Ok'));
        }
      } else {
        EasyLoading.dismiss();
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.danger,
                title: 'Opps..!',
                text: 'Something went wrong',
                confirmButtonText: 'Ok'));
      }
    } catch (e) {
      EasyLoading.dismiss();
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.danger,
              title: 'Opps..!',
              text: 'Something went wrong',
              confirmButtonText: 'Ok'));
    }
  }
}
