import 'package:flutter/material.dart';
import 'package:todo_list_app/components/base_container.dart';
import 'package:todo_list_app/components/choose_color_box.dart';
import 'package:todo_list_app/components/default_text_button.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/models/ListItem.dart';
import 'package:todo_list_app/screens/quick/quick_screen.dart';
import '../../../size_config.dart';

class NoteBoard extends StatefulWidget {
  const NoteBoard({
    Key? key,
  }) : super(key: key);

  @override
  State<NoteBoard> createState() => _NoteBoardState();
}

class _NoteBoardState extends State<NoteBoard> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      height: getProportionateScreenHeight(468),
      verticalPadding: k24Padding,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        TextField(
          controller: myController,
          maxLines: 2,
          // autofocus: true,
        ),
        SizedBox(height: getProportionateScreenHeight(34),),
        ChooseColorBox(),
        DefaultTextButton(
            text: 'Done',
            press: () {
              listItems.add(CheckListItem(content: myController.text,color: kDarkPink));
              Navigator.push(context, MaterialPageRoute(builder: (context) => QuickScreen()));
            })
      ],
    ),)
    ;
  }
}

