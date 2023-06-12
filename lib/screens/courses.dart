import 'package:flutter/material.dart';
import 'package:smo/screens/add_course.dart';
import 'package:smo/screens/courses_archive.dart';
import 'package:smo/search_page.dart';
import 'package:smo/widgets/course_ui_item.dart';

import '../widgets/menu_widget.dart';
import '../moduls/courses_class.dart';
import '../smo_dummy_data.dart';

class Courses extends StatefulWidget {
  const Courses({
    super.key,
  });

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<CoursesClass> archivedCourseList = [];

  toggleAddCourseToArchive(int courseId) {
    final existingCourseIndex = archivedCourseList
        .indexWhere((courseClass) => courseClass.courseId == courseId);
    if (existingCourseIndex < 0) {
      setState(() {
        archivedCourseList.add(dummyCoursesData
            .firstWhere((courseClass) => courseClass.courseId == courseId));
      });

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("the course added to Archive"),
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
        archivedCourseList.removeAt(existingCourseIndex);
      });

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("the course removed from Archive"),
                    TextButton(
                        onPressed: () {
                          // Navigator.of(context)
                          //     .popUntil((route) => route.isFirst);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text("Ok"))
                  ],
                ),
              ));
    }
  }

  bool isArchivedCourse(int id) {
    return archivedCourseList.any((courseClass) => courseClass.courseId == id);
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
          "Courses",
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
                          builder: (context) => ArchiveCourse(
                                archivedCList: archivedCourseList,
                                toggleAddCourseToArchive:
                                    toggleAddCourseToArchive,
                                isArchivedCourse: isArchivedCourse,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddCourse()));
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
            children: dummyCoursesData
                .map((courseData) => CourseUIItem(
                      courseData.courseId,
                      courseData.description,
                      courseData.length,
                      courseData.pictureURL,
                      courseData.title,
                      courseData.playListLink,
                      onToggleArchive: toggleAddCourseToArchive,
                      isArchivedCourse: isArchivedCourse,
                    ))
                .toList()),
      ),
    );
  }
}
