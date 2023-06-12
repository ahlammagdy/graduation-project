import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({super.key});

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        leading: const Icon(Icons.airplay),
        title: const Text('Add Course'),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Uplaode",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: ListView(children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Title'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Discription'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Length'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'link'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Uplaode picture",
                          style: TextStyle(color: Colors.indigo),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.add_photo_alternate,
                          color: Colors.indigo,
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
        _imageFile != null
            ? Image(
                width: double.infinity,
                height: 240.0,
                image: FileImage(_imageFile!))
            : const Text(
                "you must uplaode a picture from the video !",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 122, 30, 23)),
              )
      ]),
    );
  }
}
