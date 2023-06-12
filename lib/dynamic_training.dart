import 'package:flutter/material.dart';
import 'package:smo/smo_dummy_data.dart';
import 'package:smo/widgets/dynamic_training_ui.dart';

import 'search_page.dart';
import 'widgets/menu_widget.dart';

class DynamicTraining extends StatefulWidget {
  const DynamicTraining({super.key});

  @override
  State<DynamicTraining> createState() => _DynamicTrainingState();
}

class _DynamicTrainingState extends State<DynamicTraining> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: Colors.red,
          leading: const MenuWidget(),
          title: const Text(
            "Dynamic Training",
            style: TextStyle(
              color: Colors.white,
              fontFamily: AutofillHints.jobTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey[300],
              child: IconButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const Addtraining()));
                },
                icon: const Icon(
                  Icons.add,
                  size: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            CircleAvatar(
              radius: 20.0,
              backgroundColor: const Color(0xFFe9eaec),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage()));
                },
                icon: const Icon(
                  Icons.search,
                  size: 17.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
              children: dummyDynamicPostCaseList
                  .map((trainingData) => DynamicTrainingUI(
                        casedescription: trainingData.casedescription,
                        date: trainingData.date,
                        diagnosis: trainingData.diagnosis,
                        dynamicTrainingId: trainingData.dynamicTrainingId,
                        medcine: trainingData.medcine,
                        pageName: trainingData.pageName,
                        requiments: trainingData.requiments,
                        profilePictureURL: trainingData.profilePictureURL,
                      ))
                  .toList()),
        ));
  }
}
