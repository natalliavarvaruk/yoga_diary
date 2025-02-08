import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SaveButton extends StatelessWidget {
   final void Function(BuildContext, WidgetRef) onPressed;

  const SaveButton(
    {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child){
      return ElevatedButton(
        onPressed: () => onPressed(context,ref),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(37, 252, 230, 250),
          padding: EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text("Save Practice", style: Theme.of(context).textTheme.labelLarge,),
        
      );
      },
    );
  }
}
