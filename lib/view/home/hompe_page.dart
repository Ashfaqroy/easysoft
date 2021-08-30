import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'grid_column_quantity_picker.dart';

class DashboardHomePage extends StatefulWidget {
  int itemcount;
  DashboardHomePage({required this.itemcount});

  @override
  _DashboardHomePageState createState() =>
      _DashboardHomePageState(itemcount: itemcount);
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  int itemcount;
  _DashboardHomePageState({required this.itemcount});
  double column = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
                height: 50,
                width: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text("   Country Client Id "),
                      Text("   Country Client Id 2 "),
                      Text("  countryUserId2 "),
                      Text("  clinetId "),
                      Text("  clientUserId "),
                      Text("  projectId "),
                    ],
                  ),
                )),
            SizedBox(
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black, // background
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ) // foreground
                            ),
                        onPressed: () {
                          //print(map['FlutterQuery']);
                          setState(() {});
                        },
                        child: Text("test"));
                  }),
            ),
            Container(
              child: ListTile(
                trailing: IconButton(
                  icon: Icon(Icons.change_circle),
                  onPressed: () {
                    _showTotalColumnPickerDialog();
                  },
                ),
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: column.toInt(),
              ),
              itemBuilder: (context, index) {
                Color randamColor =
                    Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
                return InkWell(
                  child: Container(
                      child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: randamColor, width: 0.5)),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/food.jpeg"),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            "MenuName",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  )),
                  onTap: () async {
                    // setState(() {
                    //
                    // });
                    // Provider.of<DashboardProvider>(context, listen: false)
                    //     .getProjectMenuById(map["ProjectID"])
                    //     .then((value) {
                    //   Navigator.pushNamed(
                    //       context, '/project_menu_dashboard_page');
                    // });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showTotalColumnPickerDialog() async {
    // <-- note the async keyword here

    // this will contain the result from Navigator.pop(context, result)
    final selectedTotalColumns = await showDialog<double>(
      context: context,
      builder: (context) => Center(
        child: SizedBox(
          height: 200,
          child: AlertDialog(
            title: Text('Total Columns'),
            content: Container(
              child: Center(
                child: CupertinoSlider(
                  value: column,
                  onChanged: (value) {
                    setState(() {
                      column = value;
                    });
                  },
                  max: 100,
                  min: 0,
                  divisions: 4,
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // Use the second argument of Navigator.pop(...) to pass
                  // back a result to the page that opened the dialog
                  Navigator.pop(context, column);
                },
                child: Text('DONE'),
              )
            ],
          ),
        ),
      ),
    );

    // execution of this code continues when the dialog was closed (popped)

    // note that the result can also be null, so check it
    // (back button or pressed outside of the dialog)
    if (selectedTotalColumns != null) {
      print(selectedTotalColumns);
      setState(() {
        column = selectedTotalColumns;
      });
    }
  }

  onSelected(BuildContext context, int item) {
    switch (item) {
      // case 1:
      //   setState(() {
      //     layout=1;
      //   });
      //   break;
      // case 2:
      //   _showTotalColumnPickerDialog();
      //   break;
    }
  }

  void _showPopupMenu() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        PopupMenuItem<int>(value: 0, child: Text('Print')),
        PopupMenuItem<int>(value: 1, child: Text('Grid Layout')),
        PopupMenuItem<int>(value: 2, child: Text('Slider')),
        PopupMenuItem<int>(value: 3, child: Text('ColorPicker')),
      ],
      elevation: 8.0,
    );
  }
}
