import 'package:flutter/material.dart';
import 'package:slide_popup_dialog_null_safety/slide_dialog.dart';

class ChatClassUI extends StatefulWidget {
  final int chatId;
  final String name;
  final String imageProfileURL;
  final bool isOnline;
  final String message;
  final String time;

  const ChatClassUI(
      {super.key,
      required this.name,
      required this.imageProfileURL,
      required this.isOnline,
      required this.message,
      required this.time,
      required this.chatId});

  @override
  State<ChatClassUI> createState() => _ChatClassUIState();
}

class _ChatClassUIState extends State<ChatClassUI> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/privatechat", arguments: {
          'pageName': widget.name,
          'profilePicture': widget.imageProfileURL
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(widget.imageProfileURL),
                            fit: BoxFit.cover)),
                  ),
                  widget.isOnline
                      ? Positioned(
                          top: 38,
                          left: 42,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: const Color(0xFF66BB6A),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: const Color(0xFFFFFFFF), width: 3)),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 135,
                  child: Text(
                    "${widget.message} - ${widget.time}",
                    style: TextStyle(
                        fontSize: 15,
                        color: const Color(0xFF000000).withOpacity(0.7)),
                    overflow: TextOverflow.ellipsis,
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
                            pillColor: Colors.grey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(
                                      Icons.highlight_remove_rounded),
                                  title: const Text("Remove"),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: const Icon(Icons.volume_off),
                                  title: const Text("Mute"),
                                  onTap: () {},
                                ),
                              ],
                            ));
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.more_vert_rounded,
                    color: Colors.black,
                  )),
            )),
          ],
        ),
      ),
    );
  }
}
