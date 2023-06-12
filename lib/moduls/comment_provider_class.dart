import 'package:flutter/material.dart';

import 'comment_class.dart';

class CommentsProvider extends ChangeNotifier {
  final List<Comment> _comments = [];

  List<Comment> get comments => _comments;

  void addComment(String text) {
    _comments.add(Comment(
      id: _comments.length + 1,
      text: text,
      timestamp: DateTime.now(),
    ));
    notifyListeners();
  }
}
