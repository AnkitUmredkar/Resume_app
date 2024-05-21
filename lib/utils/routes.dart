import 'package:flutter/material.dart';
import 'package:resume_app/Screens/HomePage/homepage.dart';
import 'package:resume_app/Screens/InformationPage/Informations/personal_info.dart';
import 'package:resume_app/Screens/InformationPage/information.dart';
import 'package:resume_app/Screens/ViewResume/EditResume/edit_resume.dart';
import 'package:resume_app/Screens/ViewResume/view_resume.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/' : (context) => const HomePage(),
    '/Information' : (context) => const Information(),
    '/ViewResume' : (context) => const ViewResume(),
    '/EditResume' : (context) => const EditResume(),
    '/PersonalInfo' : (context) => const PersonalInfo(),
  };
}
