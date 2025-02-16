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
      lastDate: DateTime(2135),
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

    return 
        // Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/images/lotus_theme.webp'),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        Scaffold(
          extendBodyBehindAppBar: true, // 🔥 Делаем фон на весь экран
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Add your practice',
              style: TextStyle(color: Colors.white, fontSize: 24), //Theme.of(context).textTheme.headlineSmall,
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () => Navigator.of(context).pop(), 
              ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFCA9597),
                  Color(0xffEDF0ED),
                ],
                )

            ),
            //alignment: Alignment.topLeft,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
              child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              //padding: EdgeInsets.only(top: kToolbarHeight+46, left: 16, right: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 26),
                    DatePickerField(
                      controller: _dateController,
                      onTap: () => _selectDate(context, ref),
                    ),
            
                    const SizedBox(height: 26),
                    PracticeSelector(
                        value: practice.practiceTitle,
                        onChanged: (v) => ref
                            .read(currentPracticeProvider.notifier)
                            .setPractice(v!)),
                    const SizedBox(height: 26),
                    Text(
                      'How do you feel today?', 
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      //textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MoodSelector(),
                    const SizedBox(
                      height: 36,
                    ),
                    NotesField(
                      controller: _notesController,
                      onChanged: (text) => ref
                          .read(currentPracticeProvider.notifier)
                          .setNotes(text!),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Center(child: SaveButton(onPressed: _savePractice)),
                  ],
                ),
              ),
            ),
          ),
        ),
          ),
        );
  }
}
