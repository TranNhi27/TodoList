import 'package:flutter/material.dart';
import 'package:todo_list_app/models/User.dart';
import '../../../../constants.dart';


class CommentContent extends StatelessWidget {
  const CommentContent({
    Key? key, required this.content, required this.user,
  }) : super(key: key);
  final Widget content;
  final User user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(user.avatar),
              ),
              title: Text(user.name,
                  style: bold18Text),
              subtitle: Text('3 days ago',
                style: TextStyle(color: kDayColor, fontSize: 16),
              ),
            ),
            content,
          ],
        ),

      ],
    );
  }
}