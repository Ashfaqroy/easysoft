import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

class DatePickerStyle1 extends StatefulWidget {
  const DatePickerStyle1({Key? key}) : super(key: key);

  @override
  _DatePickerStyle1State createState() => _DatePickerStyle1State();
}

class _DatePickerStyle1State extends State<DatePickerStyle1> {
  int selectedDay = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  List<int> months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  List<int> year = List<int>.generate(100, (int index) => 2000 + index);
  DateTime _currentDate = DateTime.now();
  CalendarCarousel _calendarCarousel = CalendarCarousel();
  @override
  void initState() {
    // TODO: implement initState
    _MyCalender();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          width: 300,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blue, width: 2)),
          child: Row(
            children: [
              Icon(CupertinoIcons.back),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 0),
                        child: GestureDetector(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Thisday",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            )),
                      );
                    }),
              ),
              Icon(CupertinoIcons.forward),
            ],
          ),
        ),
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
                DateFormat('yyyy-MM-dd').format(_currentDate).toString(),
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
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          width: 300,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blue, width: 2)),
          child: Row(
            children: [
              Icon(CupertinoIcons.back),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: year.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentDate =
                                    DateTime(year[index], selectedDay, 1);
                                //_calendarCarousel;
                                _MyCalender();
                                selectedYear = year[index];
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  year[index].toString(),
                                  style: TextStyle(
                                      fontSize:
                                          year[index] == selectedYear ? 30 : 25,
                                      fontWeight: FontWeight.bold,
                                      color: year[index] == selectedYear
                                          ? Colors.black
                                          : Colors.grey),
                                ),
                              ],
                            )),
                      );
                    }),
              ),
              Icon(CupertinoIcons.forward),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: _MyCalender(),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 2)),
              child: Row(
                children: [
                  Icon(CupertinoIcons.back),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: months.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _currentDate =
                                        DateTime(selectedYear, index + 1, 1);
                                    //_calendarCarousel;
                                    _MyCalender();
                                    selectedDay = index;
                                  });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      months[index].toString(),
                                      style: TextStyle(
                                          fontSize:
                                              index == selectedDay ? 30 : 25,
                                          fontWeight: FontWeight.bold,
                                          color: index == selectedDay
                                              ? Colors.black
                                              : Colors.grey),
                                    ),
                                    // Container(
                                    //  // margin: EdgeInsets.symmetric(vertical: 20 / 2),
                                    //   height: 6,
                                    //   width: 40,
                                    //   decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(10),
                                    //     color: index == selectedDay
                                    //         ? Colors.black
                                    //         : Colors.transparent,
                                    //   ),
                                    // )
                                  ],
                                )),
                          );
                        }),
                  ),
                  Icon(CupertinoIcons.forward),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  _MyCalender() {
    return CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        setState(() => _currentDate = date);
      },
      maxSelectedDate: DateTime(2050),
      minSelectedDate: DateTime(2000),
      //onCalendarChanged: ,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      selectedDateTime: _currentDate,
      targetDateTime: _currentDate,
      showIconBehindDayText: false,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      height: 280,
      width: 230,
      daysHaveCircularBorder: false,
    );
  }
}

class DatePickerStyle2 extends StatefulWidget {
  const DatePickerStyle2({Key? key}) : super(key: key);

  @override
  _DatePickerStyle2State createState() => _DatePickerStyle2State();
}

