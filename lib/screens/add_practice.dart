import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_diary/models/practice_entity.dart';
import 'package:yoga_diary/providers/practice_provider.dart';
import 'package:yoga_diary/widgets/globals/date_picker_field.dart';
import 'package:yoga_diary/widgets/globals/practice_selector.dart';
import 'package:yoga_diary/widgets/globals/mood_selector.dart';
import 'package:yoga_diary/widgets/globals/notes_field.dart';
import 'package:yoga_diary/widgets/globals/save_button.dart';

class AddPracticeScreen extends ConsumerWidget {
  AddPracticeScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      String formattedDate = picked.toString().split(' ')[0];
      ref.read(currentPracticeProvider.notifier).setDate(formattedDate);
      _dateController.text = formattedDate;
    }
  }

  void _savePractice(BuildContext context, WidgetRef ref) {
    final practiceState = ref.read(currentPracticeProvider);

    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    final newPractice = PracticeEntity(
      practiceTitle: practiceState.practiceTitle,
      date: practiceState.date,
      mood: practiceState.mood,
      notes: practiceState.notes,
    );

    ref.read(practiceProvider.notifier).addPractice(newPractice);
    ref.read(currentPracticeProvider.notifier).reset();

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final practice = ref.watch(currentPracticeProvider);

    _dateController.text = practice.date;
    _notesController.text = practice.notes ?? "";

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/lotus_theme.webp'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Add your practice',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //select date
                  DatePickerField(
                    controller: _dateController,
                    onTap: () => _selectDate(context, ref),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  //select type of practice - enum and drop down
                  //Text('Select practice'),
                  PracticeSelector(
                      value: practice.practiceTitle,
                      onChanged: (v) => ref
                          .read(currentPracticeProvider.notifier)
                          .setPractice(v!)),
                  //select emotion
                  //Text('How do you feel today'),
                  SizedBox(
                    height: 16,
                  ),
                  MoodSelector(
                      value: practice.mood,
                      onChanged: (v) => ref
                          .read(currentPracticeProvider.notifier)
                          .setMood(v!)),
                  //enter text about feels
                  //Text('Big text notes'),
                  SizedBox(
                    height: 16,
                  ),
                  NotesField(
                    controller: _notesController,
                    onChanged: (text) => ref
                        .read(currentPracticeProvider.notifier)
                        .setNotes(text!),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SaveButton(onPressed: _savePractice),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
