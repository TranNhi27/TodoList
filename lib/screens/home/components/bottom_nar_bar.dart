import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:todo_list_app/screens/add_check_list/add_check_list_screen.dart';
// import 'package:todo_list_app/screens/add_note/add_note_screen.dart';
import 'package:todo_list_app/screens/create_task/create_task_screen.dart';
import 'package:todo_list_app/screens/menu/menu_screen.dart';
import 'package:todo_list_app/screens/profile/profile_screen.dart';
import 'package:todo_list_app/screens/quick/quick_screen.dart';
import 'package:todo_list_app/screens/work_list/work_list_screen.dart';
import '../../../constants.dart';
import 'ChoiceButton.dart';

class CustomBotNavBar extends StatefulWidget {
  const CustomBotNavBar({Key? key}) : super(key: key);
  static String routeName = '/navBar';

  @override
  _CustomBotNavBarState createState() => _CustomBotNavBarState();
}

class _CustomBotNavBarState extends State<CustomBotNavBar> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);
    _hideNavBar = false;
  }


  @override
  Widget build(BuildContext context) {
    YYDialog.init(context);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      backgroundColor: kNavBarColor,
      items: _navBarsItems(context),
      decoration:
      NavBarDecoration(borderRadius: BorderRadius.circular(0), boxShadow: [
        BoxShadow(
            offset: Offset(0, -1),
            color: Color.fromRGBO(227, 227, 227, 0.5),
            blurRadius: 10)
      ]),
      confineInSafeArea: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      hideNavigationBar: _hideNavBar,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style15,
      onItemSelected: (index) {
        setState(() {
          _controller.index = index;
        });
      },
    );
  }


  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    SimpleDialog dialog = SimpleDialog();
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.check_mark_circled_solid),
        title: ('My Task'),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Color(0xFF8E8E93),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.grid_view_sharp,
        ),
        title: ('My Task'),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Color(0xFF8E8E93),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        activeColorPrimary: kPrimaryColor,
        onPressed: (cont) =>
        {
          showDialog(
            context: context,
            builder: (con) {
              return dialog = SimpleDialog(
                contentPadding: EdgeInsets.all(0),
                // insetPadding: EdgeInsets.all(0),
                children: <Widget>[
                  SimpleDialogOption(
                    padding: EdgeInsets.all(0),
                    child: const ChoiceButton(choiceText: 'Add Task'),
                    onPressed: () {
                      Navigator.pushNamed(context, CreateTaskScreen.routeName);
                    }
                  ),
                  SimpleDialogOption(
                    padding: EdgeInsets.all(0),
                    child: const ChoiceButton(choiceText: 'Add Quick Note'),
                    onPressed: () {
                    //   pushNewScreen(
                    //       cont!, screen: AddNoteScreen(), withNavBar: true);
                    //   Navigator.pop(context, true);
                    },
                  ),
                  SimpleDialogOption(
                    padding: EdgeInsets.all(0),
                    child: const ChoiceButton(choiceText: 'Add Check List'),
                    onPressed: () {
                      // pushNewScreen(
                      //     cont!, screen: AddCheckListScreen(), withNavBar: true);
                      // Navigator.pop(context, true);
                    },
                  )
                ],);
            },
          ),
        }
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.inventory_rounded,
        ),
        title: ('Quick'),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Color(0xFF8E8E93),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ('Profile'),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Color(0xFF8E8E93),

      )
    ];
  }
}


List<Widget> _buildScreens() {
  return [
    WorklistScreen(),
    MenuScreen(),
    WorklistScreen(),
    QuickScreen(),
    ProfileScreen()
  ];
}


