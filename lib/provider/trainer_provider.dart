import 'package:flutter/cupertino.dart';
import 'package:screen_design/service/trainer_service.dart';

import '../models/trainer_model.dart';

class TrainerProvider extends ChangeNotifier {
  List<TrainerModel> trainerModelList = [];
  final service = TrainerService();
  String? trainerImage;
  String? trainerName;
  String? CategoryDetailPageTrainerName;

  getTrainerServiceData() async {
    dynamic data = await service.getTrainerData();

    for (Map i in data) {
      trainerModelList.add(TrainerModel.fromJson(i));
    }
    notifyListeners();
  }

  getTrainerDetails(int trainerId) {
    trainerModelList.forEach((element) {
      if (element.id == trainerId) {
        trainerImage = element.trainerImage;
        trainerName = element.trainerName;
      }
    });
  }

  getTrainerName(int id) {
    trainerModelList.forEach((element) {
      if (element.id == id) {
        CategoryDetailPageTrainerName = element.trainerName;
      }
    });
  }

  String getMyCourseTrainerName(int trainingId) {
    String trainerName = '';

    trainerModelList.forEach((element) {
      if (element.id == trainingId) {
        trainerName = element.trainerName!;
      }
    });
    return trainerName;
  }
}
