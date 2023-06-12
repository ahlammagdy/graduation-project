import 'package:flutter/material.dart';

import '../widgets/menu_widget.dart';
import 'static_training_level1.dart';
import 'static_training_level2.dart';
import 'static_training_level3.dart';

class StaticTraining extends StatefulWidget {
  const StaticTraining({super.key});

  @override
  State<StaticTraining> createState() => _StaticTrainingState();
}

class _StaticTrainingState extends State<StaticTraining> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: Colors.red,
          leading: const MenuWidget(),
          title: const Text(
            "Static Training",
            style: TextStyle(
              color: Colors.white,
              fontFamily: AutofillHints.jobTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            Row(
              children: [
                Icon(
                  Icons.model_training,
                  size: 25,
                ),
                SizedBox(
                  width: 10.0,
                )
              ],
            )
          ],
          bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text("Level 1"),
                ),
                Tab(
                  child: Text("Level 2"),
                ),
                Tab(
                  child: Text("Level 3"),
                )
              ]),
        ),
        body: const TabBarView(children: [Level1(), Level2(), Level3()]),
      ),
    );
  }
}
