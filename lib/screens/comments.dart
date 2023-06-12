import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../moduls/comment_provider_class.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final commentsProvider = Provider.of<CommentsProvider>(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: const Text('Comments Screen')),
      body: ListView.builder(
        itemCount: commentsProvider.comments.length,
        itemBuilder: (context, index) {
          final comment = commentsProvider.comments[index];
          return ListTile(
            title: Text(comment.text),
            subtitle: Text(comment.timestamp.toString()),
          );
        },
      ),
    );
  }
}
