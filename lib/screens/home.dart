import 'package:flutter/material.dart';
import 'package:smo/screens/chat.dart';
import 'package:smo/notification.dart';

import '../interested_home.dart';
import '../widgets/menu_widget.dart';
//import 'Post.dart';
import '../moduls/post_class.dart';
import 'spacialized_home.dart';
//import 'package:flutter_application_1/modules/Post.dart';

class Home extends StatefulWidget {
  final List<PostClass> archivedPList;
  final Function toggleAddPostToArchive;
  final Function isArchivedPost;

  const Home(
      {super.key,
      required this.archivedPList,
      required this.toggleAddPostToArchive,
      required this.isArchivedPost});

  @override
  State<Home> createState() => _HomeState();
}

var counterUp = 0;
var counterDown = 0;

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
          //leading: const MenuWidget(),
          title: Row(children: [
            const MenuWidget(),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Chat()));
              },
              icon: const Icon(
                Icons.chat,
                size: 22.0,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationScreen()));
              },
              icon: const Icon(
                Icons.notifications,
                size: 30.0,
                color: Colors.white,
              ),
            ),
            CircleAvatar(
              radius: 15.0,
              backgroundColor: const Color(0xFFe9eaec),
              child: IconButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => SearchPage()));
                },
                icon: const Icon(
                  Icons.search,
                  size: 17.0,
                  color: Colors.black,
                ),
              ),
            ),
          ]),
          actions: const [
            Image(
              image: AssetImage("images/blue 1.png"),
              height: 45.0,
              width: 90.0,
            ),
            SizedBox(
              width: 15,
            )
          ],
          bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Text("Specialization", style: TextStyle(fontSize: 20)),
                ),
                Tab(
                  child: Text("Interestes",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                )
              ]),
        ),
        body: TabBarView(children: [
          SpacializedHome(
            archivedPList: widget.archivedPList,
            isArchivedPost: widget.isArchivedPost,
            toggleAddPostToArchive: widget.toggleAddPostToArchive,
          ),
          const InterestedHome(),
        ]),
      ),
    );
  }
}
