import 'package:flutter/material.dart';
import 'package:resume_app/Screens/InformationPage/Education_Information/global.dart';
import 'package:resume_app/Screens/InformationPage/Personal_Informtion/global.dart';
import 'package:resume_app/utils/global.dart';

class SocialInfo extends StatefulWidget {
  const SocialInfo({super.key});

  @override
  State<SocialInfo> createState() => _SocialInfoState();
}

class _SocialInfoState extends State<SocialInfo> {
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
                children: [
                  text(width,'LINKDIN'),
                  textField('ex:Enter Linkdin User Name', width, facbookCtrl)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
TextEditingController facbookCtrl = TextEditingController();