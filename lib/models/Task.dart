import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/models/Project.dart';
import 'User.dart';

class Task extends Project {
  final String taskTitle, taskSubtitle;
  String date;
  bool value;
  String assignee, description, assigneeAva;
  List<User>? members;

  Task({
    required this.taskTitle,
    required this.taskSubtitle,
    this.assignee = '',
    this.date = '',
    this.description = '',
    this.value = false,
    this.assigneeAva = 'assets/images/user.png',
    this.members,
    projectTitle = '',
    totalTask = 1,
    color = kPrimaryColor
  }) : super(projectTitle: projectTitle, totalTask: totalTask, color: color);

  List<Task> getDayTaskList() {
    return taskList;
  }

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    taskList.forEach((element) {matches.add(element.taskTitle);});

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

List<Task> taskList = [
  Task(
      taskTitle: 'Go fishing with Stephen',
      taskSubtitle: '9:00am',
      date: DateTime.now().toString(),
      assignee: users[2].name,
      assigneeAva: users[2].avatar,
      description: 'Go fishing with Stephen',
      projectTitle: projects[1].projectTitle,
      members: users
  ),
  Task(
      taskTitle: 'Meet according with design team at Central Park',
      taskSubtitle: '9:00am',
      date: DateTime.now().toString(),
      assignee: users[1].name,
      assigneeAva: users[1].avatar,
      description: 'Discuss about new project with X company',
      projectTitle: projects[3].projectTitle,
      members: users2
  ),
  Task(
      taskTitle: 'Sailing with Stephen',
      taskSubtitle: '9:00am',
      date: DateTime.now().toString(),
      assignee: users[2].name,
      assigneeAva: users[2].avatar,
      description: 'Go fishing with Stephen',
      projectTitle: projects[2].projectTitle,
      members: users2
  ),
];

List<Task> monthTaskList = [
  Task(
      taskTitle: 'Go fishing with Irene',
      taskSubtitle: '9:00am',
      date: DateTime.now().toString(),
      assignee: users[2].name,
      assigneeAva: users[2].avatar,
      description: 'Go fishing with Irene',
      projectTitle: projects[1].projectTitle,
      members: users
  ),
  Task(
      taskTitle: 'Play golf with Wendy',
      taskSubtitle: '9:00am',
      date: DateTime.now().toString(),
      assignee: users[1].name,
      assigneeAva: users[1].avatar,
      description: 'Play golf with Wendy',
      projectTitle: projects[3].projectTitle,
      members: users2
  ),
  Task(
      taskTitle: 'Get supply at Walmart',
      taskSubtitle: '9:00am',
      date: DateTime.now().toString(),
      assignee: users[1].name,
      assigneeAva: users[1].avatar,
      description: 'Get supply at Walmart',
      projectTitle: projects[3].projectTitle,
      members: users2
  ),
];

List<Map<Project, List<Task>>> projectWithTask = [
  {
    projects[0] : taskList,
  }
];

// Events for days
final kTasks = LinkedHashMap<DateTime, List<Task>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kTaskSource);

final _kTaskSource = Map.fromIterable(List.generate(taskList.length, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Task(taskTitle: "Hi", taskSubtitle: "Eiii")))
  ..addAll({
    kToday: [
      Task(taskTitle: "Hi", taskSubtitle: "Ho"),
      Task(taskTitle: "Hi", taskSubtitle: "Ho"),
      Task(taskTitle: "Hi", taskSubtitle: "Ho"),
      Task(taskTitle: "Hi", taskSubtitle: "Ho"),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}
final kToday = DateTime.now();
// for Task task : taskList {
//    if (DateTime.parse(task.date) == )};
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);



