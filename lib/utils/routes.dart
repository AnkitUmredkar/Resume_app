import 'package:flutter/material.dart';
import 'package:resume_app/Screens/HomePage/homepage.dart';
import 'package:resume_app/Screens/InformationPage/Education_Information/education_info.dart';
import 'package:resume_app/Screens/InformationPage/Experience_Information/experience_info.dart';
import 'package:resume_app/Screens/InformationPage/Language_Information/language_info.dart';
import 'package:resume_app/Screens/InformationPage/Objective/objective_info.dart';
import 'package:resume_app/Screens/InformationPage/Personal_Informtion/personal_info.dart';
import 'package:resume_app/Screens/InformationPage/Reference_Information/reference_info.dart';
import 'package:resume_app/Screens/InformationPage/Skill/skill_info.dart';
import 'package:resume_app/Screens/InformationPage/information.dart';
import 'package:resume_app/Screens/ViewResume/EditResume/edit_resume.dart';
import 'package:resume_app/Screens/ViewResume/view_resume.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    // '/' : (context) => const HomePage(),
    // '/Information' : (context) => const Information(),
    // '/ViewResume' : (context) => const ViewResume(),
    // '/EditResume' : (context) => const EditResume(),
    // '/PersonalInfo' : (context) => const PersonalInfo(),
    // '/ObjectiveInfo' : (context) => const ObjectiveInfo(),
    // '/EducationInfo' : (context) => const EducationInfo(),
    // '/ExperienceInfo' : (context) => const ExperienceInfo(),
    // '/SkillInfo' : (context) => const SkillInfo(),
    // '/LanguageInfo' : (context) => const LanguageInfo(),
    '/' : (context) => const ReferenceInfo(),
  };
}
