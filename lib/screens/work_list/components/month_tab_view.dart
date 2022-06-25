import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/components/task_list.dart';
import 'package:todo_list_app/database/Task_db.dart';
import 'package:todo_list_app/models/Task.dart';
import 'package:todo_list_app/size_config.dart';

class MonthTabView extends StatefulWidget {
  MonthTabView({Key? key}) : super(key: key);

  @override
  State<MonthTabView> createState() => _MonthTabViewState();
}

class _MonthTabViewState extends State<MonthTabView> {
  late ValueNotifier<List<Task>> _selectedTasks;
  bool isLoading = false;

  CalendarFormat _calendar = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  List<Task> tasks = [];

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date

  //Dynamic Events
  var kTasks = LinkedHashMap<DateTime, List<Task>>(
  equals: isSameDay,
  hashCode: getHashCode,
  );


  late Map<DateTime, List<Task>> _kTaskSource;

  List<Task> _getTasksForDay(DateTime day) {
    return kTasks[day] ?? [];
  }


  List<Task> _getTasksForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getTasksForDay(d),
    ];
  }

  @override
  void initState() {
    super.initState();
    refreshTasks().whenComplete(() => setState(() {
      _kTaskSource = Map.fromIterable(List.generate(tasks.length, (index) => index),
          key: (item) => DateTime.parse(tasks[item].date),
          value: (item) => List.generate(
              tasks.where((task) => tasks[item].date == task.date).length,
                  (index) => tasks.where((task) => tasks[item].date == task.date).toList()[index]));
      kTasks.addAll(_kTaskSource);
      print(tasks.length);
      print(MediaQuery.of(context).size.height);
    }));
    _selectedDay = _focusedDay;
    _selectedTasks = ValueNotifier(_getTasksForDay(_selectedDay!));
    setState(() {});
    // _kTaskSource.addAll(tasks);
  }
  Future<bool> fetchResults() async {

    if (tasks.length != 0) {
      return true;
    }
    return false;
  }

  Future refreshTasks() async {
    setState(() => isLoading = true);

    tasks = await TaskDatabase.instance.readAllTask();
    final result = await fetchResults();
    setState(() => isLoading = false);
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedTasks.value = _getTasksForRange(start, end);
    } else if (start != null) {
      _selectedTasks.value = _getTasksForDay(start);
    } else if (end != null) {
      _selectedTasks.value = _getTasksForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final formattedDate = DateFormat.yMMMMd('en_US');
    // final now = DateTime.now();
    return SizedBox(
      // width: double.infinity,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
        child: Column(
          children: [
            TableCalendar(
              calendarStyle: CalendarStyle(),
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              calendarFormat: _calendar,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _selectedTasks.value = _getTasksForDay(
                      selectedDay); // update `_focusedDay` here as well
                });
              },
              onRangeSelected: _onRangeSelected,
              rangeSelectionMode: _rangeSelectionMode,
              availableCalendarFormats: const {
                CalendarFormat.week: '',
                CalendarFormat.month: '',
              },
              onHeaderTapped: (_now) {
                setState(() {
                  if (_calendar == CalendarFormat.month)
                    _calendar = CalendarFormat.week;
                  else
                    _calendar = CalendarFormat.month;
                });
              },
              eventLoader: _getTasksForDay,
              onFormatChanged: (format) {
                if (_calendar != format) {
                  setState(() {
                    _calendar = format;
                  });
                }
              },
              headerStyle: HeaderStyle(
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  formatButtonDecoration: BoxDecoration(
                      image: DecorationImage(
                          image: _calendar == CalendarFormat.month
                              ? AssetImage('assets/icons/up.png')
                              : AssetImage('assets/icons/down.png')))),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                  child: ValueListenableBuilder<List<Task>>(
                    valueListenable: _selectedTasks,
                    builder: (context, value, _) {
                      return TaskList(taskList: value);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
