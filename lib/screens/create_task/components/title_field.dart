import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class TitleField extends StatefulWidget {
   TitleField({
    Key? key,
    required this.onChanged,

  }) : super(key: key);
  ValueChanged<String> onChanged;


  @override
  State<TitleField> createState() => _TitleFieldState();
}

class _TitleFieldState extends State<TitleField> {
  @override
  Widget build(BuildContext context) {
    // String _title;
    // GlobalKey key = GlobalKey();
    // RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    // Offset position = box.localToGlobal(Offset.zero); //this is global position
    // double y = position.dy;
    // double x = position.dx;
    return Container(
      // key: key,
      height: getProportionateScreenHeight(66),
      color: kGrayColor,
      padding: EdgeInsets.only(left: k24Padding),
      child: Row(
        children: [
          Text('Title', style: bold18Text,),
          SizedBox(width: 10,),
          Expanded(
            child: TextFormField(
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              onChanged: (String title) => {
               setState(() {
              widget.onChanged(title);
                           })
              },
            ),
          ),
        ],
      ),
    );
  }
}