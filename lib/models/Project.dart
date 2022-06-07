import 'package:flutter/material.dart';
import '../constants.dart';


class Project  {
  final String projectTitle;
  final int totalTask;
  final Color color;

  Project(
      {
        required this.projectTitle,
        required this.totalTask,
        required this.color,
        });

}

List<Project> projects = [
  Project(projectTitle: 'Project', totalTask: 10, color: kSecondaryColor),
  Project(projectTitle: 'Teamworks', totalTask: 5, color: kDarkPink),
  Project(projectTitle: 'Home', totalTask: 10, color: kLightGreen),
  Project(projectTitle: 'Meet', totalTask: 10, color: kDarkPurple),
];
