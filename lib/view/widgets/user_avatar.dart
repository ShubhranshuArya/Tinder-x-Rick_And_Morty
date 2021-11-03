import 'package:flutter/material.dart';

Widget userAvatar() {
  return Stack(
    alignment: Alignment.topRight,
    children: [
      Container(
        height: 46,
        width: 46,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset("assets/person.jpg"),
          ),
        ),
      ),
      CircleAvatar(
        radius: 6,
        backgroundColor: Colors.greenAccent,
      ),
    ],
  );
}
