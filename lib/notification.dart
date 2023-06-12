//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:slide_popup_dialog_null_safety/slide_dialog.dart';
import 'package:smo/search_page.dart';
//import 'package:smo/component.dart';

// ignore: camel_case_types
class userNotification {
  final String name;
  final String id;
  final String date;
  userNotification({
    required this.name,
    required this.date,
    required this.id,
  });
}

// ignore: must_be_immutable
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isAll = true;

  List<userNotification> users = [
    userNotification(name: 'Notification_1', id: '1', date: '1/2'),
    userNotification(name: 'Notification_2', id: '2', date: '2/2'),
    userNotification(name: 'Notification_3', id: '3', date: '3/2'),
    userNotification(name: 'Notification_4', id: '4', date: '4/2'),
    userNotification(name: 'Notification_5', id: '5', date: '5/2'),
    userNotification(name: 'Notification_6', id: '6', date: '6/2'),
    userNotification(name: 'Notification_7', id: '7', date: '7/2'),
    userNotification(name: 'Notification_8', id: '8', date: '8/2'),
    userNotification(name: 'Notification_8', id: '8', date: '8/2'),
    userNotification(name: 'Notification_8', id: '8', date: '8/2'),
    userNotification(name: 'Notification_8', id: '8', date: '8/2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          leading: const Icon(
            Icons.notifications,
            size: 30,
          ),
          title: const Text(
            "Notification",
            style: TextStyle(
              color: Colors.white,
              fontFamily: AutofillHints.jobTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            CircleAvatar(
              radius: 20.0,
              backgroundColor: const Color(0xFFe9eaec),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage()));
                },
                icon: const Icon(
                  Icons.search,
                  size: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  " All",
                  style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          buildUserItem(users[index]),
                      // ignore: sized_box_for_whitespace
                      separatorBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: 1.0,
                          ),
                      itemCount: users.length),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildUserItem(userNotification user) => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("images/PHOTOOO.jpg")),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name} ',
                    style: const TextStyle(
                      fontSize: 20.0,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(user.date),
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
                                          leading: const Icon(
                                            Icons.highlight_remove_rounded,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                          title: const Text("Remove"),
                                          onTap: () {},
                                        ),
                                        ListTile(
                                          leading: const Icon(
                                            Icons.block_rounded,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                          title: const Text(
                                              "Stop send notification form this page"),
                                          onTap: () {},
                                        )
                                      ],
                                    ));
                              },
                            );
                          },
                          icon: const Icon(Icons.more_vert)))),
            ],
          ),
        ),
      );
}
