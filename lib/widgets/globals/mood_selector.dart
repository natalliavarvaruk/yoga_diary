//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_diary/providers/practice_provider.dart';
import 'package:yoga_diary/models/practice_entity.dart';

class MoodSelector extends ConsumerWidget {
  const MoodSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMood = ref.watch(currentPracticeProvider).mood;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: Moods.values.map((mood) {
        final isSelected = mood == selectedMood;

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => ref.read(currentPracticeProvider.notifier).setMood(mood),
          child: Column(
            children: [
              CircleAvatar(
                // 🔥 Теперь иконки в круглых кнопках
                radius: 28,
                backgroundColor: isSelected
                    ? Color(0xFF803AA9)//Color.fromARGB(155, 130, 60, 210)
                    : Colors.grey[200],
                child: Icon(
                  mood.icon,
                  size: 32,
                  color: isSelected ? Colors.white : Colors.grey,
                ),
              ),
              SizedBox(height: 6),
              Text(
                mood.displayName,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Color.fromARGB(255, 130, 60, 210): Colors.black,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
