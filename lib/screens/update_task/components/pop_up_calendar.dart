import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/models/Task.dart';


class PopUpCalendar extends StatefulWidget {
  PopUpCalendar({Key? key, required this.task}) : super(key: key);
  Task task;
  @override
  _PopUpCalendarState createState() => _PopUpCalendarState();

}


class _PopUpCalendarState extends State<PopUpCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    String formattedDate;
    return TableCalendar(
      calendarStyle: CalendarStyle(),
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      calendarFormat: CalendarFormat.month,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
          formattedDate = DateFormat('yyyy-MM-dd').format(_focusedDay);
          widget.task.date = formattedDate;
        });
      },

      headerStyle: HeaderStyle(
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          formatButtonVisible: false

      ),
    );
  }
}