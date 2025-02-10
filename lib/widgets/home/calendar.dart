import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yoga_diary/models/practice_entity.dart';
import 'package:yoga_diary/providers/practice_provider.dart';
import 'package:yoga_diary/providers/selected_date_provider.dart';

class Calendar extends ConsumerWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime today = DateTime.now();
    DateTime firstDay = DateTime.utc(2025, 01, 01);
    final DateTime lastDay = DateTime.utc(2100, 01, 01);
    final selectedDate = ref.watch(selectedDateProvider);
    final practices = ref.watch(practiceProvider);

    final dailyPractices = practices
        .where((practice) => practice.date == selectedDate.toString().split(' ')[0])
        .toList();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          //Text('Selected day = ${today.toString().split(" ")[0]}'),
          Container(
            alignment: Alignment.topCenter,
            height: 300,
            decoration: BoxDecoration(
              color: const Color.fromARGB(37, 252, 230, 250),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TableCalendar(
                rowHeight: 40,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, selectedDate),
                startingDayOfWeek: StartingDayOfWeek.monday,
                focusedDay: selectedDate,
                firstDay: firstDay,
                lastDay: lastDay,
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, date, events) {
                    final hasPractice = practices
                        .any((p) => p.date == date.toString().split(' ')[0]);
                    return hasPractice
                        ? Positioned(
                            bottom: 5,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.pink[400],
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                        : null;
                  },
                ),

                onDaySelected: (day, focusedDay) =>
                    ref.read(selectedDateProvider.notifier).state = day),
          ),

          // Container(
          //   child: dailyPractices.isEmpty
          //     ? Center(child: Text("No practice for this day"))
          //     : ListView.builder(
          //         itemCount: dailyPractices.length,
          //         itemBuilder: (context, index) {
          //           final practice = dailyPractices[index];
          //           return ListTile(
          //             title: Text(
          //                 practice.practiceTitle.toString().split('.').last),
          //             subtitle: Text(
          //                 "Mood: ${practice.mood.toString().split('.').last}"),
          //             leading: Icon(Icons.self_improvement, color: Colors.pink),
          //           );
          //         },
          //       ),
          // ),
        ],
      ),
    );
  }
}
