import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class DescriptionField extends StatefulWidget {
  DescriptionField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);
  ValueChanged<String> onChanged;

  @override
  State<DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: k16Padding, horizontal: k24Padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(color: kDayColor, fontSize: 16),
          ),
          SizedBox(
            height: getProportionateScreenHeight(12),
          ),
          Container(
            height: getProportionateScreenHeight(120),
            decoration: BoxDecoration(border: Border.all(color: kDayColor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: TextFormField(
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                      onChanged: (String title) => {
                        setState(() {
                          widget.onChanged(title);
                        })
                      },
                    ),
                  ),
                ),
                Container(
                  height: getProportionateScreenHeight(48),
                  decoration: BoxDecoration(
                    color: kGrayColor.withOpacity(0.8),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/icons/attach.svg')),
                      Expanded(
                        child: Container(
                          child: Text(''),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
