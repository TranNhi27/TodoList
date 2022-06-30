import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list_app/components/base_container.dart';
import 'package:todo_list_app/components/default_text_button.dart';
import 'package:todo_list_app/models/Task.dart';
import 'package:todo_list_app/models/User.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'assign_to_whom_box.dart';
import 'comment_area/comment_area.dart';
import 'description_box.dart';
import 'due_date_box.dart';
import 'members_box.dart';
import 'tag_box.dart';

class ViewTaskDetail extends StatefulWidget {
  const ViewTaskDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewTaskDetail> createState() => _ViewTaskDetailState();
}

class _ViewTaskDetailState extends State<ViewTaskDetail> {
  bool isShowed = false;
  bool _isLoaded = false;
  late Task thisTask;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      this.getData();
    });

  }
  getData() async {
    try {
      final task = ModalRoute.of(context)!.settings.arguments as Task?;
      setState(() {
        _isLoaded = true;
        if (task != null)
        thisTask = task;// when data is loaded update state
      });
    }
    catch (ex) {
      print(ex);
    }
  }
  @override
  Widget build(BuildContext context) {
    Task task = ModalRoute.of(context)!.settings.arguments as Task;

    List<User> blankMember = [];
    return _isLoaded == false ?
    Center(
      child: CircularProgressIndicator(), // Show indicator
    ) : BaseContainer(
        height: SizeConfig.screenHeight!,
        verticalPadding: k16Padding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildCloseAndSettingIcon(
                  closeIcon: Icons.close,
                  settingIcon: Icons.settings,
                  context: context),
              buildTaskTitle(
                  title: task.taskTitle),
              AssignToWhomBox(task: task,),
              DueDateBox(dateTime: task.date, time: task.hour,),
              DescriptionBox(description: task.description,),
              MembersBox(group: (task.members != null ? task.members : blankMember) as List<User>,),
              TagBox(tag: "TODO",),
              CommentArea(isShowed: isShowed),
              DefaultTextButton(
                text: 'Complete Task',
                color: kSecondaryColor,
                press: () {
                  Navigator.pop(context, 'true');
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: k16Padding),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isShowed = true;
                    });
                  },
                  child: isShowed ? Container() : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Comment', style: bold18Text,),
                      SizedBox(width: k16Padding,),
                      SvgPicture.asset('assets/icons/double_down.svg')
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Padding buildTaskTitle({required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: k24Padding),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: bold18Text,
      ),
    );
  }

  Row buildCloseAndSettingIcon(
      {required IconData closeIcon,
      required IconData settingIcon,
      required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          icon: Icon(closeIcon),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          icon: Icon(settingIcon),
          onPressed: () {},
        )
      ],
    );
  }
}









