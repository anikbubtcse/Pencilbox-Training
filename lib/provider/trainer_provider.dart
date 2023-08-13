import 'package:flutter/cupertino.dart';
import 'package:screen_design/models/training_schedule_model.dart';
import 'package:screen_design/service/trainer_service.dart';

import '../models/trainer_model.dart';

class TrainerProvider extends ChangeNotifier {
  List<TrainerModel> trainerModelList = [];
  String? trainerImage;
  String? trainerName;
  String? CategoryDetailPageTrainerName;
  List<TrainingScheduleModel> trainingSchedulesByBatchIdList = [];
  List<TrainingScheduleModel> allTrainingSchedulesList = [];

  getTrainerServiceData() async {
    dynamic data = await TrainerService.getTrainerData();

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

  TrainerModel getTrainerInfoByTrainingId(int id) {
    TrainerModel trainerModel =
        trainerModelList.firstWhere((element) => element.id!.toInt() == id);
    return trainerModel;
  }

  Future<void> getAllTrainingSchedules() async {
    allTrainingSchedulesList.clear();
    dynamic data = await TrainerService.TrainingSchedulesService();

    if (data != null) {
      for (Map i in data) {
        allTrainingSchedulesList.add(TrainingScheduleModel.fromJson(i));
      }
      print('allTrainingSchedulesList${allTrainingSchedulesList.length}');
      notifyListeners();
    } else {
      print('Something went wrong');
    }
  }

  getTrainingSchedulesByBatchId(int batchId) {
    trainingSchedulesByBatchIdList.clear();

    allTrainingSchedulesList.forEach((element) {
      if (element.batchId == batchId) {
        trainingSchedulesByBatchIdList.add(element);
      }
    });
  }
}
