class ChatClass {
  final int chatId;

  final String name;
  final String imageProfileURL;
  final bool isOnline;
  final String message;
  final String time;

  ChatClass(
      {required this.chatId,
      required this.name,
      required this.imageProfileURL,
      required this.isOnline,
      required this.message,
      required this.time});
}
