import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:aamarpay/aamarpay.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:http/http.dart' as http;
import 'package:screen_design/models/billing_detail_student_model.dart';
import 'package:screen_design/models/payment_model.dart';

class AamarPayPage extends StatefulWidget {
  const AamarPayPage({super.key});

  @override
  State<AamarPayPage> createState() => _AamarPayPageState();
}

class _AamarPayPageState extends State<AamarPayPage> {
  late BillingDetailsStudentModel billingDetailsStudentModel;
  bool isLoading = false;
  String transactionID = '${DateTime.now().millisecondsSinceEpoch}';

  @override
  void didChangeDependencies() {
    billingDetailsStudentModel = ModalRoute.of(context)!.settings.arguments
        as BillingDetailsStudentModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Aamarpay(
          // This will return a payment url based on failUrl,cancelUrl,successUrl
          returnUrl: (String url) {
            print(url);
          },
          // This will return the payment loading status
          isLoading: (bool loading) {
            setState(() {
              isLoading = loading;
            });
          },
          // This will return the payment event with a message
          status: (EventState event, String message) {
            if (event == EventState.error) {
              setState(() {
                isLoading = false;
              });
              ArtSweetAlert.show(
                  context: context,
                  artDialogArgs: ArtDialogArgs(
                    type: ArtSweetAlertType.danger,
                    title: 'Sorry',
                    text: 'Transaction is Failed..Try again later',
                  ));
            } else if (event == EventState.success) {
              setState(() {
                isLoading = false;
              });
              getPaymentDetails();
            }
          },
          isSandBox: false,
          successUrl: 'https://pencilbox.edu.bd/payment/confirm',
          failUrl: 'https://pencilbox.edu.bd/payment/fail',
          cancelUrl: 'https://pencilbox.edu.bd/payment/cancel',
          storeID: "pencilbox",
          transactionAmount: billingDetailsStudentModel.amount,
          transactionID: transactionID,
          description: "test",
          signature: 'afa63456363176d698fd44c83f8a6960',
          customerName: billingDetailsStudentModel.name,
          customerEmail: billingDetailsStudentModel.email,
          customerMobile: billingDetailsStudentModel.phone,
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  color: Colors.orange,
                  height: 50,
                  child: const Center(
                    child: Text(
                      "Payment",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> getPaymentDetails() async {
    try {
      final response = await http.post(
          Uri.parse('https://secure.aamarpay.com/api/v1/trxcheck/request.php'),
          body: {
            'store_id': 'pencilbox',
            'request_id': transactionID,
            'signature_key': 'afa63456363176d698fd44c83f8a6960',
            'type': 'json',
          });

      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body.toString());
        PaymentModel paymentModel = PaymentModel.fromJson(data);
        sendPaymentToDatabase(paymentModel);

        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
                confirmButtonText: 'Go back',
                onConfirm: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('home_page');
                },
                type: ArtSweetAlertType.success,
                title: 'Congratulations',
                text: 'Your payment has been successful'));
      } else {
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.danger,
              title: 'Sorry',
              text: 'Transaction is Failed..Try again later',
            ));
      }
    } catch (e) {
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: 'Sorry',
            text: 'Transaction is Failed..Try again later',
          ));
    }
  }

  Future<void> sendPaymentToDatabase(PaymentModel paymentModel) async {
    try {
      final response = await http
          .post(Uri.parse('https://pencilbox.edu.bd/api/payment/app'), body: {
        'cus_email': paymentModel.cusEmail,
        'cus_phone': paymentModel.cusPhone,
        'cus_country': paymentModel.cusCountry,
        'cus_state': paymentModel.cusState,
        'cus_city': paymentModel.cusCity,
        'cus_add1': paymentModel.cusAdd1,
        'cus_postcode': paymentModel.cusPostcode,
        'cus_name': paymentModel.cusName,
        'opt_b': billingDetailsStudentModel.batchId,
        'opt_c': billingDetailsStudentModel.courseId, //problem
        'amount': paymentModel.amount,
        'pay_status': paymentModel.payStatus,
        'pg_txnid': paymentModel.pgTxnid,
        'mer_txnid': paymentModel.merTxnid,
        'ip_address': paymentModel.ip,
        'card_number': paymentModel.cardnumber,
        'pay_time': paymentModel.dateProcessed,
        'card_type': paymentModel.binCardtype,
        'opt_a': billingDetailsStudentModel.courseName,
        'card_holder': paymentModel.cardnumber,
        'bank_txn': paymentModel.bankTrxid,
        'request_id': transactionID,
        'store_id': 'pencilbox',
        'status': paymentModel.payStatus
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
      } else {
        print('Failed........');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
