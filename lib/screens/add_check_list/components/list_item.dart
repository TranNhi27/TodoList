import 'package:flutter/material.dart';
import 'package:todo_list_app/components/choose_color_box.dart';
import 'package:todo_list_app/components/default_text_button.dart';
import 'package:todo_list_app/models/ListItem.dart';
import 'package:todo_list_app/screens/quick/quick_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class ListItem extends StatefulWidget {
  const ListItem({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  final formKey = GlobalKey<FormState>();
  int isChecked = 0;
  int listLength = 4;
  List<CheckListItem> list = [
    CheckListItem(),
    CheckListItem(),
    CheckListItem(),
    CheckListItem(),
  ];
  List<CheckListItem> postList = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(list.length,
                    (index) => buildSingleItem(item: list[index], order: index+1)),
            GestureDetector(
              child: Text('+Add new item', style: TextStyle(
                  color: kTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
              onTap: () => setState(() => list.add(CheckListItem())),
            ),
            SizedBox(height: getProportionateScreenHeight(40),),
            ChooseColorBox(),
            DefaultTextButton(text: 'Done', press: () {
              list.forEach((element) {
                if (element.isChecked)
                  postList.add(element);
                element.isChecked = false;
                print(widget.title);
              });
              if (formKey.currentState!.validate())
              {
                formKey.currentState!.save();
                print('${postList.length} ${postList[1].content}');
              }
              listItems.add(CheckListItem(content: widget.title, listItem: postList));
              Navigator.push(context, MaterialPageRoute(builder: (context) => QuickScreen()));
            })
          ]
      ),
    );
  }

  Container buildSingleItem({required CheckListItem item, required int order}) {
    return Container(
      // margin: EdgeInsets.only(bottom: getProportionateScreenHeight(24)),
      width: double.infinity,
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(),
            value: item.isChecked,
            onChanged: (_value) {
              setState(() {
                item.isChecked = _value!;
              });
            },
          ),
          Expanded(
            child: TextFormField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintText: "List item $order" ,
                hintStyle: TextStyle(
                    color: Colors.black
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              onSaved: (_value) => item.content = _value! ,
            ),
          ),
        ],
      ),
    );
  }
}