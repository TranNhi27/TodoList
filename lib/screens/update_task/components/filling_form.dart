import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class FillingForm extends StatefulWidget {
  const FillingForm({
    Key? key,
    required this.hintText,
  }) : super(key: key);
  final String hintText;

  @override
  State<FillingForm> createState() => _FillingFormState();
}

class _FillingFormState extends State<FillingForm> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: k16Padding / 2),
        width: getProportionateScreenWidth(90),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(50),
            color: kGrayColor),
        child: Form(
          key: _formKey,
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ));
  }
}
