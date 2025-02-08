import 'package:uuid/uuid.dart';

enum Moods {
  happy,
  sad,
  neutral,
}

enum Practices {
  hatha,
  vinjasa,
  meditation,
  pranajama,
}

const uuid = Uuid();

class PracticeEntity {
  PracticeEntity({
    String? id,
    required this.practiceTitle,
    required this.date,
    required this.mood,
    this.notes,
  }) : id = id ?? uuid.v4();

  final String id;
  final Practices practiceTitle;
  final String date;
  final Moods mood;
  final String? notes;


  PracticeEntity copyWith({
    String? id,
    Practices? practiceTitle,
    String? date,
    Moods? mood,
    String? notes,
  }) {
    return PracticeEntity(
      id: id ?? this.id,
      practiceTitle: practiceTitle ?? this.practiceTitle,
      date: date ?? this.date,
      mood: mood ?? this.mood,
      notes: notes ?? this.notes,
    );
  }
}
