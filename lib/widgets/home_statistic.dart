
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_diary/providers/practice_provider.dart';

class HomeStatistic extends ConsumerWidget{
  const HomeStatistic({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final practices = ref.watch(practiceProvider);
    int totalPractices = practices.length;
    String lastPracticeDate = practices.isNotEmpty ? practices.first.date : "No practices yet";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Total practices: $totalPractices',
        style: Theme.of(context).textTheme.bodyLarge, ),

        SizedBox(height: 8,),
        Text(
          'Last practice: $lastPracticeDate',
           style: Theme.of(context).textTheme.bodyLarge,
        ),

      ],
    );
  }
}