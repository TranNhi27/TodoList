import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';
import '../size_config.dart';

class ChooseColorBox extends StatefulWidget {
  ChooseColorBox({Key? key}) : super(key: key);

  @override
  _ChooseColorBoxState createState() => _ChooseColorBoxState();
}

class _ChooseColorBoxState extends State<ChooseColorBox> {
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose Color',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: getProportionateScreenHeight(17),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(noteColors.length,
                    (index) => buildColorBox(
                    color: noteColors[index],
                    index: index
                )),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(40),),
      ],
    );
  }
  GestureDetector buildColorBox({required Color color, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: getProportionateScreenWidth(12)),
        padding: EdgeInsets.all(8),
        width: getProportionateScreenWidth(48),
        height: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SvgPicture.asset('assets/icons/checked.svg',
            color: selectedColor == index ? Colors.white : Colors.transparent
        ),
      ),
    );
  }
}