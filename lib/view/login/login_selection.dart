import 'package:easysoft/view/home/grid_column_quantity_picker.dart';
import 'package:easysoft/view/widget/dropdownstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginSelection extends StatefulWidget {
  LoginSelection({Key? key}) : super(key: key);

  @override
  _LoginSelectionState createState() => _LoginSelectionState();
}

class _LoginSelectionState extends State<LoginSelection> {
  @override
  Widget build(BuildContext context) {
    TextEditingController tv = TextEditingController();
    var result;
    tv.text = " ";
    tv.text = "${DropDownStyle1State.select}";
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ColumnSlider( totalColumns: 2,),
      ),
    );
  }
}
