import 'package:flutter/material.dart';
import 'choice_card.dart';

List<DropdownChoice> choices = [
  DropdownChoice(choiceText: 'Incomplete Tasks'),
  DropdownChoice(choiceText: 'Completed Tasks'),
  DropdownChoice(choiceText: 'All Tasks')
];

class DropdownChoiceList extends StatefulWidget {
  const DropdownChoiceList({Key? key}) : super(key: key);

  @override
  _DropdownChoiceListState createState() => _DropdownChoiceListState();
}

class _DropdownChoiceListState extends State<DropdownChoiceList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(0.0,),
        shrinkWrap: true,
        itemCount: choices.length,
        itemBuilder: (context, index) {
          return ChoiceCard(
              choice: choices[index],
              press: () {
                setState(() {
                  choices.forEach((element) {element.isSelected = false;});
                  choices[index].isSelected = true;
                });
              });
        }
    );
  }
}
