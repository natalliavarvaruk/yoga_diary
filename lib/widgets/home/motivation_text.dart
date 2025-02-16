import 'package:flutter/material.dart';

class MotivationText extends StatelessWidget {
  const MotivationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        'Best practice time - TODAY!',
        //textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
      ),
    );
  }
}
