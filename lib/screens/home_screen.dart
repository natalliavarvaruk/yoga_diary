import 'package:flutter/material.dart';
import 'package:yoga_diary/screens/add_practice.dart';
import 'package:yoga_diary/widgets/lotos_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your yoga diary'),
        actions: [
          IconButton(
            onPressed: () {}, //autorisation
            icon: Icon(Icons.account_circle),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text('Best practice time - TODAY!', style: Theme.of(context).textTheme.bodyLarge,)),

                Expanded(
                  child: LotosButton(onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => AddPracticeScreen()),
                    );
                  }),
                ),
              ],
            ),
            
            //calendar,
            
            //statistic,
          ],
        ),
      ),
    );
  }
}