class _DatePickerStyle2State extends State<DatePickerStyle2> {
  int selectedDay = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  List<int> months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  List<int> year = List<int>.generate(100, (int index) => 2000 + index);
  DateTime _currentDate = DateTime.now();
  int selectedDay2 = DateTime.now().month;
  int selectedYear2 = DateTime.now().year;
  List<int> months2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  List<int> year2 = List<int>.generate(100, (int index) => 2000 + index);
  DateTime _currentDate2 = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    _MyCalender();
    _MyCalender2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            width: 300,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blue, width: 2)),
            child: Row(
              children: [
                Icon(CupertinoIcons.back),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 0),
                          child: GestureDetector(
                              onTap: () {},
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Thisday",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              )),
                        );
                      }),
                ),
                Icon(CupertinoIcons.forward),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "From",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      DateFormat('yyyy-MM-dd').format(_currentDate).toString(),
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
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
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2)),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.back),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: year.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 0),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _currentDate =
                                          DateTime(year[index], selectedDay, 1);
                                      //_calendarCarousel;
                                      _MyCalender();
                                      selectedYear = year[index];
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        year[index].toString(),
                                        style: TextStyle(
                                            fontSize:
                                                year[index] == selectedYear
                                                    ? 30
                                                    : 25,
                                            fontWeight: FontWeight.bold,
                                            color: year[index] == selectedYear
                                                ? Colors.black
                                                : Colors.grey),
                                      ),
                                    ],
                                  )),
                            );
                          }),
                    ),
                    Icon(CupertinoIcons.forward),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: _MyCalender(),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 2)),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.back),
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: months.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 0),
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _currentDate = DateTime(
                                              selectedYear, index + 1, 1);
                                          //_calendarCarousel;
                                          _MyCalender();
                                          selectedDay = index;
                                        });
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            months[index].toString(),
                                            style: TextStyle(
                                                fontSize: index == selectedDay
                                                    ? 30
                                                    : 25,
                                                fontWeight: FontWeight.bold,
                                                color: index == selectedDay
                                                    ? Colors.black
                                                    : Colors.grey),
                                          ),
                                          // Container(
                                          //  // margin: EdgeInsets.symmetric(vertical: 20 / 2),
                                          //   height: 6,
                                          //   width: 40,
                                          //   decoration: BoxDecoration(
                                          //     borderRadius: BorderRadius.circular(10),
                                          //     color: index == selectedDay
                                          //         ? Colors.black
                                          //         : Colors.transparent,
                                          //   ),
                                          // )
                                        ],
                                      )),
                                );
                              }),
                        ),
                        Icon(CupertinoIcons.forward),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "To",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      DateFormat('yyyy-MM-dd').format(_currentDate2).toString(),
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
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
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2)),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.back),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: year.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 0),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _currentDate = DateTime(
                                          year2[index], selectedDay2, 1);
                                      //_calendarCarousel;
                                      _MyCalender2();
                                      selectedYear2 = year2[index];
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        year2[index].toString(),
                                        style: TextStyle(
                                            fontSize:
                                                year2[index] == selectedYear2
                                                    ? 30
                                                    : 25,
                                            fontWeight: FontWeight.bold,
                                            color: year2[index] == selectedYear2
                                                ? Colors.black
                                                : Colors.grey),
                                      ),
                                    ],
                                  )),
                            );
                          }),
                    ),
                    Icon(CupertinoIcons.forward),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: _MyCalender2(),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 2)),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.back),
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: months.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 0),
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _currentDate2 = DateTime(
                                              selectedYear2, index + 1, 1);
                                          //_calendarCarousel;
                                          _MyCalender2();
                                          selectedDay2 = index;
                                        });
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            months2[index].toString(),
                                            style: TextStyle(
                                                fontSize: index == selectedDay2
                                                    ? 30
                                                    : 25,
                                                fontWeight: FontWeight.bold,
                                                color: index == selectedDay2
                                                    ? Colors.black
                                                    : Colors.grey),
                                          ),
                                        ],
                                      )),
                                );
                              }),
                        ),
                        Icon(CupertinoIcons.forward),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _MyCalender() {
    return CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        setState(() => _currentDate = date);
      },
      maxSelectedDate: DateTime(2050),
      minSelectedDate: DateTime(2000),
      //onCalendarChanged: ,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      selectedDateTime: _currentDate,
      targetDateTime: _currentDate,
      showIconBehindDayText: false,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      height: 350,
      width: 300,
      daysHaveCircularBorder: false,
    );
  }

  _MyCalender2() {
    return CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        setState(() => _currentDate2 = date);
      },
      maxSelectedDate: DateTime(2050),
      minSelectedDate: DateTime(2000),
      //onCalendarChanged: ,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      selectedDateTime: _currentDate2,
      targetDateTime: _currentDate2,
      showIconBehindDayText: false,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      height: 350,
      width: 300,
      daysHaveCircularBorder: false,
    );
  }
}
