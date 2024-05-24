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
        appBar: buildAppBar(context, 'Social Details'),
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
                  textField('ex:Enter Linkdin User Name', width, linkdinCtrl),
                  text(width,'FACEBOOK'),
                  textField('ex:Enter Facebook User Name', width, facebookCtrl),
                  text(width,'TWITTER'),
                  textField('ex:Enter Twitter User Name', width, twitterCtrl),
                  text(width,'YOUTUBE'),
                  textField('ex:Enter YouTube User Name', width, youtubeCtrl),
                  text(width,'GITHUB'),
                  textField('ex:Enter Github User Name', width, githubCtrl),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            checksocial = false;
                            for(int i=0; i<socialCtrlList.length; i++){
                              if(socialCtrlList[i].text.isNotEmpty){
                                checksocial = true;
                              }
                            }
                            if(checksocial){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    'Data Save Successfully!',
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            }
                          });
                        },
                        child: buttons(width, 'Save'),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  title: Text(
                                    'Are you sure?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.048,
                                    ),
                                  ),
                                  content: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Text(
                                      'Do you want to clear this form?',
                                      style:
                                      TextStyle(fontSize: width * 0.038),
                                    ),
                                  ),
                                  actions: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'No',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    GestureDetector(
                                      onTap: () {
                                        _clearAllFields();
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                        },
                        child: buttons(width, 'Clear'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _clearAllFields(){
  for(var controller in socialCtrlList){
    controller.clear();
  }
}

List socialCtrlList = [
  linkdinCtrl,
  facebookCtrl,
  twitterCtrl,
  youtubeCtrl,
  githubCtrl
];

TextEditingController linkdinCtrl = TextEditingController();
TextEditingController facebookCtrl = TextEditingController();
TextEditingController twitterCtrl = TextEditingController();
TextEditingController youtubeCtrl = TextEditingController();
TextEditingController githubCtrl = TextEditingController();

bool checksocial = false;