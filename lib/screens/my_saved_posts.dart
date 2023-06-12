import 'package:flutter/material.dart';
import 'package:smo/widgets/post_ui_item.dart';

import '../widgets/menu_widget.dart';
import '../widgets/component.dart';
import '../moduls/post_class.dart';

class MySavedPosts extends StatefulWidget {
  final List<PostClass> archivedPList;
  final Function toggleAddPostToArchive;
  final Function isArchivedPost;

  const MySavedPosts(
      {super.key,
      required this.archivedPList,
      required this.toggleAddPostToArchive,
      required this.isArchivedPost});

  @override
  State<MySavedPosts> createState() => _MySavedPostsState();
}

class _MySavedPostsState extends State<MySavedPosts> {
  handletoggleSavePost(int id) {
    widget.toggleAddPostToArchive(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.archivedPList.isEmpty) {
      return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.indigo,
            title: sharedSearch(),
            actions: const [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Archive",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              )
            ],
            leading: const MenuWidget(),
          ),
          body: const Center(
            child: Text("there is no archived articals"),
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.indigo,
          title: sharedSearch(),
          actions: const [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Archive",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              width: 5,
            )
          ],
          leading: const Icon(Icons.archive),
        ),
        body: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => PostClassUI(
              pageName: widget.archivedPList[index].pageName,
              content: widget.archivedPList[index].content,
              date: widget.archivedPList[index].date,
              postId: widget.archivedPList[index].postId,
              // ignore: avoid_types_as_parameter_names
              profilePictureUrl: widget.archivedPList[index].profilePictureUrl,
              isArchivedPost: widget.isArchivedPost,
              onToggleArchive: handletoggleSavePost),
          itemCount: widget.archivedPList.length,
        ),
      );
    }
  }
}
