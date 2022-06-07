import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'config_title_with_list_tile.dart';


class DescriptionBox extends StatelessWidget {
  const DescriptionBox({
    Key? key, required this.description,
  }) : super(key: key);
  final String description;
  @override
  Widget build(BuildContext context) {
    return ConfigTitleWithListTile(
        title: 'Description',
        leading: Icon(Icons.description),
        subChild: Text(
          description,
          style: TextStyle(color: kTextColor, fontSize: 16),
        ));
  }
}
