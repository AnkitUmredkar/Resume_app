import 'package:flutter/material.dart';
import 'package:resume_app/Screens/InformationPage/Education_Information/global.dart';
import 'package:resume_app/Screens/InformationPage/Personal_Informtion/global.dart';
import 'package:resume_app/utils/global.dart';

TextEditingController skillCtrl = TextEditingController();

class AchievementInfo extends StatefulWidget {
  const AchievementInfo({super.key});

  @override
  State<AchievementInfo> createState() => _AchievementInfoState();
}

class _AchievementInfoState extends State<AchievementInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context, 'Achievements Details'),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              awardCtrlList.length,
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
                            'Achievement ${index + 1}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.054,
                                color: Colors.black),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    awardCtrlList.removeAt(index);
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
                          textField('ex:You Wan(Best Betsman Award)', width,
                              awardCtrlList[index]['awardNameCtrl']),
                          buildRow(width, 'YEAR'),
                          GestureDetector(
                            onTap: () {
                              setState(() async {
                                DateTime? datePicked = await showDatePicker(
                                    barrierColor: Colors.black54,
                                    context: context,
                                    firstDate: DateTime(2001),
                                    initialDate: DateTime.now(),
                                    lastDate: DateTime.now());
                                if (datePicked != null) {
                                  dateList[index] =
                                      '${datePicked.day}/${datePicked.month}/${datePicked.year}';
                                  awardCtrlList[index]['dateCtrl'].text =
                                      dateList[index];
                                }
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 13),
                              child: AbsorbPointer(
                                absorbing: true,
                                child: TextField(
                                  controller: awardCtrlList[index]['dateCtrl'],
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    hintText: 'ex: 01-01-2001',
                                    hintStyle: TextStyle(
                                        fontSize: width * 0.044,
                                        color: const Color(0xff666666)),
                                    enabledBorder: buildOutlineInputBorder(1),
                                    focusedBorder: buildOutlineInputBorder(2),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                    TextEditingController awardNameCtrl =
                        TextEditingController();
                    TextEditingController dateCtrl = TextEditingController();
                    String Date = '';
                    dateList.add(Date);
                    awardCtrlList.add(
                        {'awardNameCtrl': awardNameCtrl, 'dateCtrl': dateCtrl});
                  });
                },
                child: button(width, 'Add', Icons.add)),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    check = false;
                    for (int i = 0; i < awardCtrlList.length; i++) {
                      if (awardCtrlList[i]['awardNameCtrl'].text.isEmpty ||
                          awardCtrlList[i]['dateCtrl'].text.isEmpty) {
                        check = true;
                        break;
                      }
                    }
                    if (check) {
                      forEmptyField(context, 'Name And Year Must be Required!');
                    } else {
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

List awardCtrlList = [], dateList = [];
bool check = false;
String Date = '';
