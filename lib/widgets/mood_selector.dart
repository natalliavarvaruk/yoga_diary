import 'package:flutter/material.dart';
import 'package:yoga_diary/models/practice_entity.dart';

class MoodSelector extends StatelessWidget {
  final Moods? value;
  final ValueChanged<Moods?> onChanged;

  const MoodSelector(
    {super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Moods>(
      value: value,
      hint: Text("How do you feel today?"),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withAlpha(20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      items: Moods.values
          .map((mood) => DropdownMenuItem(value: mood, child: Text(mood.toString().split('.').last)))
          .toList(),
      style: Theme.of(context).textTheme.bodyLarge,
      onChanged: onChanged,
      validator: (value) => value == null ? 'Please select your mood' : null,
    );
  }
}
