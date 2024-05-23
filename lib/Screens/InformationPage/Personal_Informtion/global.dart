import 'package:flutter/material.dart';
import '../../../utils/global.dart';

bool ckJobTitle = true,
    ckName = true,
    ckCity = true,
    ckEmail = true,
    ckPhone = true;

String birthDate = '';
String gender = 'Male';
String marriage = '';

ListTile options(String data, IconData icon) {
  return ListTile(
    leading: Icon(icon, size: 24),
    title: Text(
      data,
      style: const TextStyle(fontSize: 20),
    ),
  );
}

Container buildTextFormField(
  int maxLine,
  String label,
  var typeOfKeyboard,
  double width,
  var controller,
  String? Function(String?)? validator,
) {
  return Container(
    margin: const EdgeInsets.only(top: 5,bottom: 13),
    child: TextFormField(
      validator: validator,
      keyboardType: typeOfKeyboard,
      textInputAction: TextInputAction.next,
      controller: controller,
      maxLines: maxLine,
      decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(1.5),
          focusedBorder: buildOutlineInputBorder(2.5),
          hintText: label,
          hintStyle:
              TextStyle(fontSize: width * 0.044, color: const Color(0xff666666))),
    ),
  );
}

Container buildTextField(
  int maxLine,
  String label,
  var typeOfKeyboard,
  double width,
  var controller,
) {
  return Container(
    margin: const EdgeInsets.only(top: 5, bottom: 13),
    child: TextField(
      keyboardType: typeOfKeyboard,
      textInputAction: TextInputAction.next,
      controller: controller,
      maxLines: maxLine,
      decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(1.5),
          focusedBorder: buildOutlineInputBorder(2.5),
          hintText: label,
          hintStyle: TextStyle(
              fontSize: width * 0.044, color: const Color(0xff666666))),
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
              spreadRadius: 0,
              blurRadius: 13,
              offset: Offset(7, 7),
              color: Colors.black54),
        ]),
    child: Text(
      data,
      style: TextStyle(
          color: Colors.white,
          fontSize: width * 0.046,
          fontWeight: FontWeight.bold),
    ),
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
            fontSize: width * 0.041),
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
          fontSize: width * 0.0415),
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
