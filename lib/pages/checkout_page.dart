import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:screen_design/helper/helper_constant.dart';
import 'package:provider/provider.dart';
import 'package:screen_design/models/billing_detail_student_model.dart';
import 'package:screen_design/models/course_model.dart';
import 'package:screen_design/provider/area_provider.dart';
import 'package:flutter_bkash/flutter_bkash.dart';
import 'dart:developer' as dev;
import '../custom/bkash_style.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController partialPaymentController = TextEditingController();
  dynamic selectDivision;
  dynamic selectDistrict;
  dynamic selectSubDistrict;
  bool showDistrictDropdown = false;
  bool showSubDistrictDropdown = false;
  bool showPartialPaymentInfo = false;
  int partialAmount = 0;
  late CourseModel courseModel;
  late int courseRegId;
  String paymentMethod='online';
  double charge=3;
  String chargeText='Online Charge';
  late double finalTotal;


  @override
  void didChangeDependencies() {
    final arguments = ModalRoute.of(context)!.settings.arguments as List;
     courseModel = arguments[0];
     courseRegId = arguments[1];


    //testing
    // courseModel = CourseModel(trainingName: 'Flutter', trainingPrice: 1000, trainerId: 121);
    // courseRegId = 11222;
    // finalTotal=getFinalTotal(courseModel.trainingPrice!,3.0);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'Checkout',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Billing Details',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.8)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is Required';
                    } else {
                      return null;
                    }
                  },
                  autocorrect: true,
                  decoration: const InputDecoration(
                    hintText: 'Full Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black54, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: phoneNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is Required';
                    } else {
                      return null;
                    }
                  },
                  autocorrect: true,
                  decoration: const InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black54, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Give your Email';
                    } else if (!EmailValidator.validate(value)) {
                      return 'Please give us a valid email';
                    } else {
                      return null;
                    }
                  },
                  autocorrect: true,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black54, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Consumer<AreaProvider>(
                  builder: (context, provider, child) =>
                      DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Select division';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    items: HelperConstant.DIVISION.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (value) {
                      provider.getAllDistrictByDivision(value.toString());
                      setState(() {
                        selectDistrict = null;
                        selectSubDistrict = null;
                        showDistrictDropdown = true;
                        selectDivision = value;
                      });
                    },
                    value: selectDivision,
                    hint: Text('Select Division'),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                showDistrictDropdown == false
                    ? Container()
                    : Consumer<AreaProvider>(
                        builder: (context, provider, child) =>
                            DropdownButtonFormField(
                          validator: (value) {
                            if (value == null) {
                              return 'Select district';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                          items: provider.filteredDistrictList.map((e) {
                            return DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            );
                          }).toList(),
                          onChanged: (value) {
                            provider
                                .getAllSubDistrictByDistrict(value.toString());
                            setState(() {
                              selectSubDistrict = null;
                              showSubDistrictDropdown = true;
                              selectDistrict = value;
                            });
                          },
                          value: selectDistrict,
                          hint: const Text('Select District'),
                        ),
                      ),
                const SizedBox(
                  height: 6,
                ),
                showSubDistrictDropdown == false
                    ? Container()
                    : Consumer<AreaProvider>(
                        builder: (context, provider, child) =>
                            DropdownButtonFormField(
                          validator: (value) {
                            if (value == null) {
                              return 'Select subdistrict';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                          items: provider.filteredSubDistrictList.map((e) {
                            return DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectSubDistrict = value;
                            });
                          },
                          value: selectSubDistrict,
                          hint: Text('Select Sub District'),
                        ),
                      ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: cityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'City is Required';
                    } else {
                      return null;
                    }
                  },
                  autocorrect: true,
                  decoration: const InputDecoration(
                    hintText: 'City Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black54, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address is Required';
                    } else {
                      return null;
                    }
                  },
                  autocorrect: true,
                  decoration: const InputDecoration(
                    hintText: 'Address Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black54, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: postCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Post code is Required';
                    } else {
                      return null;
                    }
                  },
                  autocorrect: true,
                  decoration: const InputDecoration(
                    hintText: 'Post Code',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black54, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.orangeAccent, width: 2)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'YOUR ORDER',
                          style: TextStyle(fontSize: 24),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Product'),
                            Text('Subtotal'),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text(courseModel.trainingName!)),
                            Expanded(
                                child: Text(
                              '৳ ${courseModel.trainingPrice}',
                              textAlign: TextAlign.end,
                            ))
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text('${chargeText}')),
                            Expanded(
                                child: Text(
                                  '${charge}%',
                                  textAlign: TextAlign.end,
                                ))
                          ],
                        ),

                        const SizedBox(
                          height: 5,
                        ),
                        if (showPartialPaymentInfo)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(child: Text('Partial payment ')),
                              Expanded(
                                  child: Text(
                                '৳ ${partialAmount}',
                                textAlign: TextAlign.end,
                              ))
                            ],
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        if (showPartialPaymentInfo)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text('Remaining payment ')),
                              Expanded(
                                  child: Text(
                                '৳ ${courseModel.trainingPrice! - partialAmount}',
                                textAlign: TextAlign.end,
                              ))
                            ],
                          ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'TOTAL',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '৳ ${finalTotal}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              paymentMethod='online';
                              finalTotal= getFinalTotal(courseModel.trainingPrice!, 3);
                              charge=3;
                            });
                            print('paymentMethod ${paymentMethod}');
                          },
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all()),
                                child: Icon(
                                  paymentMethod=='online'
                                      ? Icons.circle
                                      : Icons.circle_outlined,
                                  size: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('Online Payment'),
                              // InkWell(
                              //   child: const Padding(
                              //     padding: EdgeInsets.all(8.0),
                              //     child: Text('/ Partial Payment'),
                              //   ),
                              //   onTap: () {
                              //     {
                              //       showDialog(
                              //           context: context,
                              //           builder: (context) => AlertDialog(
                              //                 title: Text('Partial Payment'),
                              //                 content: Column(
                              //                   mainAxisSize: MainAxisSize.min,
                              //                   children: [
                              //                     const Text(
                              //                         'How much amount you want to pay?'),
                              //                     TextField(
                              //                       keyboardType:
                              //                           TextInputType.number,
                              //                       controller:
                              //                           partialPaymentController,
                              //                       decoration: InputDecoration(),
                              //                     )
                              //                   ],
                              //                 ),
                              //                 actions: [
                              //                   ElevatedButton(
                              //                       onPressed: () {
                              //                         setState(() {
                              //                           showPartialPaymentInfo =
                              //                               true;
                              //                           partialAmount = int.parse(
                              //                               partialPaymentController
                              //                                   .text);
                              //                           partialPaymentController
                              //                               .clear();
                              //                         });
                              //                         Navigator.pop(context);
                              //                       },
                              //                       child: Text('Ok')),
                              //                 ],
                              //               ));
                              //     }
                              //   },
                              // )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              paymentMethod='bkash';
                              finalTotal= getFinalTotal(courseModel.trainingPrice!, 1.5);
                              charge=1.5;
                            });
                            print('paymentMethod ${paymentMethod}');
                          },
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all()),
                                child: Icon(
                                  paymentMethod=='bkash'
                                      ? Icons.circle
                                      : Icons.circle_outlined,
                                  size: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('Bkash Payment'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Text(
                            'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our privacy policy.'),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orangeAccent),
                            onPressed: () async {

                              ////live

                              // final flutterBkash = FlutterBkash(
                              //   bkashCredentials: BkashCredentials(
                              //       username: '01313363836',
                              //       password: 'mK1Y-#h7>T%',
                              //       appKey: 'QXQRLiHi7ekxPThXuDju7i0rtc',
                              //       appSecret: 'wPFqjEQFkqpEJFY6oEWYD7rCDM26cEaQ9xrcgm0eEUwSGiUMxGk5',
                              //       isSandbox: false
                              //   ));

                              // final flutterBkash = FlutterBkash();
                              //
                              // final result = await flutterBkash.pay(
                              //   context: context, // BuildContext context
                              //   amount: 1.0, // amount as double
                              //   merchantInvoiceNumber: "invoice123",
                              // );
                              //
                              // print('RETURN RESULT ${result.toString()}');


                              if (formKey.currentState!.validate()) {
                                final billingDetails = BillingDetailsStudentModel(
                                        email: emailController.text,
                                        phone: phoneNumberController.text,
                                        country: 'Bangladesh',
                                        state: selectDistrict,
                                        city: selectSubDistrict,
                                        address1: addressController.text,
                                        postCode: postCodeController.text,
                                        name: nameController.text,
                                        batchId: courseModel.batchId.toString(),
                                        courseId: courseRegId.toString(),
                                        amount:finalTotal.toString(),
                                        courseName: courseModel.trainingName!);

                                Navigator.of(context).pushReplacementNamed(
                                    'aamar_pay_page',
                                    arguments: billingDetails);
                              }








                            },
                            child: const Text(
                              'Place Order',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  double getFinalTotal(int trainingPrice, double rate) {

    return trainingPrice+((trainingPrice*rate)/100);
  }
}
