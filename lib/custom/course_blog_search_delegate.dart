import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/course_model.dart';
import '../provider/upcoming_course_provider.dart';

class CourseBlogSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListTile();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final provider = Provider.of<UpcomingCourseProvider>(context, listen: true);
    List<CourseModel> courseList = provider.fullCourseList;

    final suggestionList = query == null
        ? courseList
        : courseList.where((items) {
      return (items.trainingName.toString().toLowerCase() +
          items.batchId.toString().toLowerCase())
          .contains(query.toLowerCase());
    }).toList();

    return suggestionList.isEmpty
        ? const ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('No Data Found')],
      ),
    )
        : ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final course = suggestionList[index];
        return ListTile(
          onTap: () {
            close(context, course.batchId);
          },
          title: Text(suggestionList[index].trainingName!),
          subtitle: Text(suggestionList[index].batchName!),
        );
      },
    );
  }
}