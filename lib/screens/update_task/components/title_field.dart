import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class TitleField extends StatefulWidget {
   TitleField({
    Key? key,
    required this.onChanged, required this.title
  }) : super(key: key);
  ValueChanged<String> onChanged;
  String title;

  @override
  State<TitleField> createState() => _TitleFieldState();
}

class _TitleFieldState extends State<TitleField> {
  @override
  Widget build(BuildContext context) {

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
              initialValue: widget.title,
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