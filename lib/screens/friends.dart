import 'package:flutter/material.dart';
import 'package:smo/widgets/friend_ui_item.dart';

import '../widgets/menu_widget.dart';
import '../widgets/component.dart';
import '../smo_dummy_data.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  //TextEditingController _searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        title: sharedSearch(),
        actions: const [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Friends",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            width: 5,
          )
        ],
        leading: const MenuWidget(),
      ),
      body: ListView(
        children: dummyFriendsList
            .map((friend) => FriendClassUI(
                name: friend.name,
                imageProfileURL: friend.imageProfileURL,
                isOnline: friend.isOnline))
            .toList(),
      ),
    );
  }
}
