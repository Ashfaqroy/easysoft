import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class CommnControll {
  static TextBoxStyle1(
      {required String hint, required TextEditingController controller}) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          //prefixIcon: Icon(Icons.email),
          hintText: hint,

          /// Dropdown data get from Account1Type
          //labelText: "Enter Email or password",
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.green,
        ));
  }

  static ButtonStyle1(
      {required String buttonText, required Function buttonFunction}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.black, // background
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ) // foreground
            ),
        onPressed: () => buttonFunction,
        child: Text(buttonText));
  }

  static DatePickerStyle1(
      // {required String buttonText, required Function buttonFunction}
      ) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 50,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Text(
                "From",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                "2021-08-15",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 300,
          height: 40,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.blue, width: 2)),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("202$index"),
                );
              }),
        ),
        SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: CalendarCarousel<Event>(
                onDayPressed: (DateTime date, List<Event> events) {
                  // this.setState(() => _currentDate = date);
                },
                selectedDateTime: DateTime(
                  2019,
                ),
                weekendTextStyle: TextStyle(
                  color: Colors.red,
                ),
                thisMonthDayBorderColor: Colors.grey,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
                customDayBuilder: (
                  /// you can provide your own build function to make custom day containers
                  bool isSelectable,
                  int index,
                  bool isSelectedDay,
                  bool isToday,
                  bool isPrevMonthDay,
                  TextStyle textStyle,
                  bool isNextMonthDay,
                  bool isThisMonthDay,
                  DateTime day,
                ) {
                  /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
                  /// This way you can build custom containers for specific days only, leaving rest as default.

                  // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
                  if (day.day == 15) {
                    return Center(
                      child: Icon(Icons.local_airport),
                    );
                  } else {
                    return null;
                  }
                },
                weekFormat: false,
                // markedDatesMap: _markedDateMap,
                height: 320.0,
                width: 300,
                //selectedDateTime: _currentDate,
                daysHaveCircularBorder: false,

                /// null for not rendering any border, true for circular border, false for rectangular border
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 2)),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${index + 1}"),
                    );
                  }),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 300,
          height: 30,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.blue, width: 2)),
        ),
      ],
    );
  }
}
