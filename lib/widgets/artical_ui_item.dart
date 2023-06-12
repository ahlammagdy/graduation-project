import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:slide_popup_dialog_null_safety/slide_dialog.dart';

class ArticalUIClass extends StatefulWidget {
  final int articalId;
  final String abstruction;
  final int numOfPage;
  final String articalPictureURL;
  final String title;
  final String articalLink;
  final Function(int) onToggleArchive;
  final Function isArchivedArtical;

  const ArticalUIClass(
      {super.key,
      required this.articalId,
      required this.abstruction,
      required this.numOfPage,
      required this.articalPictureURL,
      required this.title,
      required this.articalLink,
      required this.onToggleArchive,
      required this.isArchivedArtical});

  @override
  State<ArticalUIClass> createState() => _ArticalUIClassState();
}

double _rating = 0.0;
bool _isRatingBarVisible = false;

class _ArticalUIClassState extends State<ArticalUIClass> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Column(
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
                                  child: widget
                                          .isArchivedArtical(widget.articalId)
                                      ? ListTile(
                                          leading: const Icon(
                                              Icons.highlight_remove_rounded),
                                          title:
                                              const Text("Remove from archive"),
                                          onTap: () {
                                            widget.onToggleArchive(
                                                widget.articalId);
                                          })
                                      : Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                              leading: const Icon(Icons
                                                  .highlight_remove_rounded),
                                              title: const Text("Remove"),
                                              onTap: () {},
                                            ),
                                            ListTile(
                                              leading:
                                                  const Icon(Icons.archive),
                                              title: const Text("Save"),
                                              onTap: () {
                                                widget.onToggleArchive(
                                                    widget.articalId);
                                              },
                                            ),
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.block_rounded),
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
                  Navigator.pushNamed(context, "/articaldetails", arguments: {
                    'articalId': widget.articalId,
                    'abstruction': widget.abstruction,
                    'numOfPages': widget.numOfPage,
                    //'articalLink': widget.articalLink,
                    'title': widget.title,
                    'articalPicture': widget.articalPictureURL
                  });
                },
                child: Row(
                  children: [
                    Container(
                        //alignment: Alignment.center,
                        height: 110.0,
                        width: 100.0,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Image(
                          image: AssetImage(widget.articalPictureURL),
                          fit: BoxFit.cover,
                          height: 110.0,
                          width: 100.0,
                        )),
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
                            widget.abstruction,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                "Numbber of pages: ",
                                style: TextStyle(
                                  color: Colors.indigo,
                                ),
                              ),
                              Text(
                                " ${widget.numOfPage}",
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
          ),
        ),
      )
    ]);
  }
}
