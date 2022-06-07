import 'package:flutter/material.dart';
import '../../../constants.dart';

class ConfigTitleWithListTile extends StatelessWidget {
  const ConfigTitleWithListTile({
    Key? key,
    required this.title,
    required this.leading,
    required this.subChild,
    this.requestPaddingLine = true,
  }) : super(key: key);
  final String title;
  final Widget leading;
  final Widget subChild;
  final bool requestPaddingLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            leading: leading,
            title: Text(
              title,
              style: TextStyle(color: kDayColor),
            ),
            subtitle: subChild),
        Container(
          height: 2,
          width: requestPaddingLine ? double.infinity : 0,
          color: kGrayColor,
        )
      ],
    );
  }
}

