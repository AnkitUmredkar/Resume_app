import 'package:flutter/material.dart';
import 'package:resume_app/Screens/InformationPage/Education_Information/global.dart';
import 'package:resume_app/Screens/InformationPage/Personal_Informtion/global.dart';
import 'package:resume_app/utils/global.dart';

TextEditingController skillCtrl = TextEditingController();

class SkillInfo extends StatefulWidget {
  const SkillInfo({super.key});

  @override
  State<SkillInfo> createState() => _SkillInfoState();
}

class _SkillInfoState extends State<SkillInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context, 'Skill Details'),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: List.generate(
                  skillCtrlList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 65,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(blurRadius: 9, color: Colors.black26),
                                ],
                              ),
                              child: ListTile(
                                  leading: Text(
                                    'Skill ${index + 1}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:width * 0.0538,
                                        color: Colors.black),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            skillCtrlList.removeAt(index);
                                          });
                                        },
                                        icon: const Icon(Icons.delete,
                                            color: Colors.black, size: 26),
                                      ),
                                      SizedBox(width: width * 0.045),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: Colors.grey,
                                            size: 33,
                                          )),
                                    ],
                                  )),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              margin: const EdgeInsets.only(bottom: 18),
                              padding: const EdgeInsets.all(14),
                              width: width,
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 12,
                                      offset: Offset(0, 8)),
                                ],
                                color: Color(0xfffcfcfc),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                children: [
                                  buildRow(width, 'NAME'),
                                  textField('ex:Python', width,
                                      skillCtrlList[index]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
              ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    TextEditingController skillCtrl = TextEditingController();
                    skillCtrlList.add(skillCtrl);
                  });
                },
                child: button(width, 'Add', Icons.add)),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    checkSkill = false;
                    for (int i = 0; i < skillCtrlList.length; i++) {
                      if (skillCtrlList[i].text.isEmpty) {
                        checkSkill = true;
                        break;
                      }
                    }
                    if (checkSkill) {
                      forEmptyField(context, 'Fill All Required Fields');
                    } else if(checkSkill == false && skillCtrlList.isNotEmpty){
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
                child: button(width, 'Save', Icons.check)),
          ],
        ),
      ),
    );
  }
}

List skillCtrlList = [];
bool checkSkill = false;
