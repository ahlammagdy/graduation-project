import 'package:flutter/material.dart';

import '../widgets/component.dart';
import '../moduls/courses_class.dart';
import '../widgets/course_ui_item.dart';

//import 'courses.dart';

class ArchiveCourse extends StatefulWidget {
  const ArchiveCourse(
      {super.key,
      required this.archivedCList,
      required this.toggleAddCourseToArchive,
      required this.isArchivedCourse});

  final List<CoursesClass> archivedCList;
  final Function toggleAddCourseToArchive;
  final Function isArchivedCourse;

  @override
  State<ArchiveCourse> createState() => _ArchiveCourseState();
}

class _ArchiveCourseState extends State<ArchiveCourse> {
  handletoggle(int id) {
    widget.toggleAddCourseToArchive(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.archivedCList.isEmpty) {
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
              leading: const Icon(Icons.archive),
              actions: const [
                Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Archive",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 5,
                )
              ]),
          body: const Center(
            child: Text("there is no archived courses"),
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
            leading: const Icon(Icons.archive),
            actions: const [
              Column(
                children: [
                  SizedBox(
                    height: 15,
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
            ]),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
              children: widget.archivedCList
                  .map((courseData) => CourseUIItem(
                        courseData.courseId,
                        courseData.description,
                        courseData.length,
                        courseData.pictureURL,
                        courseData.title,
                        courseData.playListLink,
                        // ignore: avoid_types_as_parameter_names
                        onToggleArchive: handletoggle,
                        isArchivedCourse: widget.isArchivedCourse,
                      ))
                  .toList()),
        ),
      );
    }
  }
}
