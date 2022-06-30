import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:todo_list_app/components/choose_color_box.dart';
import 'package:todo_list_app/components/default_text_button.dart';
import 'package:todo_list_app/models/Project.dart';
import '../../../size_config.dart';
import 'add_box.dart';
import 'project_card.dart';

class ProjectBoard extends StatefulWidget {
  const ProjectBoard({Key? key}) : super(key: key);

  @override
  _ProjectBoardState createState() => _ProjectBoardState();
}

class _ProjectBoardState extends State<ProjectBoard> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: getProportionateScreenHeight(40),
          bottom: getProportionateScreenHeight(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: getProportionateScreenWidth(13),
                mainAxisSpacing: getProportionateScreenHeight(24)),
            itemBuilder: (context, index) => ProjectCard(
              projectTitle: projects[index].projectTitle,
              totalTask: projects[index].totalTask,
              color: Colors.red,
            ),
            itemCount: projects.length,
            shrinkWrap: true,
          ),
          AddBox(
            press: () => setState(() => AddProjectDialog().show()),
          )
        ],
      ),
    );
  }

  YYDialog AddProjectDialog() {
    return YYDialog().build()
      ..width = getProportionateScreenWidth(327)
      ..borderRadius = 5
      ..widget(Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(24),
            vertical: getProportionateScreenWidth(24)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextField(
              controller: myController,
              maxLines: 2,
              // autofocus: true,
            ),
            ChooseColorBox(),
            DefaultTextButton(text: 'Create Project', press: () {
                setState(() => projects.add(
                  Project(
                      projectTitle: myController.text,
                      totalTask: 0,
                  )
                ));
            }
            )
          ],
        ),
      ));
  }
}

