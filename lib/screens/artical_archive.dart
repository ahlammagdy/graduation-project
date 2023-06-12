import 'package:flutter/material.dart';
import '../moduls/artical_class.dart';
import '../widgets/component.dart';
import '../widgets/artical_ui_item.dart';

class ArchiveArtical extends StatefulWidget {
  final List<ArticalClass> archivedAList;
  final Function toggleAddArticalToArchive;
  final Function isArchivedArtical;

  const ArchiveArtical(
      {super.key,
      required this.archivedAList,
      required this.toggleAddArticalToArchive,
      required this.isArchivedArtical});

  @override
  State<ArchiveArtical> createState() => _ArchiveArticalState();
}

class _ArchiveArticalState extends State<ArchiveArtical> {
  handletoggle(int id) {
    widget.toggleAddArticalToArchive(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.archivedAList.isEmpty) {
      return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.indigo,
            title: sharedSearch(),
            actions: const [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Archive",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              )
            ],
            leading: const Icon(Icons.archive),
          ),
          body: const Center(
            child: Text("there is no archived articals"),
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.indigo,
          title: sharedSearch(),
          actions: const [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Archive",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              width: 5,
            )
          ],
          leading: const Icon(Icons.archive),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
              children: widget.archivedAList
                  // ignore: non_constant_identifier_names
                  .map((Data) => ArticalUIClass(
                        onToggleArchive: handletoggle,
                        isArchivedArtical: widget.isArchivedArtical,
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
}
