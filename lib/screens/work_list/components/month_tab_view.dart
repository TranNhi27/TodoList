import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/models/Task.dart';
import 'package:todo_list_app/size_config.dart';



class MonthTabView extends StatefulWidget {
  const MonthTabView({Key? key}) : super(key: key);

  @override
  State<MonthTabView> createState() => _MonthTabViewState();
}

class _MonthTabViewState extends State<MonthTabView> {
  late final ValueNotifier<List<Task>> _selectedTasks;
  CalendarFormat _calendar = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<Task> _getTasksForDay(DateTime day) {
    // Implementation example
    return kTasks[day] ?? [];
  }

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedTasks = ValueNotifier(_getTasksForDay(_selectedDay!));
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
        child: Column(
          children: [
            TableCalendar(
              calendarStyle: CalendarStyle(),
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
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
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          onTap: () => print('${value[index]}'),
                          title: Text('${value[index]}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       DayDetailText(day: 'Today, ${formattedDate.format(DateTime.parse(DateTime(now.year, now.month, now.day).toString()))}'),
            //       TaskList(taskList: taskList),
            //       DayDetailText(day: 'Tomorrow, ${formattedDate.format(DateTime.parse(DateTime(now.year, now.month, now.day + 1).toString()))}',),
            //       TaskList(taskList: monthTaskList),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


