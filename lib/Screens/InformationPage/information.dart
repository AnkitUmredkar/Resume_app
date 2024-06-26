import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_app/utils/global.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context, 'Create Resume'),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 22, 10, 10),
            child: Container(
              width: width,
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 9,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/PersonalInfo');
                        },
                        child: buildColumn('assets/image/Categories/img_1.png',
                            'Personal', width, height, 0),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/ObjectiveInfo');
                        },
                        child: buildColumn('assets/image/Categories/img_2.png',
                            'Objective', width, height, 0),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/EducationInfo');
                        },
                        child: buildColumn('assets/image/Categories/img_3.png',
                            'Education', width, height, 0),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/ExperienceInfo');
                        },
                        child: buildColumn('assets/image/Categories/img_4.png',
                            'Experience', width, height, 0),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/SkillInfo');
                        },
                        child: buildColumn('assets/image/Categories/img_5.png',
                            'Skills', width, height, 0),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/LanguageInfo');
                        },
                        child: buildColumn('assets/image/Categories/img_6.png',
                            'Language', width, height, 13),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/ReferenceInfo');
                        },
                        child: buildColumn('assets/image/Categories/img_8.png',
                            'Reference', width, height, 6),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/AchievementInfo');
                        },
                        child: buildColumn('assets/image/Categories/img_7.png',
                            'Achievement', width, height, 0),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/SocialInfo');
                        },
                        child: buildColumn('assets/image/Categories/img_9.png',
                            'Social', width, height, 5.5),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/ProjectInfo');
                        },
                        child: buildColumn('assets/image/Categories/img_10.png',
                            'Projects', width, height, 6),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/InterestInfo');
                        },
                        child: buildColumn('assets/image/Categories/img_11.png',
                            'Interest', width, height, 5.5),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/StrengthInfo');
                        },
                        child: buildColumn('assets/image/Categories/img_12.png',
                            'Strength', width, height, 5.5),
                      ),
                    ],
                  ),
                  buildColumn('assets/image/Categories/img_13.png', 'Goal',
                      width, height, 6),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildColumn(
      String src, String data, double width, double height, double padding) {
    return Column(
      children: [
        Container(
          height: height * 0.1,
          width: width * 0.24,
          padding: EdgeInsets.all(padding),
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 6),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xffEBEFF2)),
          child: Image.asset(
            src,
          ),
        ),
        Text(
          data,
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.045),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
