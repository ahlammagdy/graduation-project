import 'package:flutter/material.dart';
import 'package:smo/smo_dummy_data.dart';

import '../widgets/component.dart';
import '../profile.dart';
import '../widgets/chat_ui_item.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: Colors.red,
          title: sharedSearch(),
          actions: const [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Chats",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              width: 5,
            )
          ]),
      drawer: Drawer(
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.indigo,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()));
                    },
                    child: const CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage("images/person.png"),
                      foregroundImage: AssetImage("images/PHOTOOO.jpg"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()));
                    },
                    child: const Text(
                      "Page Name",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            // Container(
            //   height: 1,
            //   color: Colors.red,
            // ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.volume_off),
              title: const Text("Muted Chats"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.block_rounded),
              title: const Text("Blocked Chats"),
              onTap: () {},
            )
          ],
        ),
      ),
      body: ListView(
          children: dummyChatList
              .map((chat) => ChatClassUI(
                    chatId: chat.chatId,
                    imageProfileURL: chat.imageProfileURL,
                    name: chat.name,
                    time: chat.time,
                    isOnline: chat.isOnline,
                    message: chat.message,
                  ))
              .toList()),
    );
  }
}
