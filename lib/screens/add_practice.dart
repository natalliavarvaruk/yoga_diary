
import 'package:flutter/material.dart';

class AddPracticeScreen extends StatefulWidget {
  const AddPracticeScreen({super.key});

  @override
  State<AddPracticeScreen> createState() {
    return _AddPracticeState();
  }
}

class _AddPracticeState extends State<AddPracticeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your practice'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            //select date
            //select type og practice - enum and drop down
            //select emotion
            //enter text about feels
          ],
        ),
        ),
    );
  }
}