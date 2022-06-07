import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'config_title_with_list_tile.dart';

class TagBox extends StatelessWidget {
  const TagBox({
    Key? key, required this.tag,
  }) : super(key: key);
  final String tag;
  @override
  Widget build(BuildContext context) {
    return ConfigTitleWithListTile(
        requestPaddingLine: false,
        title: 'Tag',
        leading: Icon(Icons.tag),
        subChild: Container(
          padding: EdgeInsets.all(k16Padding / 4),
          width: getProportionateScreenWidth(90),
          height: getProportionateScreenHeight(40),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE8E8E8), width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            tag,
            style: TextStyle(color: kSecondaryColor, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ));
  }
}