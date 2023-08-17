import 'package:flutter/cupertino.dart';
import 'package:screen_design/models/district_model.dart';
import 'package:screen_design/models/sub_district_model.dart';
import 'package:screen_design/service/area_service.dart';

class AreaProvider extends ChangeNotifier {
  List<DistrictModel> allDistrictList = [];
  List<SubDistrictModel> allSubDistrictList = [];
  List<String> filteredDistrictList = [];
  List<String> filteredSubDistrictList = [];

  getAllDistrict() async {
    allDistrictList.clear();
    dynamic data = await AreaService.getAllDistrict();

    for (Map i in data) {
      allDistrictList.add(DistrictModel.fromJson(i));
    }
  }

  getAllSubDistrict() async {
    allSubDistrictList.clear();
    dynamic data = await AreaService.getAllSubDistrict();

    for (Map i in data) {
      allSubDistrictList.add(SubDistrictModel.fromJson(i));
    }
  }

  getAllDistrictByDivision(String division) async {
    filteredDistrictList.clear();

    allDistrictList.forEach((element) {
      if (element.divisionId == division) {
        filteredDistrictList.add(element.name!);
      }
    });

    print('filteredDistrictList.length: ${filteredDistrictList.length}');
  }

  getAllSubDistrictByDistrict(String subDistrict) async {
    filteredSubDistrictList.clear;
    allSubDistrictList.forEach((element) {
      if (element.districtId == subDistrict) {
        filteredSubDistrictList.add(element.name!);
      }
    });
  }
}
