import 'package:flutter/material.dart';
import 'package:resume_app/Screens/HomePage/homepage.dart';
import 'package:resume_app/Screens/InformationPage/information.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/' : (context) => const HomePage(),
    '/Information' : (context) => const Information(),
  };
}
