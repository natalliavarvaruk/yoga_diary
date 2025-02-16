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
      return TextButton(
        
        onPressed: () => onPressed(context,ref),
        style: TextButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 30, 4, 45),
          backgroundColor: Color(0xFF803AA9),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          //alignment: Alignment.center
        ),
        child: Text("Save Practice", style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),),
        
      );
      },
    );
  }
}
