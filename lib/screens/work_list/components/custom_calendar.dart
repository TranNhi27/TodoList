import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:todo_list_app/models/Task.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({Key? key}) : super(key: key);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  // late final ValueNotifier<List<Task>> _selectedTasks;
  CalendarFormat _calendar = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // List<Task> _getTasksForDay(DateTime day) {
  //   // Implementation example
  //   return kTasks[day] ?? [];
  // }

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    // _selectedTasks = ValueNotifier(_getTasksForDay(_selectedDay!));
  }


  @override
  Widget build(BuildContext context) {
    return TableCalendar(
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
          // _selectedTasks.value = _getTasksForDay(selectedDay);// update `_focusedDay` here as well
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
      // eventLoader: _getTasksForDay,
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
    );
  }
}
