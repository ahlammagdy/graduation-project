import 'package:flutter/material.dart';

//import 'Component.dart';
import 'add_artical.dart';
import 'artical_archive.dart';
import '../widgets/menu_widget.dart';
import '../moduls/artical_class.dart';
import '../search_page.dart';
import '../smo_dummy_data.dart';
import '../widgets/artical_ui_item.dart';

class Articals extends StatefulWidget {
  const Articals({super.key});

  @override
  State<Articals> createState() => _ArticalsState();
}

class _ArticalsState extends State<Articals> {
  List<ArticalClass> archivedArticalList = [];

  toggleAddArticalToArchive(int articalId) {
    final existingArticalIndex = archivedArticalList
        .indexWhere((articalClass) => articalClass.articalId == articalId);
    if (existingArticalIndex < 0) {
      setState(() {
        archivedArticalList.add(dummyArticalData
            .firstWhere((articalClass) => articalClass.articalId == articalId));
      });

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("the Artical added to Archive"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                        child: const Text("Ok"))
                  ],
                ),
              ));
    } else {
      setState(() {
        archivedArticalList.removeAt(existingArticalIndex);
      });

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("the Artical removed from Archive"),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text("Ok"))
                  ],
                ),
              ));
    }
  }

  bool isArchivedArtical(int id) {
    return archivedArticalList
        .any((articalClass) => articalClass.articalId == id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.red,
        leading: const MenuWidget(),
        title: const Text(
          "Articals",
          style: TextStyle(
            color: Colors.white,
            fontFamily: AutofillHints.jobTitle,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.grey[300],
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ArchiveArtical(
                                archivedAList: archivedArticalList,
                                toggleAddArticalToArchive:
                                    toggleAddArticalToArchive,
                                isArchivedArtical: isArchivedArtical,
                              )));
                },
                icon: const Icon(
                  Icons.archive_rounded,
                  size: 20.0,
                  color: Colors.black,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.grey[300],
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddArtical()));
              },
              icon: const Icon(
                Icons.add,
                size: 20.0,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          CircleAvatar(
            radius: 20.0,
            backgroundColor: const Color(0xFFe9eaec),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
              icon: const Icon(
                Icons.search,
                size: 17.0,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
            children: dummyArticalData
                // ignore: non_constant_identifier_names
                .map((Data) => ArticalUIClass(
                      onToggleArchive: toggleAddArticalToArchive,
                      isArchivedArtical: isArchivedArtical,
                      abstruction: Data.abstruction,
                      articalId: Data.articalId,
                      title: Data.title,
                      numOfPage: Data.numOfPage,
                      articalLink: Data.articalLink,
                      articalPictureURL: Data.articalPicture,
                    ))
                .toList()),
      ),
    );
  }
}
