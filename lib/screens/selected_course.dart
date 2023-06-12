import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//import 'screens/courses.dart';

// ignore: camel_case_types
class CoursesDetails extends StatefulWidget {
  const CoursesDetails({super.key});

  @override
  State<CoursesDetails> createState() => _CoursesState();
}

class _CoursesState extends State<CoursesDetails> {
  final String url = "https://www.youtube.com/watch?v=LNj8kiF0giM";
  late YoutubePlayer youtubePlayer;
  late YoutubePlayerController _controller;
  late String id;
  late String title, auther;

  @override
  void initState() {
    super.initState();
    id = YoutubePlayer.convertUrlToId(url)!;
    _controller = YoutubePlayerController(initialVideoId: id);
    youtubePlayer = YoutubePlayer(controller: _controller);
    // title = _controller.metadata.title;
    //auther = _controller.metadata.author;
  }

  @override
  Widget build(BuildContext context) {
    final routargument = ModalRoute.of(context)!.settings.arguments as Map;
    //final coursId = routargument['courseId'];
    final description = routargument['description'];
    final title = routargument['title'];
    //final playListLink = routargument['playList'];
    final length = routargument['length'];

    playList() async {
      const url = "https://www.youtube.com/watch?v=LNj8kiF0giM";
      // ignore: deprecated_member_use
      if (await canLaunch(url)) {
        // ignore: deprecated_member_use
        await launch(url);
      } else {
        throw 'conld not launch url';
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.lightBlue[50],
              child: youtubePlayer,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                    maxLines: 20,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Course length : ",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                      ),
                      Text(
                        "$length",
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  InkWell(
                      onTap: () {
                        playList();
                      },
                      child: const Image(
                          height: 100,
                          width: 150,
                          image: AssetImage("images/playlist.png")))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
