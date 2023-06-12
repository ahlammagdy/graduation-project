import 'package:flutter/material.dart';
import 'package:smo/profile.dart';
// import 'package:smo/Articals.dart';
// import 'package:smo/Friends.dart';
// import 'package:smo/Profile.dart';

import '../moduls/menu_item_class.dart';
// import 'MyItems.dart';
// import 'Setting.dart';

class MenuItems {
  static const home = MenuItem("Home", Icons.home);
  // static const notification = MenuItem("Notification", Icons.notifications);
  // static const chat = MenuItem("Chat", Icons.chat);

  static const staticTraining =
      MenuItem("Static Training", Icons.model_training);
  static const dynaminTraining =
      MenuItem("Dynamic Training", Icons.note_alt_rounded);
  static const courses = MenuItem("Courses", Icons.airplay);
  static const articals = MenuItem("Articals", Icons.menu_book_outlined);
  static const friends = MenuItem("Friends", Icons.people);
  //static const profile = MenuItem("Profile", Icons.person);
  static const myItems = MenuItem("My Saved Posts", Icons.archive_rounded);

  static const all = <MenuItem>[
    home,
    // notification,
    // chat,

    staticTraining,
    dynaminTraining,
    courses,
    articals,
    friends,
    //profile,
    myItems,
  ];
}

class MenuScreen extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuScreen({
    super.key,
    required this.currentItem,
    required this.onSelectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
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

            // const SizedBox(
            //   height: 30,
            // ),
            const Spacer(),
            ...MenuItems.all.map(buildMenuItem).toList(),
            const Spacer(flex: 1),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  //width: double.infinity,
                  height: 40.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30.0)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      "LogOut",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        )),
      ),
    );
  }

  buildMenuItem(MenuItem e) => ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          selectedTileColor: Colors.black26,
          selected: currentItem == e,
          minLeadingWidth: 20,
          leading: Icon(e.icon),
          title: Text(e.title),
          onTap: () => onSelectedItem(e),
        ),
      );
}
