import 'package:flutter/material.dart';
import 'package:slide_popup_dialog_null_safety/slide_dialog.dart';

class DynamicTrainingUI extends StatefulWidget {
  final String profilePictureURL;
  final int dynamicTrainingId;
  final String casedescription;
  final String diagnosis;
  final String medcine;
  final String requiments;
  final String pageName;
  final String date;

  const DynamicTrainingUI(
      {super.key,
      required this.profilePictureURL,
      required this.dynamicTrainingId,
      required this.casedescription,
      required this.diagnosis,
      required this.medcine,
      required this.requiments,
      required this.pageName,
      required this.date});

  @override
  State<DynamicTrainingUI> createState() => _DynamicTrainingUIState();
}

class _DynamicTrainingUIState extends State<DynamicTrainingUI> {
  bool diagnosisCom = false;
  bool medcineCom = false;
  bool requimentsCom = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: const AssetImage("images/person.png"),
              foregroundImage: AssetImage(widget.profilePictureURL),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.pageName,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.date,
                  style: const TextStyle(
                    fontSize: 10.0,
                  ),
                )
              ],
            ),
            Expanded(
                child: Container(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SlideDialog(
                            backgroundColor: Colors.white,
                            pillColor: Colors.black.withOpacity(0.7),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.edit),
                                  title: const Text("Edit"),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: const Icon(
                                      Icons.highlight_remove_rounded),
                                  title: const Text("Remove"),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: const Icon(
                                      Icons.report_gmailerrorred_outlined),
                                  title: const Text("Inform"),
                                  onTap: () {},
                                )
                              ],
                            ));
                      },
                    );
                  },
                  icon: const Icon(Icons.more_vert_rounded)),
            ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[300]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "Case Description /",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: AutofillHints.jobTitle,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.casedescription,
                    maxLines: 20,
                    // style: TextStyle(fontSize: 20.0),
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Diagnosis / ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: AutofillHints.jobTitle,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              SizedBox(width: 5),
                              Text("0", style: TextStyle(color: Colors.indigo)),
                            ],
                          ))
                    ],
                  ),
                  Text(
                    widget.diagnosis,
                    maxLines: 20,
                    //style:TextStyle(fontSize: 20.0),
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Meddicen / ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: AutofillHints.jobTitle,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              SizedBox(width: 5),
                              Text("0", style: TextStyle(color: Colors.indigo)),
                            ],
                          ))
                    ],
                  ),
                  Text(
                    widget.medcine,
                    maxLines: 20,
                    //style:TextStyle(fontSize: 20.0),
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Requirments / ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: AutofillHints.jobTitle,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              SizedBox(width: 5),
                              Text("0", style: TextStyle(color: Colors.indigo)),
                            ],
                          ))
                    ],
                  ),
                  Text(
                    widget.requiments, maxLines: 20,
                    //style:TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 1.0,
          width: double.infinity,
          color: Colors.black12,
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "general comment",
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.comment_rounded,
                      size: 20.0,
                      color: Colors.indigo,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      useSafeArea: true,
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(children: [
                                CheckboxListTile(
                                  title: const Text('Diagnosis'),
                                  value: diagnosisCom,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      diagnosisCom = value!;
                                    });
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      //suffixIcon: Icon(iconData) ,
                                      hintText: "diagnosis comment",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white),
                                ),
                                CheckboxListTile(
                                  title: const Text('Medicen'),
                                  value: medcineCom,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      medcineCom = value!;
                                    });
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      //suffixIcon: Icon(iconData) ,
                                      hintText: "medicen comment",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white),
                                ),
                                CheckboxListTile(
                                  title: const Text('Requirments'),
                                  value: requimentsCom,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      requimentsCom = value!;
                                    });
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      //suffixIcon: Icon(iconData) ,
                                      hintText: "requirment comment",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Send",
                                        style: TextStyle(
                                          color: Colors.indigo,
                                        ))),
                                const SizedBox(
                                  height: 200,
                                ),
                              ]),
                            ),
                          );
                        });
                      });
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "training comment",
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.note_alt,
                      size: 20.0,
                      color: Colors.indigo,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 4.0,
          width: double.infinity,
          color: Colors.black12,
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
