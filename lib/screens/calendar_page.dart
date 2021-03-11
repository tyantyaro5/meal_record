import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:toast/toast.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  EventList<Event> _markedDateMap = EventList<Event>();
  DateTime _currentDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("カレンダー"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: CalendarCarousel<Event>(
          locale: "JA",
          onDayPressed: onDayPressed,
          weekendTextStyle: TextStyle(color: Colors.red),
          thisMonthDayBorderColor: Colors.grey,
          weekFormat: false,
          height: 420.0,
          selectedDateTime: _currentDate,
          daysHaveCircularBorder: false,
          customGridViewPhysics: NeverScrollableScrollPhysics(),
          markedDatesMap: _markedDateMap,
          // 追加
          markedDateShowIcon: true,
          markedDateIconMaxShown: 2,
          todayTextStyle: TextStyle(
            color: Colors.blue,
          ),
          markedDateIconBuilder: (event) {
            return event.icon;
          },
          todayBorderColor: Colors.green,
          markedDateMoreShowTotal: false),
    );
  }


  onDayPressed(DateTime date, List<Event> events) {
    this.setState(() => _currentDate = date);
    Toast.show("$date", context, duration: Toast.LENGTH_LONG);
  }
}
