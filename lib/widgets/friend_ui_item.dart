import 'package:flutter/material.dart';
import 'package:slide_popup_dialog_null_safety/slide_dialog.dart';

class FriendClassUI extends StatefulWidget {
  final String name;
  final String imageProfileURL;
  final bool isOnline;

  const FriendClassUI(
      {super.key,
      required this.name,
      required this.imageProfileURL,
      required this.isOnline});

  @override
  State<FriendClassUI> createState() => _FriendClassUIState();
}

class _FriendClassUIState extends State<FriendClassUI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 90,
              height: 90,
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 100.0,
                    backgroundImage: const AssetImage("images/person.png"),
                    foregroundImage: AssetImage(widget.imageProfileURL),
                  ),
                  widget.isOnline
                      ? Positioned(
                          top: 60,
                          left: 70,
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
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "4 shared friends",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topRight,
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
                                      leading: const Icon(Icons.chat_rounded),
                                      title: Row(
                                        children: [
                                          const Text("Chat with "),
                                          Text(widget.name),
                                        ],
                                      ),
                                      onTap: () {},
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.block_outlined),
                                      title: const Text("Block"),
                                      onTap: () {},
                                    ),
                                    ListTile(
                                      leading:
                                          const Icon(Icons.person_off_rounded),
                                      title: const Text("UnFriend"),
                                      onTap: () {},
                                    ),
                                  ],
                                ));
                          });
                    },
                    icon: const Icon(Icons.more_horiz_rounded)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
