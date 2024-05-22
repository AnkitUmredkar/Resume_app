import 'package:flutter/material.dart';

Color blueColor = const Color(0xff011031);

AppBar buildAppBar(BuildContext context,String data) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
    toolbarHeight: 70,
    backgroundColor: blueColor,
    title: Text(
      data,
      style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.9),
    ),
  );
}