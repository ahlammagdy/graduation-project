import 'package:flutter/material.dart';

Widget sharedButton({
  double width = double.infinity,
  required String text,
  required Function task,
}) {
  return Container(
    width: double.infinity,
    height: 40.0,
    decoration: BoxDecoration(
        color: Colors.red, borderRadius: BorderRadius.circular(30.0)),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: MaterialButton(
      onPressed: task(),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    ),
  );
}

Widget shareTextFiled({
  required TextEditingController controller,
  required String text,
  var keyboardtype = TextInputType.name,
  //IconData? iconData,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        //suffixIcon: Icon(iconData) ,
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        filled: true,
        fillColor: Colors.white),
    keyboardType: keyboardtype,
  );
}

Widget sharedSearch() {
  TextEditingController searchController = TextEditingController();
  return Container(
    width: double.infinity,
    height: 40,
    decoration: BoxDecoration(
        color: const Color(0xFFe9eaec),
        borderRadius: BorderRadius.circular(15)),
    child: TextField(
      cursorColor: const Color(0xFF000000),
      controller: searchController,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: const Color(0xFF000000).withOpacity(0.5),
          ),
          hintText: "Search",
          border: InputBorder.none),
    ),
  );
}

Widget shareTextFiledpass({
  required TextEditingController controller,
  required String text,
  var keyboardtype = TextInputType.name,
}) {
  return TextFormField(
    controller: controller,
    obscureText: true,
    decoration: InputDecoration(
      hintText: text,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      filled: true,
      fillColor: Colors.white,
      prefixIcon: const Icon(
        Icons.lock,
      ),
      suffixIcon: const Icon(
        Icons.remove_red_eye,
      ),
    ),
    keyboardType: keyboardtype,
  );
}

// flutter_svg: ^0.18.1
// residemenu: ^1.3.7
//Flutter run --no-sound-null-safety
