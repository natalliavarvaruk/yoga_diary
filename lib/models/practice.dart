
import 'package:uuid/uuid.dart';
import 'dart:io';

enum Moods{
  happy,
  sad,
  neutral,
}

const uuid = Uuid();

class PracticeItem {
  PracticeItem ({
    String? id,
    required this.title,
    required this.date,
    required this.mood,
  }) : 
  id = id ?? uuid.v4(),
  notes = '';

  final String id;
  final String title;
  final String date;
  final Moods mood;
  final String notes;

}