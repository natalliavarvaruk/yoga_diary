import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_diary/screens/add_practice.dart';
import 'package:yoga_diary/widgets/home/calendar.dart';
import 'package:yoga_diary/widgets/home/daily_practices.dart';
import 'package:yoga_diary/widgets/home/home_statistic.dart';
import 'package:yoga_diary/widgets/home/lotos_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        //----background--
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: 
              AssetImage('assets/images/lotus_theme.webp'),
              fit: BoxFit.cover,
            ),
          ),
        ),

       Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text('Your yoga diary', style: Theme.of(context).textTheme.headlineSmall,),
          leading: 
            IconButton(
              onPressed: () {}, //autorisation
              icon: Icon(Icons.account_circle),
              color: Theme.of(context).primaryIconTheme.color,
            )
        ),

        body: 
           SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),

                      child: Text(
                        'Best practice time - TODAY!',
                        //textAlign: TextAlign.start, 
                        style: Theme.of(context).textTheme.bodyLarge,)),
          
                     LotosButton(onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => AddPracticeScreen()),
                        );
                      }),
                  ],
                ),
                
                
                //calendar,
                SizedBox(height: 40,),
                Calendar(),

                //statistic,
                SizedBox(height: 50,),
                Container(
                  //height: 200,
                  alignment: Alignment.topLeft,
                 
                  child: HomeStatistic(),
                  ),
                SizedBox(height: 10,),
                DailyPractices(),
              ],
            ),
          ),
        
       ),
      
      ],
    
    );
  }
}
