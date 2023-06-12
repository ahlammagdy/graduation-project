import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'shimaa Ahmed',
      'pic': "images/PHOTOOO.jpg",
      'message': 'computer science',
      'date': '2023-01-01 12:00:00'
    },
    {
      'name': 'Ahlam magdy',
      'pic': "images/PHOTOOO.jpg",
      'message': 'fci minia',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'amna qauad',
      'pic': "images/PHOTOOO.jpg",
      'message': 'hhhhhhhhhhhh',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'hala emam',
      'pic': "images/PHOTOOO.jpg",
      'message': 'ggggggggggg',
      'date': '2021-01-01 12:00:00'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  // ignore: avoid_print
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing:
                  Text(data[i]['date'], style: const TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: const Text("Comments"),
        backgroundColor: Colors.indigo,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: CommentBox(
          userImage: CommentBox.commentImageParser(
              imageURLorPath: "images/PHOTOOO.jpg"),
          // ignore: sort_child_properties_last
          child: commentChild(filedata),
          errorText: 'Comment cannot be blank',
          withBorder: false,
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              // ignore: avoid_print
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'New User',
                  'pic': "images/PHOTOOO.jpg",
                  'message': commentController.text,
                  'date': '2021-01-01 12:00:00'
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              // ignore: avoid_print
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.indigo,
          textColor: Colors.white,
          sendWidget:
              const Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}
