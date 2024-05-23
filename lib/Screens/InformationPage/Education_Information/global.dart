import 'package:flutter/material.dart';
import 'package:resume_app/Screens/InformationPage/Personal_Informtion/global.dart';
import 'package:resume_app/utils/global.dart';

GlobalKey<FormState> formKey = GlobalKey();
TextEditingController courseCtrl = TextEditingController();
TextEditingController clgNameCtrl = TextEditingController();
TextEditingController gradeCtrl = TextEditingController();
TextEditingController startDateCtrl = TextEditingController();
TextEditingController endDateCtrl = TextEditingController();

bool clgNameisNotEmpty = true,checkbox = false;
String startDate = '',endDate = '';
int? Index;

List clgNameisNotEmptyList = [
  clgNameisNotEmpty,
];

List checkboxList = [
  checkbox,
];

List startDateList = [
  startDate,
];

List endDateList = [
  endDate,
];

List txtControllerList = [
  {
    'courseCtrl': courseCtrl,
    'clgNameCtrl': clgNameCtrl,
    'gradeCtrl': gradeCtrl,
    'startDateCtrl': startDateCtrl,
    'endDateCtrl': endDateCtrl,
  },
];

Container button(double width, String data, var icon) {
  return Container(
    padding: const EdgeInsets.all(10),
    height: 55,
    width: width * 0.28,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: blueColor,
      boxShadow: const [
        BoxShadow(offset: Offset(4, 4), blurRadius: 10, color: Colors.black54),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Text(
          data,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 19),
        ),
      ],
    ),
  );
}

Container buildtextFormField(
    String label,
    double width,
    var controller,
    String? Function(String?)? validator,
    ) {
  return Container(
    margin: const EdgeInsets.only(bottom: 13, top: 5),
    child: TextFormField(
      validator: validator,
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