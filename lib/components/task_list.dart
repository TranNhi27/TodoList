import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:todo_list_app/models/Task.dart';
import 'package:todo_list_app/screens/view_task/view_task_screen.dart';
import '../constants.dart';
import '../size_config.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tasks = widget.taskList;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.taskList.length,
            itemBuilder: (BuildContext cont, int index) {
              return Padding(
                padding: EdgeInsets.only(bottom: getProportionateScreenHeight(16)),
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.15,
                  secondaryActions: [
                    IconSlideAction(
                      iconWidget: Icon(Icons.edit, color: kPrimaryColor,),
                      onTap: () => Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => ViewTaskScreen())
                      )
                    ),
                    Container(
                      child: IconSlideAction(
                        iconWidget: Icon(Icons.delete, color: kPrimaryColor,),
                        onTap: () => setState(() {
                          widget.taskList.removeAt(index);

                        })
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(0.1),
                                  style: BorderStyle.solid
                              )
                          )
                      ),
                    )
                  ],
                  child: Container(
                    height: getProportionateScreenHeight(70),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(5, 5),
                            blurRadius: 9,
                            color: Color(0xFFE0E0E0),
                          )
                        ]),
                    child: buildSingleTask(widget.taskList[index], context),
                  ),
                ),
              );
            }),
      ],
    );
  }



  CheckboxListTile buildSingleTask(Task task, BuildContext context) {
    return CheckboxListTile(
      value: task.value,
      activeColor: kPrimaryColor,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(task.taskTitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(decoration: task.value ? TextDecoration.lineThrough : TextDecoration.none),),
      subtitle: Text(task.taskSubtitle, style: TextStyle(decoration: task.value ? TextDecoration.lineThrough : TextDecoration.none),),
      contentPadding: EdgeInsets.only(
          left: 25,
          right: 0),
      secondary: Container(
        width: 4,
        height: 21,
        color: kSecondaryColor,
      ),
      onChanged: (_value) async {
        final val = await pushNewScreenWithRouteSettings(context,
          screen: ViewTaskScreen(), withNavBar: false,settings: RouteSettings(arguments: task));
        setState(() {
          task.value = val == 'true' ? true : task.value;
        });
      },

    );
  }

}
