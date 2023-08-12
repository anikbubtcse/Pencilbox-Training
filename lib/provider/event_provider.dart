import 'package:flutter/material.dart';
import 'package:screen_design/models/event_model.dart';
import 'package:screen_design/service/event_service.dart';

class EventProvider extends ChangeNotifier {
  late EventModel eventModel;
  List<EventCategory> eventCategoryList = [];
  List<Events> categoryWiseEventList = [];

  getEvents() async {
    final data = await EventService.getEventService();

    if (data != null) {
      eventModel = EventModel.fromJson(data);
    } else {
      print('Something went wrong');
    }

    eventModel.eventCategory!.forEach((element) {
      eventCategoryList.add(element);
    });

    for (int i = 0; i < eventCategoryList.length; i++) {
      if (eventCategoryList[i].catName == 'Mobile Application Development') {
        var temp = eventCategoryList[0];
        eventCategoryList[0] = eventCategoryList[i];
        eventCategoryList[i] = temp;
      }
    }
  }

  getCategoryWiseEvents(num id) {
    categoryWiseEventList.clear();
    eventModel.events!.forEach((element) {
      if (element.catId == id) {
        categoryWiseEventList.add(element);
      }
    });
    notifyListeners();
  }
}
