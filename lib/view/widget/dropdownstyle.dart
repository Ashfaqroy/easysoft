import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DropDownStyle1 extends StatefulWidget {
  DropDownStyle1({Key? key}) : super(key: key);
  @override
  DropDownStyle1State createState() => DropDownStyle1State();
}

class DropDownStyle1State extends State<DropDownStyle1> {
  TextEditingController _searchController = TextEditingController();
  //VisibilityPage({Key? key,required this.columnName}) : super(key: key);
  List searchList = List<String>.generate(100, (int index) => "ashfAq $index");
  List searchList3 = List<String>.generate(100, (int index) => "ashfaq $index");
  static var select = "";
  @override
  Widget build(BuildContext context) {
      _searchController.text=select;
    return AlertDialog(
      content: Card(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.1,
          width: MediaQuery.of(context).size.width / 1.2,
          child: Column(
            children: [
              Container(
                height: 50,
                child: TextFormField(
                  //controller: passwordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: "Search",
                      hintText: "Search",
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.green,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width: 20,
                              style: BorderStyle.solid))),
                  controller: _searchController,
                  onChanged: (value) {
                    searchList =
                        getSearchList(searchValue: _searchController.text);
                    if (value.length == 0) {
                      print("value is zero");
                    }
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: searchList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          select = "name";
                          Navigator.pop(context, "name");
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(searchList[index].toString()),
                                        Text(
                                          "SubTitle",
                                          style: TextStyle(
                                              fontSize: 13, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text("Name"),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getSearchList({required String searchValue}) {
    List searchList2 = [];
    searchList2.clear();
    searchList3.forEach((element) {
      if (element.toString().toLowerCase().contains(searchValue)) {
        searchList2.add(element);
      }
    });
    return searchList2;
  }
}
