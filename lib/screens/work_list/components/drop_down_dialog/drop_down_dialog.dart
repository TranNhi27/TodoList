import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import '../../../../size_config.dart';
import 'drop_down_choices.dart';

YYDialog DropDownDialog() {
  return YYDialog().build()
    ..width = getProportionateScreenWidth(228)
    ..borderRadius = 5.0
    ..gravity = Gravity.top
    ..widgetList
    ..widget(DropdownChoiceList())
    ..show(getProportionateScreenWidth(133), getProportionateScreenHeight(89));
}