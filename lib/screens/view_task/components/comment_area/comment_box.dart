import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(134),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0xFFEAEAEA),
              width: 1,
              style: BorderStyle.solid
          )
      ),
      child: Column(
        children: [
          Expanded(
            child: TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Write a comment',
                hintStyle: TextStyle(color: kDayColor),
                contentPadding: EdgeInsets.only(left: k16Padding, top: k16Padding/2),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
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
                    onPressed: () {}, icon: SvgPicture.asset('assets/icons/gallery.svg')),
                IconButton(
                    onPressed: () {}, icon: SvgPicture.asset('assets/icons/attach.svg')),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
                    child: GestureDetector(
                      onTap: () {
                        print('hi');
                      },
                      child: Text('Send',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: kSecondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}