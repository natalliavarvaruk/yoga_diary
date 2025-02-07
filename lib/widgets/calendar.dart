import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yoga_diary/models/practice.dart';


class Calendar extends StatefulWidget{
  const Calendar({super.key});

  @override
  State<Calendar> createState() {
    return _CalendarState();
  }
}

class _CalendarState extends State<Calendar>{
  DateTime today = DateTime.now();
  DateTime firstDay = DateTime.utc(2025, 01 ,01);
  final DateTime lastDay = DateTime.utc(2026, 01 ,01);
  DateTime? _selectedDate;
  //store the events created
  Map<DateTime, List<PracticeItem>> events = {};

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //Text('Selected day = ${today.toString().split(" ")[0]}'),
            Container(
              alignment: Alignment.topCenter,
              height: 300,
              color: const Color.fromARGB(37, 252, 230, 250),
              child: TableCalendar(
                
                rowHeight: 40,
                headerStyle: 
                  HeaderStyle(formatButtonVisible: false, titleCentered: true,),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                startingDayOfWeek: StartingDayOfWeek.monday,
                focusedDay: today, 
                firstDay: firstDay, 
                lastDay: lastDay,
                onDaySelected: _onDaySelected,
                ),
            ),
          ],
        ),
      ),
    );
  }
}