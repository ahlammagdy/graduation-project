import 'dart:math';

import 'package:flutter/material.dart';

class StaticClassLevel3 {
  final int trainigId;
  //final String caseName;
  final String diagnosies;
  final String medicen;

  StaticClassLevel3(
      {required this.trainigId,
      //required this.caseName,
      required this.diagnosies,
      required this.medicen});
}

class Level3 extends StatefulWidget {
  const Level3({super.key});

  @override
  State<Level3> createState() => _Level3State();
}

class _Level3State extends State<Level3> {
  int index = 0;

  List<Widget> items = [
    TextFormField(
      decoration: const InputDecoration(
          hintText: "answer here", filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.text,
    ),
    TextFormField(
      decoration: const InputDecoration(
          hintText: "answer here", filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.text,
    ),
  ];

  void _addNewItem() {
    setState(() {
      //int newItemIndex = items.length + 1;
      items.add(
        TextFormField(
          decoration: const InputDecoration(
              hintText: "answer here", filled: true, fillColor: Colors.white),
          keyboardType: TextInputType.text,
        ),
      );
    });
  }

  void _removeItem() {
    setState(() {
      //int newItemIndex = items.length + 1;
      items.removeLast();
    });
  }

//SingleChildScrollView
  @override
  Widget build(BuildContext context) {
    List<StaticClassLevel3> dummStaticLevel1list = [
      StaticClassLevel3(
        // caseName: 'Blue water',
        diagnosies:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        medicen:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        trainigId: 1,
      ),
      StaticClassLevel3(
        //caseName: 'case 1',
        diagnosies:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        medicen:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        trainigId: 1,
      ),
      StaticClassLevel3(
        //caseName: 'case 2',
        diagnosies:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        medicen: ' f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        trainigId: 2,
      ),
      StaticClassLevel3(
        // caseName: 'case 3',
        diagnosies: ' fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        medicen:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        trainigId: 3,
      ),
      StaticClassLevel3(
        //caseName: 'case 5',
        diagnosies:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        medicen:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        trainigId: 5,
      ),
      StaticClassLevel3(
        //caseName: 'case 6',
        diagnosies:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner vfmvkre ergknerr rgkner',
        medicen:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        trainigId: 6,
      ),
      StaticClassLevel3(
//caseName: 'case 7',
        diagnosies:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        medicen:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        trainigId: 7,
      ),
      StaticClassLevel3(
        //: 'case 8',
        diagnosies:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        medicen:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        trainigId: 8,
      ),
      StaticClassLevel3(
        //caseName: 'case 9',
        diagnosies:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        medicen:
            'adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner',
        trainigId: 9,
      )
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "What is the case name?,determine which of the following medicen isn't suitable for this case?",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: AutofillHints.jobTitle,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Center(
              child: Container(
                width: 300.0,
                decoration: BoxDecoration(
                    //boxShadow: [] ,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[300]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        "Case Name/ ... ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: AutofillHints.jobTitle,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Diagnosies /",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: AutofillHints.jobTitle,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        dummStaticLevel1list[index].diagnosies,
                        maxLines: 20,
                        style: const TextStyle(
                            fontFamily: 'Mr Dafoe', fontSize: 20.0),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "Medicen /",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: AutofillHints.jobTitle,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        dummStaticLevel1list[index].medicen,
                        maxLines: 20,
                        style: const TextStyle(
                            fontFamily: 'Mr Dafoe', fontSize: 20.0),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text("Warning"),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            const Text(
                                                'viewing the answer will give you a bad rate'),
                                            TextButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialog(
                                                                title: const Text(
                                                                    " The Answer"),
                                                                content:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    children: [
                                                                      const ListTile(
                                                                        title: Text(
                                                                            '1- treatment1'),
                                                                      ),
                                                                      const ListTile(
                                                                        title: Text(
                                                                            '1- treatment1'),
                                                                      ),
                                                                      const ListTile(
                                                                        title: Text(
                                                                            '1- treatment1'),
                                                                      ),
                                                                      TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              const Text("Ok"))
                                                                    ],
                                                                  ),
                                                                ),
                                                              ));
                                                },
                                                child: const Text("View"))
                                          ],
                                        ),
                                      ),
                                    ));
                          },
                          child: const Text("don't know?",
                              style: TextStyle(
                                color: Colors.red,
                                // fontWeight: FontWeight.bold,
                                // fontSize: 20.0,
                              ))),
                      TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text("write your feedback"),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              decoration: const InputDecoration(
                                                  hintText: "answer here",
                                                  filled: true,
                                                  fillColor: Colors.white),
                                              keyboardType: TextInputType.text,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("send"))
                                          ],
                                        ),
                                      ),
                                    ));
                          },
                          child: const Text(
                            "Feedback",
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                  const Expanded(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.indigo,
                          radius: 30.0,
                          child: Text(
                            "1",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "Rate",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          index = Random().nextInt(dummStaticLevel1list.length);
                        });
                      },
                      child: const Text("New Training",
                          style: TextStyle(
                            color: Colors.black,
                          )))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "case name",
                    filled: true,
                    fillColor: Colors.white),
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      _addNewItem();
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.indigo,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _removeItem();
                    },
                    icon: const Icon(
                      Icons.remove_circle_rounded,
                      color: Colors.indigo,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: items[index],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    "Send Answer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
