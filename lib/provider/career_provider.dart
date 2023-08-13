import 'package:flutter/cupertino.dart';
import 'package:screen_design/service/career_service.dart';

import '../models/career_model.dart';

class CareerProvider extends ChangeNotifier {
  List<Data> careerInfoData = [];

  getAllCareerInfo() async {
    careerInfoData.clear();
    dynamic data = await CareerService.getAllCareerInfo();
    if (data != null) {
      CareerModel careerModel = CareerModel.fromJson(data);

      careerModel.careers!.data!.forEach((element) {
        if (element.publicationStatus == 1) {
          careerInfoData.add(element);
        }
      });
      notifyListeners();
    } else {
      print('Something went wrong: Career');
    }
  }
}
