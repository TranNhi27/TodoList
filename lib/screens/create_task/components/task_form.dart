import 'package:flutter/material.dart';
import 'package:todo_list_app/components/default_text_button.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/screens/create_task/components/add_member_form.dart';
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
              DescriptionField(),
              DateField(onChanged: (time) {
                selectedDate = time;
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
                  taskList.add(new Task(taskTitle: selectedTitle, taskSubtitle: "Hi", date: DateTime.parse(selectedDate).toString()));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(selectedDate),
                  ));
                }),
              ),
              Spacer(),
            ],
          )),
    );
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



