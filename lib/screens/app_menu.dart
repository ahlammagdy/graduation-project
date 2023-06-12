import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:smo/screens/articals.dart';
import 'package:smo/screens/courses.dart';
import 'package:smo/dynamic_training.dart';
import 'package:smo/screens/home.dart';
import 'package:smo/screens/static_training.dart';

import 'friends.dart';
import '../moduls/menu_item_class.dart';
import '../moduls/post_class.dart';
import '../smo_dummy_data.dart';
import 'menu_screen.dart';
import 'my_saved_posts.dart';

class AppMenu extends StatefulWidget {
  const AppMenu({super.key});

  @override
  State<AppMenu> createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> {
  List<PostClass> archivedPostList = [];

  toggleAddPostToArchive(int postId) {
    final existingPostIndex =
        archivedPostList.indexWhere((postClass) => postClass.postId == postId);
    if (existingPostIndex < 0) {
      setState(() {
        archivedPostList.add(dummyPostList
            .firstWhere((postClass) => postClass.postId == postId));
      });

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("the post added to Archive"),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Ok"))
                  ],
                ),
              ));
    } else {
      setState(() {
        archivedPostList.removeAt(existingPostIndex);
      });

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("the post removed from Archive"),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Ok"))
                  ],
                ),
              ));
    }
  }

  bool isArchivedPost(int id) {
    return archivedPostList.any((postClass) => postClass.postId == id);
  }

  MenuItem currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        moveMenuScreen: true,
        borderRadius: 50.0,
        slideWidth: 250,
        angle: -15.0,
        showShadow: true,
        drawerShadowsBackgroundColor: Colors.orangeAccent,
        menuBackgroundColor: Colors.indigo,
        menuScreen: MenuScreen(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() => currentItem = item);
          },
        ),
        mainScreen: getScreen());
  }

  getScreen() {
    switch (currentItem) {
      case MenuItems.home:
        return Home(
          archivedPList: archivedPostList,
          isArchivedPost: isArchivedPost,
          toggleAddPostToArchive: toggleAddPostToArchive,
        );
      case MenuItems.dynaminTraining:
        return const DynamicTraining();
      case MenuItems.staticTraining:
        return const StaticTraining();
      case MenuItems.courses:
        return const Courses();
      case MenuItems.articals:
        return const Articals();
      case MenuItems.friends:
        return const Friends();
      case MenuItems.myItems:
        return MySavedPosts(
          archivedPList: archivedPostList,
          isArchivedPost: isArchivedPost,
          toggleAddPostToArchive: toggleAddPostToArchive,
        );
    }
  }
}
