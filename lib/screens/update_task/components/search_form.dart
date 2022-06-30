import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:todo_list_app/models/User.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key, required this.hintText}) : super(key: key);
  final String hintText;

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _typeController = TextEditingController();
  String avatar = '';
  double avatarPadding = k16Padding / 2;
  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.symmetric(horizontal: k16Padding / 2),
        height: getProportionateScreenHeight(48),
        width: getProportionateScreenWidth(90),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(50),
            color: kGrayColor),
        child: Form(
          key: _formKey,
          child: TypeAheadFormField(
            textFieldConfiguration: TextFieldConfiguration(
              maxLines: 1,

              textAlign: TextAlign.center,
              controller: this._typeController,
              decoration: InputDecoration(
                prefix: avatar == '' ? null : CircleAvatar(
                  backgroundImage: AssetImage(
                    avatar,
                  ),
                ),
                hintText: widget.hintText,

                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: avatarPadding, vertical: 0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
            suggestionsBoxDecoration: SuggestionsBoxDecoration(
                color: kGrayColor,
                offsetX: -(k24Padding * 2 + k16Padding),
                constraints: BoxConstraints(
                    minWidth: SizeConfig.screenWidth! - (k16Padding * 2),
                    minHeight: SizeConfig.screenHeight! * 0.72),
                borderRadius: BorderRadius.circular(5)),
            suggestionsBoxVerticalOffset: k24Padding,
            suggestionsCallback: (pattern) {
              return User.getSuggestions(pattern);
            },
            itemBuilder: (context, Map<String, String> suggestion) {
              return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      '${suggestion['avatar']}',
                    ),
                  ),
                  title: Text(
                    '${suggestion['name']}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${suggestion['email']}',
                    style: TextStyle(color: kTextColor),
                  ));
            },
            onSuggestionSelected: (Map<String, String> suggestion) {
              setState(() {
                avatar = '${suggestion['avatar']}';
                avatarPadding = 0;
              });
              this._typeController.text = '${suggestion['name']}';
            },
          ),
        ));
  }
}

// TextFormField(
// textAlign: TextAlign.center,
// decoration: InputDecoration(
// hintText: widget.hintText,
// hintStyle: TextStyle(
// fontWeight: FontWeight.bold,
// ),
// border: InputBorder.none,
// focusedBorder: InputBorder.none,
// enabledBorder: InputBorder.none,
// errorBorder: InputBorder.none,
// disabledBorder: InputBorder.none,
// ),
// onChanged: (_) => {},
// )

// Widget _buildUsersList() {
//   return new ListView.builder(
//     itemCount: taskList.length,
//     itemBuilder: (context, index) {
//       return new Card(
//         child: new ListTile(
//           leading: new CircleAvatar(
//             backgroundImage: new NetworkImage(
//               taskList[index].taskTitle,
//             ),
//           ),
//           title: new Text(_userDetails[index].firstName +
//               ' ' +
//               _userDetails[index].lastName),
//         ),
//         margin: const EdgeInsets.all(0.0),
//       );
//     },
//   );
// }

// showSearch(
// context: context,
// delegate: SearchPage<Task>(
// onQueryUpdate: (s) => print(s),
// items: taskList,
// searchLabel: 'Search people',
// suggestion: Center(
// child: Text('Filter people by name or email'),
// ),
// failure: Center(
// child: Text('No person found!'),
// ),
// filter: (task) => [
// task.taskTitle,
// task.taskSubtitle,
// ],
// builder: (task) => ListTile(
// title: Text(task.taskTitle),
// subtitle: Text(
// task.taskSubtitle,
// ),
// )),
// ),
