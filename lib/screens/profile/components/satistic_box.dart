import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'circle_progress_box.dart';


class StatisticBox extends StatelessWidget {
  const StatisticBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.symmetric(
          horizontal: k24Padding, vertical: k16Padding),
      decoration: defaultBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Statistic',
            style: headingStyle,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleProgressBox(
                  boxHeight: 80,
                  boxWidth: 80,
                  borderColor: kPrimaryColor,
                  borderWidth: 4,
                  child: Text(
                    '40%', style: TextStyle(color: kTextColor,fontWeight: FontWeight.bold, fontSize: 18),
                  )
              ),
              CircleProgressBox(
                  boxHeight: 80,
                  boxWidth: 80,
                  borderColor: kSecondaryColor,
                  borderWidth: 4,
                  child: Text(
                    '60%', style: TextStyle(color: kTextColor,fontWeight: FontWeight.bold, fontSize: 18),
                  )
              ),
              CircleProgressBox(
                  boxHeight: 80,
                  boxWidth: 80,
                  borderColor: kLightPurple,
                  borderWidth: 5,
                  child: Text(
                    '80%', style: TextStyle(color: kTextColor,fontWeight: FontWeight.bold, fontSize: 18),
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}