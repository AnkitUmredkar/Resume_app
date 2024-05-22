import 'package:flutter/material.dart';

Color blueColor = const Color(0xff011031);

AppBar buildAppBar(BuildContext context, String data) {
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
          color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 0.9),
    ),
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
          fontSize: width * 0.041),
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

Container textField(
  String label,
  double width,
  var controller,
) {
  return Container(
    margin: const EdgeInsets.only(top: 5, bottom: 13),
    child: TextField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(1.5),
          focusedBorder: buildOutlineInputBorder(2.5),
          hintText: label,
          hintStyle: TextStyle(
              fontSize: width * 0.044, color: const Color(0xff666666))),
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

Container buildtextFormField(
    String label,
    double width,
    var controller,
    String? Function(String?)? validator,
    ) {
  return Container(
    margin: const EdgeInsets.only(top: 5, bottom: 13),
    child: TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(1.5),
          focusedBorder: buildOutlineInputBorder(2.5),
          hintText: label,
          hintStyle:
          TextStyle(fontSize: width * 0.044, color: const Color(0xff666666))),
    ),
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> forEmptyField(
    BuildContext context, String data) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        '$data',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      )));
}