import 'package:flutter/material.dart';
import 'package:todo_list_app/components/base_container.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'list_item.dart';

class CheckListBoard extends StatefulWidget {
  const CheckListBoard({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckListBoard> createState() => _CheckListBoardState();
}

class _CheckListBoardState extends State<CheckListBoard> {
  final myController = TextEditingController();
  int selectedColor = 0;
  String title = '';
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      height: SizeConfig.screenHeight! >= 812 ? getProportionateScreenHeight(580) : double.infinity,
      verticalPadding: k24Padding,
      child: SingleChildScrollView(
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
              onChanged: (text) {
                setState(() {
                  title = myController.text;
                });
              },
              // autofocus: true,s
            ),
            ListItem(title: title),
          ],
        ),
      ),
    );
  }
}
