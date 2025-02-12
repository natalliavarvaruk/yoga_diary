import 'package:flutter/material.dart';
import 'package:yoga_diary/models/practice_entity.dart';

class PracticeSelector extends StatelessWidget {
  final Practices? value;
  final ValueChanged<Practices?> onChanged;

  const PracticeSelector({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Practices>(
      value: value,
      hint: Text("Select practice"),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withAlpha(20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: 'Select type of your practice',
      ),
      items: Practices.values
          .map((practice) => 
          DropdownMenuItem(
            value: practice, 
            child: Text(practice.toString().split('.').last)))
          .toList(),
          style: Theme.of(context).textTheme.bodyLarge,
      onChanged: onChanged,
      validator: (value) => value == null ? 'Please select a practice type' : null,
    );
  }
}
