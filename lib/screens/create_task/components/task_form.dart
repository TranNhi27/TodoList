import 'package:flutter/material.dart';
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

class TaskForm extends StatelessWidget {
  const TaskForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedTitle = "";
    String selectedDate = "";
    String selectedDes = "";
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
              },),
              DescriptionField(onChanged: (des) {
                selectedDes = des;
              }),
              DateField(onChangedDate: (date) {
                selectedDate = date;
              },
              onChangedTime: (time) {
                selectedTime = time;
              },),
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
                child: DefaultTextButton(text: 'Add Task', press: () {
                  addTask(selectedTitle, selectedDes, DateTime.parse(selectedDate).toString(), selectedTime);
                  print(TaskDatabase.instance.taskLength());
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

  Future addTask(String taskTitle, String? des, String date, String? hour) async {
    final task = Task(
      taskTitle: taskTitle,
      value: false,
      date: date,
      description: des == null ? '' : des,
      hour: hour == null ? '' : hour
    );

    await TaskDatabase.instance.create(task);
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



