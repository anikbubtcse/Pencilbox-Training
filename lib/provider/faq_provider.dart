import 'package:flutter/cupertino.dart';
import 'package:screen_design/models/faq_model.dart';
import 'package:screen_design/service/faq_service.dart';

class FaqProvider extends ChangeNotifier {
  List<Faqs> faqsList = [];

  Future<void> getFaqService() async {
    dynamic data = await FaqService.getAllFaqs();

    if (data != null) {
      FaqModel faqModel = FaqModel.fromJson(data);
      faqModel.faqs!.forEach((element) {
        faqsList.add(element);
      });
    } else {
      print('Something went wrong');
    }
  }
}
