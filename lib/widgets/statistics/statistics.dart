import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_diary/providers/practice_provider.dart';
import 'package:yoga_diary/models/practice_entity.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final practices = ref.watch(practiceProvider); // Получаем список практик

    // 📊 Количество практик по настроению
    int happyCount = practices.where((p) => p.mood == Moods.happy).length;
    int neutralCount = practices.where((p) => p.mood == Moods.neutral).length;
    int sadCount = practices.where((p) => p.mood == Moods.sad).length;

    return Scaffold(
      appBar: AppBar(title: Text("Статистика")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Всего практик: ${practices.length}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text("Счастливых дней: $happyCount", style: TextStyle(color: Colors.green)),
            Text("Нейтральных дней: $neutralCount", style: TextStyle(color: Colors.grey)),
            Text("Грустных дней: $sadCount", style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
