
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
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: 
              AssetImage('assets/images/lotus_theme.webp'),
              fit: BoxFit.cover,
        
            ),
          ),
        ),
       Scaffold(
        appBar: AppBar(
          title: Text('Add your practice', style: Theme.of(context).textTheme.headlineSmall,),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              //select date
              Text('Select date'),
              
              //select type of practice - enum and drop down
              Text('Select practice'),
              //select emotion
              Text('How do you feel today'),
              //enter text about feels
              Text('Big text notes'),
            ],
          ),
          ),
      ),
      ]
    );
  }
}