import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/components/task_list.dart';
import 'package:todo_list_app/database/Task_db.dart';
import 'package:todo_list_app/models/Task.dart';
import 'package:todo_list_app/size_config.dart';



class MonthTabView extends StatefulWidget {
  const MonthTabView({Key? key}) : super(key: key);

  @override
  State<MonthTabView> createState() => _MonthTabViewState();
}

class _MonthTabViewState extends State<MonthTabView> {
  late ValueNotifier<List<Task>> _selectedTasks;
  bool isLoading = false;
  late List<Task> tasks;
  CalendarFormat _calendar = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  List<Task>? list;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  //
  // Future<List<Task>?> _getDays(DateTime day) async {
  //   Future.delayed(const Duration(seconds: 2), () => kTasks[day] ?? []);
  //   print(kTasks[_focusedDay]);
  //   return kTasks[day];
  //
  // }

  // Future<List<Task>> getList() async {
  //   await kTasks;
  // }
  List<Task> _getTasksForDay(DateTime day)  {
    return kTasks[day] ?? [];
  }


  //
  // List<Task> _getTasksForDay(DateTime day) {
  //   List<Task>? _listTask;
  //   _getDays(day).then((value) {
  //     if (value != null) value.forEach((item) => _listTask!.add(item));
  //   });
  //   return _listTask == null ? [] : _listTask;
  // }



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

    refreshTasks();
    _selectedDay = _focusedDay;
    _selectedTasks = ValueNotifier(_getTasksForDay(_selectedDay!));

  }

  Future refreshTasks() async {
    setState(() => isLoading = true);

    this.tasks = await TaskDatabase.instance.readAllTask();

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
    return SingleChildScrollView(
      child: SizedBox(
        // width: double.infinity,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
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
                    _selectedTasks.value = _getTasksForDay(selectedDay);// update `_focusedDay` here as well
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
                                : AssetImage('assets/icons/down.png'))
                    )
                ),
              ),
              Expanded(
                child: ValueListenableBuilder<List<Task>>(
                  valueListenable: _selectedTasks,
                  builder: (context, value, _) {
                    return TaskList(taskList: value);
                  },

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// ListView.builder(
// itemCount: value.length,
// itemBuilder: (context, index) {
// return Container(
// margin: const EdgeInsets.symmetric(
// horizontal: 12.0,
// vertical: 4.0,
// ),
// decoration: BoxDecoration(
// border: Border.all(),
// borderRadius: BorderRadius.circular(12.0),
// ),
// child: ListTile(
// onTap: () => print('${value[index]}'),
// title: Text('${value[index]}'),
// ),
// );
// },
// )