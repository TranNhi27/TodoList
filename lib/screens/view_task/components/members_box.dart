import 'package:flutter/material.dart';
import 'package:todo_list_app/models/User.dart';

import 'config_title_with_list_tile.dart';

class MembersBox extends StatelessWidget {
  const MembersBox({
    Key? key, required this.group,
  }) : super(key: key);
  final List<User> group;
  @override
  Widget build(BuildContext context) {
    return ConfigTitleWithListTile(
        title: 'Members',
        leading: Icon(Icons.group_add),
        subChild: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              ...List.generate(
                  group.length,
                      (index) => Container(
                    margin: EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(group[index].avatar),
                    ),
                  )),
            ],
          ),
        ));
  }
}
