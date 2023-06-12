import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectedArticals extends StatefulWidget {
  const SelectedArticals({super.key});

  @override
  State<SelectedArticals> createState() => _SelectedArticalsState();
}

class _SelectedArticalsState extends State<SelectedArticals> {
  @override
  Widget build(BuildContext context) {
    final routargument = ModalRoute.of(context)!.settings.arguments as Map;
    final articalPictureURL = routargument['articalPicture'];
    final tilte = routargument['title'];
    final abstruction = routargument['abstruction'];
    final numOfPages = routargument['numOfPages'];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image(image: AssetImage(articalPictureURL)),
                Text(
                  tilte,
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Text(
                  abstruction,
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
                      "Number of pages  : ",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                    Text(
                      '$numOfPages',
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100.0,
                ),
                InkWell(
                    onTap: () {
                      FullArtical();
                    },
                    child: const Image(
                        height: 100,
                        width: 150,
                        image: AssetImage("images/full artical.png")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
FullArtical() async {
  const url = "https://www.youtube.com/watch?v=LNj8kiF0giM";
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'conld not launch url';
  }
}
