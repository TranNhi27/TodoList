import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/api/notification_api.dart';
import 'package:todo_list_app/components/default_text_button.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/database/Task_db.dart';
import 'package:todo_list_app/screens/create_task/components/add_member_form.dart';
import 'package:todo_list_app/screens/work_list/work_list_screen.dart';
import '../../../size_config.dart';
import 'date_field.dart';
import 'description_field.dart';
import 'filling_form.dart';
import 'search_form.dart';
import 'title_field.dart';
import 'package:todo_list_app/models/Task.dart';

class EditTaskForm extends StatefulWidget {
  const EditTaskForm({
    Key? key,
  }) : super(key: key);

  @override
  State<EditTaskForm> createState() => _EditTaskFormState();
}

class _EditTaskFormState extends State<EditTaskForm> {

  @override
  void initState() {
    NotificationApi.init();
  }

  @override
  Widget build(BuildContext context) {
    Task task = ModalRoute.of(context)!.settings.arguments as Task;
    String selectedTitle = task.taskTitle;
    var inputFormat = DateFormat('yyyy/MM/dd');

    String selectedDate = inputFormat.format(DateTime.parse(task.date));
    String selectedDes = task.description;
    String selectedTime = "";
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: k16Padding,
              vertical: getProportionateScreenHeight(6)),
          height: SizeConfig.screenHeight! *0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  offset: Offset(3, 3),
                  blurRadius: 9,
                  color: Color(0xFFDDDDDD))
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: k24Padding, vertical: k24Padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildTitleAndSearchForm(title: 'For', hintText: 'Assignee'),
                    buildTitleAndFillingForm(title: 'In', hintText: 'Project'),
                  ],
                ),
              ),
              TitleField(onChanged: (title) {
                selectedTitle = title;
                print(task.taskTitle);
              }, title: selectedTitle,
              ),
              DescriptionField(onChanged: (des) {
                selectedDes = des;
              },
                des: selectedDes,
              ),
              DateField(onChangedDate: (date) {
                selectedDate = date;
              },
                onChangedTime: (time) {
                  selectedTime = time;
                },
                date: selectedDate,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: k24Padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Add Member', style: bold18Text,),
                    SizedBox(height: k16Padding / 2,),
                    AddMemberForm(hintText: 'Anyone'),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: k24Padding),
                child: DefaultTextButton(text: 'Done', press: () {
                  updateTask(task.id!, selectedTitle, selectedDes, DateTime.parse(selectedDate).toString(), selectedTime);
                  print(selectedTime);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorklistScreen(),
                    ),
                  );
                }),
              ),
              Spacer(),
            ],
          )),
    );
  }

  Future updateTask(int id,String taskTitle, String? des, String date, String? hour) async {
    final task = Task(
        id: id,
        taskTitle: taskTitle,
        value: false,
        date: date,
        description: des == null ? '' : des,
        hour: hour == null ? '' : hour
    );

    await TaskDatabase.instance.update(task);


    NotificationApi.showScheduledNotification(
        title: taskTitle,
        body: des,
        payload: "blank",
        scheduleDate: DateTime.parse(date).
        add(Duration(hours: int.parse(hour == null ? '' : hour.substring(0, 2)),
            minutes: int.parse(hour == null ? '' : hour.substring(3, 5))
        )));
  }

  Row buildTitleAndFillingForm(
      {required String title, required String hintText}) {
    return Row(
      children: [
        Text(
          title,
          style: bold18Text,
        ),
        SizedBox(
          width: 8,
        ),
        FillingForm(
          hintText: hintText,
        )
      ],
    );
  }

  Row buildTitleAndSearchForm(
      {required String title, required String hintText}) {
    return Row(
      children: [
        Text(
          title,
          style: bold18Text,
        ),
        SizedBox(
          width: 8,
        ),
        SearchForm(hintText: hintText)
      ],
    );
  }
}



