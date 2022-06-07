import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list_app/constants.dart';
import 'components/body.dart';
import 'components/drop_down_dialog/drop_down_dialog.dart';


class WorklistScreen extends StatelessWidget {
  const WorklistScreen({Key? key}) : super(key: key);
  static String routeName = '/worklist';

  @override
  Widget build(BuildContext context) {
    YYDialog.init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('Work List'),
          actions: [
            IconButton(
                onPressed: () {
                  DropDownDialog();
                },
                icon: SvgPicture.asset('assets/icons/sort.svg'))
          ],
          bottom: const TabBar(labelColor: Colors.white, tabs: [
            Tab(
              text: 'Today',
            ),
            Tab(
              text: 'Month',
            )
          ]),
        ),
        body: Body(),
      ),
    );
  }
}





