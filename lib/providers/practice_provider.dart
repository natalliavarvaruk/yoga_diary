import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_diary/models/practice_entity.dart';

class PracticeNotifier extends StateNotifier<List<PracticeEntity>> {
  PracticeNotifier() : super([]);

  void addPractice(PracticeEntity practice) {
    state = [practice, ...state];
  }

  List<PracticeEntity> getPractice() {
    return state;
  }

  void removePractice(PracticeEntity practice) {}
}

class CurrentPracticeNotifier extends StateNotifier<PracticeEntity> {
  CurrentPracticeNotifier()
      : super(PracticeEntity(
            practiceTitle: Practices.hatha, date: "", mood: Moods.neutral));

  void setDate(String date) {
    state = state.copyWith(date: date);
  }

  void setPractice(Practices practice) {
    state = state.copyWith(practiceTitle: practice);
  }

  void setMood(Moods mood) {
    state = state.copyWith(mood: mood);
  }

  void setNotes(String notes) {
    state = state.copyWith(notes: notes);
  }

  void reset() {
    state = PracticeEntity(practiceTitle: Practices.hatha, date: '', mood: Moods.happy);
  }
}

final practiceProvider =
    StateNotifierProvider<PracticeNotifier, List<PracticeEntity>>(
        (ref) => PracticeNotifier());

final currentPracticeProvider =
    StateNotifierProvider<CurrentPracticeNotifier, PracticeEntity>(
        (ref) => CurrentPracticeNotifier());
