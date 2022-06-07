import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:todo_list_app/models/User.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class AddMemberForm extends StatefulWidget {
  const AddMemberForm({Key? key, required this.hintText}) : super(key: key);
  final String hintText;
  @override
  _AddMemberFormState createState() => _AddMemberFormState();
}

class _AddMemberFormState extends State<AddMemberForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _typeController = TextEditingController();
  String avatar = '';
  double avatarPadding = k16Padding / 2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(members.length, (index) =>
            Container(
              margin: EdgeInsets.only(right: 5),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  members[index]
                ),
              ),
            )
        ),
        Container(
          // padding: EdgeInsets.symmetric(horizontal: k16Padding / 2),
            height: getProportionateScreenHeight(52),
            width: getProportionateScreenWidth(100),
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
                    constraints: BoxConstraints(
                        minWidth: SizeConfig.screenWidth! *0.45,
                        minHeight: SizeConfig.screenHeight! * 0.72),
                    borderRadius: BorderRadius.circular(5)),
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
                    avatar = '';
                    avatarPadding = 0;
                    members.add('${suggestion['avatar']}');
                  });
                  this._typeController.text = '+';
                },
              ),
            )),
      ],
    );
  }
}
