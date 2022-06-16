import 'package:flutter/material.dart';
import 'package:todo_list_app/components/background_container.dart';
import 'note_board.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          BackgroundContainer(),
          NoteBoard(),
        ],
      ),
    );
  }
}



