import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CountBox extends StatelessWidget {
  const CountBox({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: k24Padding),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildSingleCountBox(type: 'Events', totalTask: 12, color: kPrimaryColor),
            buildSingleCountBox(type: 'To do Tasks', totalTask: 12, color: kSecondaryColor),
            buildSingleCountBox(type: 'Quick Notes', totalTask: 12, color: kLightPurple)
          ],
        ),
      ),
    );
  }

  Container buildSingleCountBox({required String type, required int totalTask,required Color color}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: k24Padding,
          vertical: k24Padding
      ),
      margin: EdgeInsets.only(right: k16Padding/2),
      width: getProportionateScreenWidth(160),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 10,
              color: Color.fromRGBO(224, 224, 224, 0.5))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(type, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 18),),
          SizedBox(height: getProportionateScreenHeight(10),),
          Text('$totalTask Tasks',style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
