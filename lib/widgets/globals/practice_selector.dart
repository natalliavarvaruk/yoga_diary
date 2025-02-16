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
      dropdownColor: Color(0xFFDBCECA),
      icon: Icon(Icons.self_improvement, color: Color(0xFF803AA9)),
      //menuMaxHeight: 250, // 🔥 Ограничиваем высоту дропдауна, чтобы он не был огромным
      //alignment: Alignment.centerLeft,
      //isExpanded: false,

      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withAlpha(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)
          ),
          enabledBorder: OutlineInputBorder( 
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
          ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)
        ),
        labelText: 'Select type of your practice',
        labelStyle: TextStyle(color: Colors.white)
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
