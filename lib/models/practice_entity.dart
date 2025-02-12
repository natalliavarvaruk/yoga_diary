import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Moods {
  happy,
  sad,
  neutral,
  inspired, 
  tired,
}

extension MoodExtension on Moods {
  IconData get icon {
    return {
      Moods.happy: Icons.sentiment_very_satisfied,
      Moods.neutral: Icons.sentiment_neutral,
      Moods.sad: Icons.sentiment_very_dissatisfied,
      Moods.inspired: Icons.lightbulb,
      Moods.tired: Icons.bedtime,
    }[this]!;
  }

  String get displayName {
    return {
      Moods.happy: "Happy",
      Moods.neutral: "Neutral",
      Moods.sad: "Sad",
      Moods.inspired: "Inspired",
      Moods.tired: "Tired",
    }[this]!;
  }
}

enum Practices {
  hatha,
  vinjasa,
  meditation,
  pranajama,
}

extension PracticeExtension on Practices {
  String get displayName {
    return {
      Practices.hatha: "Hatha Yoga",
      Practices.vinjasa: "Vinyasa Yoga",
      Practices.meditation: "Meditation",
      Practices.pranajama: "Pranayama",
    }[this]!;
  }

  IconData get icon {
    return {
      Practices.hatha: Icons.self_improvement,
      Practices.vinjasa: Icons.sports_gymnastics,
      Practices.meditation: Icons.spa,
      Practices.pranajama: Icons.air,
    }[this]!;
  }
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
