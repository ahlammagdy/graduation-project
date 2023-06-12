import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        body: SingleChildScrollView(
            child: Column(
      children: [
        SizedBox(
          height: 230,
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                width: double.infinity,
                height: 170,
                color: Colors.indigo,
              ),
              Positioned(
                left: 30,
                top: 70,
                child: Stack(alignment: Alignment.bottomRight, children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: const AssetImage("images/person.png"),
                    foregroundImage:
                        _imageFile == null ? null : FileImage(_imageFile!),
                  ),
                  IconButton(
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
                    icon: const Icon(
                      Icons.add_a_photo,
                      size: 30,
                      color: Colors.indigo,
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
        Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Page Name",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: AutofillHints.jobTitle,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 25.0,
                      color: Colors.indigo,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Row(
                children: [
                  Text(
                    "Specialization /  ",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: AutofillHints.jobTitle,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Text(
                    "Ocallist",
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Row(
                children: [
                  Text(
                    "Adress :  ",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: AutofillHints.jobTitle,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Text(
                    "country / city",
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Row(
                children: [
                  Text(
                    "Work Place :  ",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: AutofillHints.jobTitle,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Text(
                    "Hospital Name",
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 4.0,
                width: double.infinity,
                color: Colors.black12,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 25.0,
                    color: Colors.indigo,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "About ",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: AutofillHints.jobTitle,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          size: 25.0,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.all(20.0),
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: const Text(
                    "data adfgrtjtyj vmmtth eewregrttt fwewferg adfgrtjtyj vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg vmmtth eewregrttt fwewferg f,rgrr5h gp5kg vfmvkre ergknerr rgkner",
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  )),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 4.0,
                width: double.infinity,
                color: Colors.black12,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.school,
                    size: 25.0,
                    color: Colors.indigo,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "Certificate",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: AutofillHints.jobTitle,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          size: 25.0,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 100.0,
                color: Colors.grey[200],
                child: const Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.school,
                          color: Colors.indigo,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "owqerrejnxf;lkjreggoirjgnvdjg",
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.school,
                          color: Colors.indigo,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "owqerrejnxf;lkjreggoirjgnvdjg",
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 4.0,
                width: double.infinity,
                color: Colors.black12,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.analytics_outlined,
                    size: 25.0,
                    color: Colors.indigo,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "Analytics ",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: AutofillHints.jobTitle,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          size: 25.0,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 100.0,
                color: Colors.grey[200],
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.model_training,
                          color: Colors.indigo,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Total Static Training Rate  ",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontFamily: AutofillHints.jobTitle,
                              fontSize: 15),
                        ),
                        Text("234/times")
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.note_alt_outlined,
                          color: Colors.indigo,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Total Dynamic Training Rate ",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontFamily: AutofillHints.jobTitle,
                              fontSize: 15),
                        ),
                        Text("23534 /times"),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.note_outlined,
                          color: Colors.indigo,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Last Post Rate  ",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontFamily: AutofillHints.jobTitle,
                              fontSize: 15),
                        ),
                        Text("2353"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 4.0,
                width: double.infinity,
                color: Colors.black12,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.local_activity_outlined,
                    color: Colors.indigo,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "Activities",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: AutofillHints.jobTitle,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "post",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            size: 25.0,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.black12,
              ),
              const SizedBox(
                height: 10.0,
              ),
            ])),
      ],
    )));
  }
}
