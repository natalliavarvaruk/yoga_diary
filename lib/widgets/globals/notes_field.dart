import 'package:flutter/material.dart';

class NotesField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String?> onChanged; 

  const NotesField(
    {super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 4,
      decoration: InputDecoration(
        labelText: 'Your thoughts and reflections',
        labelStyle: TextStyle(color: Color(0xFF803AA9)),
        

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
      ),
      onChanged: onChanged,
    );
  }
}
