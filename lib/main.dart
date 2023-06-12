import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smo/screens/selected_course.dart';
import 'package:smo/screens/selected_article.dart';
import 'package:smo/screens/static_training.dart';

//import 'post.dart';
import 'sing_up.dart';
//import 'add_artical.dart';
//import 'add_course.dart';
import 'moduls/comment_provider_class.dart';
//import 'screens/app_menu.dart';
import 'screens/private_chat.dart';
//import 'artical_archive.dart';
//import 'articals.dart';
//import 'courses.dart';
//import 'friend_requests.dart';
//import 'courses_archive.dart';
//import 'dynamic_training.dart';
//import 'spacialized_home.dart';
//import 'static_training.dart';
//import 'test.dart';
//import 'Profile.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CommentsProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          platform: TargetPlatform.android, // هنا يتم تحديد النظام المستهدف
        ),
        debugShowCheckedModeBanner: false,
        home: const Singup(),
        routes: {
          '/coursedetails': (context) => const CoursesDetails(),
          '/articaldetails': (context) => const SelectedArticals(),
          '/privatechat': (context) => const PrivateChat(),
          '/staticTraining': (context) => const StaticTraining()
        });
  }
}
