import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/models/ListItem.dart';
import '../../../size_config.dart';

class QuickNoteCard extends StatefulWidget {
  const QuickNoteCard(
      {Key? key, required this.quickText, required this.color, this.listItem})
      : super(key: key);

  final String quickText;
  final Color color;
  final List<CheckListItem>? listItem;

  @override
  State<QuickNoteCard> createState() => _QuickNoteCardState();
}

class _QuickNoteCardState extends State<QuickNoteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(16)),
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(32),
          right: getProportionateScreenWidth(19),
          bottom: getProportionateScreenHeight(21)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(5, 5), blurRadius: 9, color: Color(0xFFE0E0E0))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: getProportionateScreenHeight(13)),
            height: getProportionateScreenHeight(3),
            width: getProportionateScreenWidth(121),
            color: widget.color,
          ),
          Text(
            widget.quickText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          widget.listItem == null
              ? Container()
              : Padding(
                  padding: EdgeInsets.only(top: k16Padding),
                  child: Column(
                    children: List.generate(
                        widget.listItem!.length,
                            (index) => buildSingleItem(item: widget.listItem![index]))
                  ),
                )
        ],
      ),
    );
  }

  Container buildSingleItem({required CheckListItem item}) {
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
            child: Text(
              item.content,
              style: TextStyle(fontSize: 20, decoration: item.isChecked ? TextDecoration.lineThrough : TextDecoration.none),
              // onSaved: (_value) => item.content = _value! ,
            ),
          ),
        ],
      ),
    );
  }
}
