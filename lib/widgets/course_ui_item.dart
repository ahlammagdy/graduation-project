import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:slide_popup_dialog_null_safety/slide_dialog.dart';

import 'package:flutter/material.dart';

class CourseUIItem extends StatefulWidget {
  final int courseId;
  final String description;
  final int length;
  final String pictureURL;
  final String title;
  final String playListLink;
  final Function(int) onToggleArchive;
  final Function isArchivedCourse;

  const CourseUIItem(this.courseId, this.description, this.length,
      this.pictureURL, this.title, this.playListLink,
      {super.key,
      required this.onToggleArchive,
      required this.isArchivedCourse});

  @override
  State<CourseUIItem> createState() => _CourseUIItemState();
}

class _CourseUIItemState extends State<CourseUIItem> {
  double _rating = 0.0;
  bool _isRatingBarVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SlideDialog(
                            backgroundColor: Colors.white,
                            pillColor: Colors.grey,
                            child: widget.isArchivedCourse(widget.courseId)
                                ? ListTile(
                                    leading: const Icon(
                                        Icons.highlight_remove_rounded),
                                    title: const Text("Remove from archive"),
                                    onTap: () {
                                      widget.onToggleArchive(widget.courseId);
                                    })
                                : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: const Icon(
                                            Icons.highlight_remove_rounded),
                                        title: const Text("Remove"),
                                        onTap: () {},
                                      ),
                                      ListTile(
                                          leading: const Icon(Icons.archive),
                                          title: const Text("Save"),
                                          onTap: () {
                                            widget.onToggleArchive(
                                                widget.courseId);
                                          }),
                                      ListTile(
                                        leading:
                                            const Icon(Icons.block_rounded),
                                        title: const Text(
                                            "Stop view from this page"),
                                        onTap: () {},
                                      )
                                    ],
                                  ));
                      });
                },
                icon: const Icon(Icons.more_vert))),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed("/coursedetails", arguments: {
              'courseId': widget.courseId,
              'description': widget.description,
              'length': widget.length,
              //'playListLink': widget.playListLink,
              'title': widget.title
            });
          },
          child: Row(
            children: [
              Container(
                  height: 110.0,
                  width: 100.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Stack(alignment: Alignment.center, children: [
                    Image(
                      image: AssetImage(widget.pictureURL),
                      fit: BoxFit.cover,
                      height: 110.0,
                      width: 100.0,
                    ),
                    const Icon(
                      Icons.play_circle,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ])),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "length: ",
                          style: TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                        Text(
                          "${widget.length}",
                          style: const TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            TextButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(
                    Icons.comment,
                    size: 15.0,
                    color: Colors.indigo,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Comment",
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 1.0,
          width: double.infinity,
          color: Colors.black12,
        ),
      ],
    );
  }
}
