import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slide_popup_dialog_null_safety/slide_dialog.dart';
import 'package:smo/smo_dummy_data.dart';
import 'package:smo/widgets/post_ui_item.dart';

import '../moduls/post_class.dart';
import '../post.dart';
import '../profile.dart';
import 'commentsccc.dart';

// static addPost(int postId, String profilePictureUrl, String pageName,
//     String date, var content) {
//   postsList.add(post(
//       postId: postId,
//       profilePictureUrl: profilePictureUrl,
//       pageName: pageName,
//       date: date,
//       content: content));
// }

class SpacializedHome extends StatefulWidget {
  final List<PostClass> archivedPList;
  final Function toggleAddPostToArchive;
  final Function isArchivedPost;

  const SpacializedHome(
      {super.key,
      required this.archivedPList,
      required this.toggleAddPostToArchive,
      required this.isArchivedPost});

  @override
  State<SpacializedHome> createState() => _SpacializedHomeState();
}

class _SpacializedHomeState extends State<SpacializedHome> {
  @override
  void initState() {
    super.initState();
  }

  File? _imageFile;

  Future<void> _getImage(ImageSource source) async {
    // ignore: deprecated_member_use
    final pickedFile = await ImagePicker().getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  bool ocallist = false;
  bool department1 = false;
  bool department2 = false;
  bool department3 = false;
  bool department4 = false;
  bool department5 = false;

  double _rating = 0.0;
  bool _isRatingBarVisible = false;

  @override
  Widget build(BuildContext context) {
    handletoggleSavePost(int id) {
      widget.toggleAddPostToArchive(id);
      setState(() {});
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile()));
                      },
                      child: const CircleAvatar(
                        radius: 20.0,
                        backgroundImage: AssetImage("images/person.png"),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Container(
                        alignment: AlignmentDirectional.centerEnd,
                        height: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey[200]),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PostPublish()));
                          },
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "what are you think?",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.blueGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.photo_library,
                          size: 30.0, color: Colors.indigo),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SafeArea(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.camera_alt),
                                      title: const Text('Take a picture'),
                                      onTap: () {
                                        _getImage(ImageSource.camera);
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.image),
                                      title: const Text('Select from gallery'),
                                      onTap: () {
                                        _getImage(ImageSource.gallery);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                height: 4.0,
                width: double.infinity,
                color: Colors.black12,
              ),
              if (_imageFile != null)
                InkWell(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 20.0,
                                backgroundImage:
                                    AssetImage("images/person.png"),
                                foregroundImage:
                                    AssetImage("images/PHOTOOO.jpg"),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "pageName",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "6h",
                                    style: TextStyle(
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
                                              pillColor:
                                                  Colors.black.withOpacity(0.7),
                                              child: StatefulBuilder(
                                                builder: (BuildContext context,
                                                    StateSetter setState) {
                                                  return SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        ListTile(
                                                          leading: const Icon(
                                                              Icons.archive),
                                                          title: const Text(
                                                              "Save"),
                                                          onTap: () {},
                                                        ),
                                                        ListTile(
                                                          leading: const Icon(Icons
                                                              .highlight_remove_rounded),
                                                          title: const Text(
                                                              "Remove"),
                                                          onTap: () {},
                                                        ),
                                                        ListTile(
                                                          leading: const Icon(Icons
                                                              .report_gmailerrorred_outlined),
                                                          title: const Text(
                                                              "Inform"),
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
                                    icon: const Icon(Icons.more_vert_rounded)),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            elevation: 15.0,
                            child: Image(
                                height: 400,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                image: FileImage(_imageFile!)),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(children: [
                            const Text("3"),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _isRatingBarVisible = true;
                                });
                              },
                              child: const Icon(Icons.star),
                            ),
                            const SizedBox(width: 30),
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
                                          builder: (context) =>
                                              const Comments()));
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Comment",
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
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
                                        return StatefulBuilder(
                                          builder: (BuildContext context,
                                              StateSetter setState) {
                                            return AlertDialog(
                                                content: StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return SizedBox(
                                                  height: 400,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        CheckboxListTile(
                                                          title: const Text(
                                                              'Ocallist'),
                                                          value: ocallist,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              ocallist = value!;
                                                            });
                                                          },
                                                        ),
                                                        CheckboxListTile(
                                                          title: const Text(
                                                              'department1'),
                                                          value: department1,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              department1 =
                                                                  value!;
                                                            });
                                                          },
                                                        ),
                                                        CheckboxListTile(
                                                          title: const Text(
                                                              'department2'),
                                                          value: department2,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              department2 =
                                                                  value!;
                                                            });
                                                          },
                                                        ),
                                                        CheckboxListTile(
                                                          title: const Text(
                                                              'department3'),
                                                          value: department3,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              department3 =
                                                                  value!;
                                                            });
                                                          },
                                                        ),
                                                        CheckboxListTile(
                                                          title: const Text(
                                                              'department4'),
                                                          value: department4,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              department4 =
                                                                  value!;
                                                            });
                                                          },
                                                        ),
                                                        CheckboxListTile(
                                                          title: const Text(
                                                              "department5"),
                                                          value: department5,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              department5 =
                                                                  value!;
                                                            });
                                                          },
                                                        ),
                                                        CheckboxListTile(
                                                          title: const Text(
                                                              'department3'),
                                                          value: department3,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              department3 =
                                                                  value!;
                                                            });
                                                          },
                                                        ),
                                                        CheckboxListTile(
                                                          title: const Text(
                                                              'department4'),
                                                          value: department4,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              department4 =
                                                                  value!;
                                                            });
                                                          },
                                                        ),
                                                        CheckboxListTile(
                                                          title: const Text(
                                                              "department5"),
                                                          value: department5,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              department5 =
                                                                  value!;
                                                            });
                                                          },
                                                        ),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                "Recommende",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .indigo,
                                                                )))
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ));
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Recommendede to",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 10.0,
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
                ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => PostClassUI(
                    pageName: dummyPostList[index].pageName,
                    content: dummyPostList[index].content,
                    date: dummyPostList[index].date,
                    postId: dummyPostList[index].postId,
                    // ignore: avoid_types_as_parameter_names
                    profilePictureUrl: dummyPostList[index].profilePictureUrl,
                    isArchivedPost: widget.isArchivedPost,
                    onToggleArchive: handletoggleSavePost),
                itemCount: dummyPostList.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
