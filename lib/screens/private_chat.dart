import 'package:flutter/material.dart';

class PrivateChat extends StatefulWidget {
  const PrivateChat({super.key});

  @override
  State<PrivateChat> createState() => _PrivateChatState();
}

class _PrivateChatState extends State<PrivateChat> {
  @override
  Widget build(BuildContext context) {
    final routargument = ModalRoute.of(context)!.settings.arguments as Map;
    final pageName = routargument['pageName'];
    final profilePicture = routargument['profilePicture'];

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: const AssetImage("images/person.png"),
              foregroundImage: AssetImage(profilePicture),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(pageName),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const SizedBox(
            width: 10,
          ),
          //IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(),
          Container(
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(
                color: Colors.indigo,
                width: 2,
              ),
            )),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 8,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.emoji_emotions_outlined)),
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      hintText: 'Typ Message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.attach_file_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: Colors.indigo,
                    )),
              ],
            ),
          )
        ],
      )),
    );
  }
}
