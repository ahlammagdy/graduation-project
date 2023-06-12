import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:slide_popup_dialog_null_safety/slide_dialog.dart';

import '../moduls/comment_provider_class.dart';
import '../screens/comments.dart';

// ignore: must_be_immutable
class PostClassUI extends StatefulWidget {
  final int postId;
  final String profilePictureUrl;
  final String pageName;
  final String date;
  // ignore: prefer_typing_uninitialized_variables
  var content;
  final Function(int) onToggleArchive;
  final Function isArchivedPost;

  PostClassUI(
      {super.key,
      required this.postId,
      required this.profilePictureUrl,
      required this.pageName,
      required this.date,
      required this.content,
      required this.onToggleArchive,
      required this.isArchivedPost});

  @override
  State<PostClassUI> createState() => _PostClassUIState();
}

class _PostClassUIState extends State<PostClassUI> {
  double _rating = 0.0;
  bool _isRatingBarVisible = false;

  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  bool ocallist = false;
  bool department1 = false;
  bool department2 = false;
  bool department3 = false;
  bool department4 = false;
  bool department5 = false;

  @override
  Widget build(BuildContext context) {
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
                    foregroundImage: AssetImage(widget.profilePictureUrl),
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
                                  child: widget.isArchivedPost(widget.postId)
                                      ? Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                              leading:
                                                  const Icon(Icons.archive),
                                              title: const Text(
                                                  "Remove From Saved Posts"),
                                              onTap: () {
                                                widget.onToggleArchive(
                                                    widget.postId);
                                              },
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons
                                                  .report_gmailerrorred_outlined),
                                              title: const Text("Inform"),
                                              onTap: () {},
                                            )
                                          ],
                                        )
                                      : Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                              leading:
                                                  const Icon(Icons.archive),
                                              title: const Text("Save"),
                                              onTap: () {
                                                widget.onToggleArchive(
                                                    widget.postId);
                                              },
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
                  image: AssetImage(widget.content),
                ),
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
                              builder: (context) => const CommentsScreen()));
                      showModalBottomSheet(
                          useSafeArea: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Form(
                              key: _formKey,
                              child: Column(
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                      top: BorderSide(
                                        color: Colors.indigo,
                                        width: 2,
                                      ),
                                    )),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: _textController,
                                            decoration: const InputDecoration(
                                                hintText: 'Enter your comment'),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter a comment';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              final commentsProvider =
                                                  Provider.of<CommentsProvider>(
                                                      context,
                                                      listen: false);
                                              commentsProvider.addComment(
                                                  _textController.text);
                                              _textController.clear();
                                            }
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.send),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Comment",
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
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return AlertDialog(content: StatefulBuilder(
                                  builder: (BuildContext context,
                                      StateSetter setState) {
                                    return SizedBox(
                                      height: 400,
                                      child: SingleChildScrollView(
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
                                                child: const Text("Recommende",
                                                    style: TextStyle(
                                                      color: Colors.indigo,
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
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
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
    );
  }
}
