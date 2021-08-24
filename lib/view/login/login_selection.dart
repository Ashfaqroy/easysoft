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
        child: Container(
          height: 50,
          child: TextField(
            controller: tv,
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.visibility),
                prefixIcon: Icon(Icons.lock_outline),
                labelText: "Password",
                hintText: "Password",
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.green,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: Colors.blue,
                        width: 20,
                        style: BorderStyle.solid))),
            onTap: () async {
              await showDialog(
                context: context,
                builder: (_) => DropDownStyle1(),
              ).then((valueFromDialog) {
                // use the value as you wish
                setState(() {
                  tv.text = valueFromDialog;
                });
              });
            },
          ),
        ),
      ),
    );
  }
}
