import 'package:flutter/material.dart';
import 'package:todo_list_app/components/default_text_button.dart';
import 'package:todo_list_app/models/Task.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'pop_up_calendar.dart';


class DateField extends StatefulWidget {
  DateField({
    Key? key,
    required this.onChangedDate,
    required this.onChangedTime
  }) : super(key: key);

  ValueChanged<String> onChangedDate;
  ValueChanged<String> onChangedTime;
  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  String time = 'Anytime';
  AlertDialog dialog = AlertDialog();
  Task task = Task(taskTitle: '');
  TimeOfDay _time = TimeOfDay.now();

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    PopUpCalendar popUpCalendar = PopUpCalendar(task: task);
    final localizations = MaterialLocalizations.of(context);
    final formattedTimeOfDay = localizations.formatTimeOfDay(_time);
    return Container(
      height: getProportionateScreenHeight(66),
      color: kGrayColor,
      padding: EdgeInsets.only(left: k24Padding),
      margin: EdgeInsets.only(top: k16Padding /2, bottom: k24Padding),
      child: Row(
        children: [
          Text('Due Date',style: TextStyle(fontSize: 18),),
          Spacer(),
          SizedBox(width: 10,),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: k16Padding, vertical: k16Padding/2),
              child: Text(time, style: TextStyle(color: Colors.white),),
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
            onTap: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  content: Container(
                      width: getProportionateScreenWidth(350),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          popUpCalendar,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(97)),
                            child: DefaultTextButton(text: 'Done', press: () {
                              Navigator.pop(context, popUpCalendar.task.date);
                              setState(() {
                               time = task.date;
                               widget.onChangedDate(time);
                               widget.onChangedTime(formattedTimeOfDay);
                              });
                            }),
                          )
                        ],
                      )),
                );
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(onPressed: () {
              _selectTime();
            },
                icon: Icon(
                  Icons.watch_later_sharp
                )),
          ),
        ],
      ),
    );
  }
}

