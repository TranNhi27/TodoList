import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/database/Task_db.dart';
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
  }) : super(projectTitle: projectTitle, totalTask: totalTask);

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

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    tasks.forEach((element) {matches.add(element.taskTitle);});

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



List<Map<Project, List<Task>>> projectWithTask = [
  {
    // projects[0] : taskList,
  }
];
late List<Task> tasks;
Future<List<Task>> getDayTaskList() async {
  tasks = await TaskDatabase.instance.readTodayTask();
  return tasks;
}

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



