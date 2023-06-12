class PostClass {
  int postId;
  String profilePictureUrl;
  String pageName;
  String date;
  // ignore: prefer_typing_uninitialized_variables
  var content;

  PostClass({
    required this.postId,
    required this.profilePictureUrl,
    required this.pageName,
    required this.date,
    required this.content,
  });
}
