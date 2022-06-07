import 'package:flutter/material.dart';
import 'package:todo_list_app/models/User.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import 'comment_box.dart';
import 'comment_content.dart';

class CommentArea extends StatelessWidget {
  const CommentArea({
    Key? key, required this.isShowed,
  }) : super(key: key);
  final bool isShowed;
  @override
  Widget build(BuildContext context) {
    return isShowed ? Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(32),),
        CommentBox(),
        SizedBox(height: k24Padding),
        CommentContent(user: users[2],
            content: Text('Loremsadaw asfw sdfe cvxv rete asdad wqrqrew',
              style: TextStyle(fontSize: 16),)
        ),
        CommentContent(user: users[2],
            content: Image.asset('assets/images/profile2.jpg')
        ),
        SizedBox(height: k24Padding + k16Padding,),
      ],
    ) : Container();
  }
}
