import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_diary/providers/practice_provider.dart';
import 'package:yoga_diary/providers/selected_date_provider.dart';

class DailyPractices extends ConsumerWidget{
  const DailyPractices({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final practices = ref.watch(practiceProvider);

    final dailyPractices = practices
        .where((practice) => practice.date == selectedDate.toString().split(' ')[0])
        .toList();
    
    return Container(
            child: dailyPractices.isEmpty
              ? Center(child: Text("No practice for this day"))
              : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dailyPractices.length,
                  itemBuilder: (context, index) {
                    final practice = dailyPractices[index];
                    return ListTile(
                      title: Text(
                          practice.practiceTitle.toString().split('.').last),
                      subtitle: Text(
                          "Mood: ${practice.mood.toString().split('.').last}"),
                      leading: Icon(Icons.self_improvement, color: Colors.pink),
                    );
                  },
                ),
          );
    
  }
}