import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:slide_popup_dialog_null_safety/slide_dialog.dart';

import 'widgets/component.dart';
import 'screens/commentsccc.dart';

class InterestedHome extends StatefulWidget {
  const InterestedHome({super.key});

  @override
  State<InterestedHome> createState() => _InterestedHomeState();
}

var counterUp = 0;
var counterDown = 0;

class _InterestedHomeState extends State<InterestedHome> {
  double _rating = 0.0;
  bool _isRatingBarVisible = false;
  @override
  void initState() {
    super.initState();
  }

  List postsList = [
    {
      "pictureURL": "images/PHOTOOO.jpg",
      "pageName": "Ahlam Magdy",
      "date": "3 h",
      //"counterDown": counterDown,
      //"counterUp": counterUp,
      "content": "images/PHOTOOO.jpg"
    },
    {
      "pictureURL": "images/person.png",
      "pageName": "Ahlam Magdy",
      "date": "3 h",
      //"counterDown": 0,
      //"counterUp": 0,
      "content": "images/PHOTOOO.jpg"
    },
    {
      "pictureURL": "images/person.png",
      "pageName": "Ahlam Magdy",
      "date": "3 h",
      //"counterDown": 0,
      //"counterUp": 0,
      "content": "images/PHOTOOO.jpg"
    },
  ];

  bool ocallist = false;
  bool department1 = false;
  bool department2 = false;
  bool department3 = false;
  bool department4 = false;
  bool department5 = false;

  postUI(BuildContext context) {
    return Column(
        children: List.generate(postsList.length, (index) {
      return InkWell(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: const AssetImage("images/person.png"),
                      foregroundImage:
                          AssetImage(postsList[index]["pictureURL"]),
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
                          postsList[index]["pageName"],
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          postsList[index]["date"],
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
                                  child: StatefulBuilder(
                                    builder: (BuildContext context,
                                        StateSetter setState) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                              leading:
                                                  const Icon(Icons.archive),
                                              title: const Text("Save"),
                                              onTap: () {},
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons
                                                  .highlight_remove_rounded),
                                              title: const Text("Remove"),
                                              onTap: () {},
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons
                                                  .report_gmailerrorred_outlined),
                                              title: const Text("Inform"),
                                              onTap: () {},
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ));
                            },
                          );
                        },
                        icon: const Icon(Icons.more_vert_rounded),
                      ),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: double.infinity,
                  height: 250.0,
                  color: Colors.grey[200],
                  child: Image(
                    image: AssetImage(postsList[index]["content"]),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(children: [
                  const Text("3"),
                  InkWell(
                    onLongPress: () {
                      setState(() {
                        _isRatingBarVisible = true;
                      });
                    },
                    child: const Icon(Icons.star),
                  ),
                  const SizedBox(width: 20),
                  if (_isRatingBarVisible)
                    RatingBar.builder(
                      initialRating: _rating,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 3,
                      itemSize: 30,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                      },
                    ),
                ]),
                Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.black12,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Comments()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Comment",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
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
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SlideDialog(
                                  backgroundColor: Colors.white,
                                  pillColor: Colors.black.withOpacity(0.7),
                                  child: StatefulBuilder(
                                    builder: (BuildContext context,
                                        StateSetter setState) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CheckboxListTile(
                                              title: const Text('Ocallist'),
                                              value: ocallist,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  ocallist = value!;
                                                });
                                              },
                                            ),
                                            CheckboxListTile(
                                              title: const Text('department1'),
                                              value: department1,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  department1 = value!;
                                                });
                                              },
                                            ),
                                            CheckboxListTile(
                                              title: const Text('department2'),
                                              value: department2,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  department2 = value!;
                                                });
                                              },
                                            ),
                                            CheckboxListTile(
                                              title: const Text('department3'),
                                              value: department3,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  department3 = value!;
                                                });
                                              },
                                            ),
                                            CheckboxListTile(
                                              title: const Text('department4'),
                                              value: department4,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  department4 = value!;
                                                });
                                              },
                                            ),
                                            CheckboxListTile(
                                              title: const Text("department5"),
                                              value: department5,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  department5 = value!;
                                                });
                                              },
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Recommende",
                                                  style: TextStyle(
                                                    color: Colors.indigo,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      );
                                    },
                                  ));
                            },
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Recommendede to",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                            ),
                            Icon(
                              Icons.reply,
                              size: 30.0,
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
              ],
            )),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: sharedSearch(),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                height: 4.0,
                width: double.infinity,
                color: Colors.black12,
              ),
              postUI(context)
            ],
          ),
        ),
      ),
    );
  }
}
