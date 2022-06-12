import 'package:flutter/material.dart';
import 'package:todo_list_app/components/default_text_button.dart';
import 'package:todo_list_app/models/Task.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'pop_up_calendar.dart';


class DateField extends StatefulWidget {
  DateField({
    Key? key,
    required this.onChanged
  }) : super(key: key);

  ValueChanged<String> onChanged;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  String time = 'Anytime';
  AlertDialog dialog = AlertDialog();
  Task task = Task(taskTitle: '');
  @override
  Widget build(BuildContext context) {
    PopUpCalendar popUpCalendar = PopUpCalendar(task: task);
    return Container(
      height: getProportionateScreenHeight(66),
      color: kGrayColor,
      padding: EdgeInsets.only(left: k24Padding),
      margin: EdgeInsets.only(top: k16Padding /2, bottom: k24Padding),
      child: Row(
        children: [
          Text('Due Date',style: TextStyle(fontSize: 18),),
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
                               widget.onChanged(time);
                              });
                            }),
                          )
                        ],
                      )),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}

