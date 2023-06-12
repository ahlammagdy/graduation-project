//import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

// ignore: camel_case_types
class GeneralPost extends StatefulWidget {
  const GeneralPost({super.key});

  @override
  State<GeneralPost> createState() => _GeneralPostState();
}

class _GeneralPostState extends State<GeneralPost> {
  late VideoPlayerController _videoPlayerController;
  late File _video;
  final picker = ImagePicker();

  // ignore: unused_element
  _pickVideo() async {
    // ignore: deprecated_member_use
    final video = await picker.getVideo(source: ImageSource.gallery);
    _video = File(video!.path);
    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  File? _imageFile;

  Future<void> _getImage(ImageSource source) async {
    // ignore: deprecated_member_use
    final pickedFile = await ImagePicker().getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("images/person.png"),
                  ),
                  title: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'What are you thinking ?'),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.add_a_photo),
                      title: const Text('Add picture'),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SafeArea(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.camera_alt),
                                      title: const Text('Take a picture'),
                                      onTap: () {
                                        _getImage(ImageSource.camera);
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.image),
                                      title: const Text('Select from gallery'),
                                      onTap: () {
                                        _getImage(ImageSource.gallery);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.videocam),
                      title: const Text('Add video'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.picture_as_pdf),
                      title: const Text('Add document'),
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          // ignore: unnecessary_null_comparison
          // if (_video != null)
          //   _videoPlayerController.value.isInitialized
          //       ? AspectRatio(
          //           aspectRatio: _videoPlayerController.value.aspectRatio,
          //           child: VideoPlayer(_videoPlayerController),
          //         )
          //       : Container()
          // else
          //   const Text('click here to selected video'),
          // ElevatedButton(
          //     onPressed: () {
          //       _pickVideo();
          //     },
          //     child: const Text('upload video from gallery')),
          if (_imageFile != null)
            Image(
                width: double.infinity,
                height: 240.0,
                image: FileImage(_imageFile!)),
        ],
      ),
    );
  }
}
