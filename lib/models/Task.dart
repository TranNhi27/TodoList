import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/models/Project.dart';
import 'User.dart';

final String tableTasks = 'tasks';

class TaskFields {
  static final List<String> values = [
    id, taskTitle, hour, date, value, description
  ];
  static final String id = '_id';
  static final String taskTitle = 'taskTitle';
  static final String hour = 'hour';
  static final String date = 'date';
  static final String value = 'value';
  static final String description = 'description';
  // static final String id = '_id';

}
class Task extends Project {
  final int? id;
  final String taskTitle;
  String hour;
  String date;
  bool value;
  String assignee, description, assigneeAva;
  List<User>? members;

  Task({
    this.id,
    required this.taskTitle,
    this.hour = '',
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

  Task copy({
    int? id,
    String? taskTitle,
    String? hour,
    String? date,
    bool? value,
    String? description
}) => Task(
      id: id ?? this.id,
      taskTitle: taskTitle ?? this.taskTitle,
      hour: hour ?? this.hour,
      date: date ?? this.date,
      value: value ?? this.value,
      description: description ?? this.description
  );

  List<Task> getDayTaskList() {
    return taskList;
  }

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    taskList.forEach((element) {matches.add(element.taskTitle);});

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
  Map<String, Object?> toJson() => {
    TaskFields.id: id,
    TaskFields.taskTitle: taskTitle,
    TaskFields.description: description,
    TaskFields.value: value ? 1 : 0,
    TaskFields.date: date,
    TaskFields.hour: hour
  };

  static Task fromJson(Map<String, Object?> json) => Task(
    id: json[TaskFields.id] as int?,
    taskTitle: json[TaskFields.taskTitle] as String,
    description: json[TaskFields.description] as String,
    date: json[TaskFields.date] as String,
    hour: json[TaskFields.hour] as String,
    value: json[TaskFields.value] == 1,
  );
}



List<Task> taskList = [
  Task(
      taskTitle: 'Go fishing with Stephen',
      hour: '9:00am',
      date: DateTime.now().toString(),
      assignee: users[2].name,
      assigneeAva: users[2].avatar,
      description: 'Go fishing with Stephen',
      projectTitle: projects[1].projectTitle,
      members: users
  ),
  Task(
      taskTitle: 'Meet according with design team at Central Park',
      hour: '9:00am',
      date: DateTime.now().toString(),
      assignee: users[1].name,
      assigneeAva: users[1].avatar,
      description: 'Discuss about new project with X company',
      projectTitle: projects[3].projectTitle,
      members: users2
  ),
  Task(
      taskTitle: 'Sailing with Stephen',
      hour: '9:00am',
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
      hour: '9:00am',
      date: "2022-06-18",
      assignee: users[2].name,
      assigneeAva: users[2].avatar,
      description: 'Go fishing with Irene',
      projectTitle: projects[1].projectTitle,
      members: users
  ),
  Task(
      taskTitle: 'Play golf with Wendy',
      hour: '9:00am',
      date: "2022-06-13",
      assignee: users[1].name,
      assigneeAva: users[1].avatar,
      description: 'Play golf with Wendy',
      projectTitle: projects[3].projectTitle,
      members: users2
  ),
  Task(
      taskTitle: 'Get supply at Walmart',
      hour: '9:00am',
      date: "2022-06-14",
      assignee: users[1].name,
      assigneeAva: users[1].avatar,
      description: 'Get supply at Walmart',
      projectTitle: projects[3].projectTitle,
      members: users2
  ),
  Task(
      taskTitle: 'at Walmart',
      hour: '9:00am',
      date: "2022-06-14",
      assignee: users[1].name,
      assigneeAva: users[1].avatar,
      description: 'Get supply at Walmart',
      projectTitle: projects[3].projectTitle,
      members: users2
  ),
  Task(
      taskTitle: 'Get supply',
      hour: '',
      date: "2022-06-14",
      assignee: users[1].name,
      assigneeAva: users[1].avatar,
      description: 'Get supply at Walmart',
      projectTitle: projects[3].projectTitle,
      members: users2
  ),
  Task(
      taskTitle: 'Go fishing with Irene',
      hour: '9:00am',
      date: "2022-06-13",
      assignee: users[2].name,
      assigneeAva: users[2].avatar,
      description: 'Go fishing with Irene',
      projectTitle: projects[1].projectTitle,
      members: users
  ),
];

List<Map<Project, List<Task>>> projectWithTask = [
  {
    projects[0] : taskList,
  }
];

// Events for days
var kTasks = LinkedHashMap<DateTime, List<Task>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kTaskSource);
//DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5)
//item % 4 + 1
//Task(taskTitle: monthTaskList[index].taskTitle, taskSubtitle: monthTaskList[index].taskSubtitle)
var _kTaskSource = Map.fromIterable(List.generate(taskList.length, (index) => index),
    key: (item) => DateTime.parse(monthTaskList[item].date),
    value: (item) => List.generate(
        monthTaskList.where((task) => monthTaskList[item].date == task.date).length,
            (index) => monthTaskList.where((task) => monthTaskList[item].date == task.date).toList()[index]))
  ..addAll({
    kToday: taskList,
  });

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}
final kToday = DateTime.now();
// for Task task : taskList {
//    if (DateTime.parse(task.date) == )};
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);



