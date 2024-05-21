import 'package:flutter/material.dart';

import '../../utils/global.dart';

String birthDate = '';
String gender = 'Male';

TextEditingController birthDateController = TextEditingController();

ListTile options(String data, IconData icon) {
  return ListTile(
    leading: Icon(icon, size: 24),
    title: Text(
      data,
      style: const TextStyle(fontSize: 20),
    ),
  );
}

OutlineInputBorder buildOutlineInputBorder(double borderWidth) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide(
      color: const Color(0xffA9A9A9),
      width: borderWidth,
    ),
  );
}

TextField buildTextField(int maxLine, String label, var typeOfKeyboard) {
  return TextField(
    keyboardType: typeOfKeyboard,
    textInputAction: TextInputAction.next,
    maxLines: maxLine,
    decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(1.5),
        focusedBorder: buildOutlineInputBorder(2.5),
        hintText: label,
        hintStyle: const TextStyle(fontSize: 18, color: Color(0xff666666))),
  );
}

Row buildRow(double width, String data) {
  return Row(
    children: [
      Text(
        data,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: width * 0.0405),
      ),
      const Text(
        ' *',
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ],
  );
}

Align text(double width, String data) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      data,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          fontSize: width * 0.0405),
    ),
  );
}

Container buttons(double width, String data) {
  return Container(
    alignment: Alignment.center,
    height: 50,
    width: width / 2.4,
    decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(7, 7),
              color: Colors.grey),
        ]),
    child: Text(
      data,
      style: TextStyle(
          color: Colors.white,
          fontSize: width * 0.045,
          fontWeight: FontWeight.bold),
    ),
  );
}
