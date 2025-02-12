import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_diary/screens/add_practice.dart';
import 'package:yoga_diary/widgets/home/calendar.dart';
import 'package:yoga_diary/widgets/home/daily_practices.dart';
import 'package:yoga_diary/widgets/home/home_app_bar.dart';
import 'package:yoga_diary/widgets/home/home_statistic.dart';
import 'package:yoga_diary/widgets/home/lotos_button.dart';
import 'package:yoga_diary/widgets/home/motivation_text.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        //----background--
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/lotus_theme.webp'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: HomeAppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MotivationText(),
                    LotosButton(onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => AddPracticeScreen()),
                      );
                    }),
                  ],
                ),

                //calendar,
                SizedBox(
                  height: 20,
                ),
                Calendar(),

                //statistic,
                SizedBox(
                  height: 50,
                ),
                // Text(
                //   "Statistics",
                //   style: Theme.of(context).textTheme.headlineSmall,
                //   textAlign: TextAlign.start,
                // ),
                Container(
                  //height: 200,
                  alignment: Alignment.topLeft,
                  child: HomeStatistic(),
                ),
                SizedBox(
                  height: 10,
                ),
                //Text("Сегодняшние практики", style: Theme.of(context).textTheme.headlineSmall), 
      
                DailyPractices(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
