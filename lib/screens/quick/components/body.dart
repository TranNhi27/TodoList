import 'package:flutter/material.dart';
import 'package:todo_list_app/models/ListItem.dart';
import 'package:todo_list_app/size_config.dart';
import 'quick_note_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CheckListItem> blank = [];
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16),
          vertical: getProportionateScreenHeight(32)
          ),
          child: Column(
            children: List.generate(
                listItems.length,
                    (index) => QuickNoteCard(
                        quickText: listItems[index].content,
                        color: listItems[index].color,
                      listItem: (listItems[index].listItem == null ? blank : listItems[index].listItem) as List<CheckListItem>,
                    ))
          ),
        ),
      ),
    );
  }
}

