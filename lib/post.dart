//import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

import 'full_case_post.dart';
import 'general_post.dart';

class PostPublish extends StatefulWidget {
  const PostPublish({super.key});

  @override
  State<PostPublish> createState() => _PostPublishState();
}

class _PostPublishState extends State<PostPublish> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: Colors.red,
          //leading: const MenuWidget(),
          title: const Text(
            "Post",
            style: TextStyle(
              color: Colors.white,
              fontFamily: AutofillHints.jobTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text("publish",
                        style: TextStyle(fontSize: 20, color: Colors.white))),
                const Icon(
                  Icons.post_add,
                  size: 25,
                ),
                const SizedBox(
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
                  child: Text("post full case", style: TextStyle(fontSize: 20)),
                ),
                Tab(
                  child: Text("general post", style: TextStyle(fontSize: 20)),
                ),
              ]),
        ),
        body: const TabBarView(children: [PostCase(), GeneralPost()]),
      ),
    );
  }
}
