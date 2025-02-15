import 'package:flutter/material.dart';

class DatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;

  const DatePickerField(
      {super.key, required this.controller, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Date of your practice',
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(Icons.calendar_today, color: Color.fromARGB(255, 110, 62, 159,),),
        filled: true,
        fillColor: const Color.fromARGB(255, 246, 218, 218).withValues(alpha: 0.2),
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
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.pink.shade100),
        )
        
      ),
      readOnly: true,
      onTap: onTap,
      validator: (value) => value!.isEmpty ? 'Please select a date' : null,
    );
  }
}
