import 'package:flutter/material.dart';
import 'package:resume_app/Screens/InformationPage/Education_Information/global.dart';
import 'package:resume_app/Screens/InformationPage/Personal_Informtion/global.dart';
import 'package:resume_app/utils/global.dart';

class ProjectInfo extends StatefulWidget {
  const ProjectInfo({super.key});

  @override
  State<ProjectInfo> createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<ProjectInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context, 'Project Details'),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: List.generate(
                projectCtrlList.length,
                    (index) => Padding(
                  padding: const EdgeInsets.fromLTRB(10, 16, 10, 0),
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
                              'Project  ${index + 1}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.black),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      projectCtrlList.removeAt(index);
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
                            buildRow(width, 'COMPANY NAME'),
                            textField('ex:L&T pvt. ltd', width,
                                projectCtrlList[index]['cmpNameCtrl']),
                            buildRow(width, 'ROLE'),
                            textField('ex:Developer', width,
                                projectCtrlList[index]['roleCtrl']),
                            buildRow(width, 'PROJECT TITLE'),
                            textField('ex: System Engineering', width,
                                projectCtrlList[index]['titleCtrl']),
                            text(width, 'DATE FROM'),
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
                                    startDateList[index] =
                                    '${datePicked.day}/${datePicked.month}/${datePicked.year}';
                                    projectCtrlList[index]['startDateCtrl']
                                        .text = startDateList[index];
                                  }
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 5, bottom: 13),
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: TextField(
                                    controller: projectCtrlList[index]
                                    ['startDateCtrl'],
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
                            text(width, 'DATE TO'),
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
                                    endDate =
                                    '${datePicked.day}/${datePicked.month}/${datePicked.year}';
                                    projectCtrlList[index]['endDateCtrl']
                                        .text = endDate;
                                  }
                                });
                              },
                              child: Container(

                                margin:
                                const EdgeInsets.only(top: 5, bottom: 13),
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: TextField(
                                    controller: projectCtrlList[index]
                                    ['endDateCtrl'],
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      hintText: 'ex: 31-12-2003',
                                      hintStyle: TextStyle(
                                          fontSize: width * 0.044,
                                          color: const Color(0xff666666)),
                                      enabledBorder:
                                      buildOutlineInputBorder(1),
                                      focusedBorder:
                                      buildOutlineInputBorder(2),
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
              )),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    TextEditingController cmpNameCtrl = TextEditingController();
                    TextEditingController roleCtrl = TextEditingController();
                    TextEditingController titleCtrl = TextEditingController();
                    TextEditingController startDateCtrl =
                    TextEditingController();
                    TextEditingController endDateCtrl = TextEditingController();
                    projectCtrlList.add(
                      {
                        'cmpNameCtrl': cmpNameCtrl,
                        'roleCtrl': roleCtrl,
                        'titleCtrl': titleCtrl,
                        'startDateCtrl': startDateCtrl,
                        'endDateCtrl': endDateCtrl,
                      },
                    );
                    String startDate = '';
                    startDateList.add(startDate);
                    String endDate = '';
                    endDateList.add(endDate);
                  });
                },
                child: button(width, 'Add', Icons.add)),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    checkProject = false;
                    for(int i=0; i<projectCtrlList.length; i++){
                      if(projectCtrlList[i]['cmpNameCtrl'].text.isNotEmpty || projectCtrlList[i]['roleCtrl'].text.isNotEmpty || projectCtrlList[i]['titleCtrl'].text.isNotEmpty){
                        checkProject = true;
                      }
                    }
                    if(checkProject){
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
                    else if(checkProject == false && projectCtrlList.isNotEmpty){
                      forEmptyField(context, 'Fill All Required Fields');
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

List projectCtrlList = [],startDateList = [],endDateList = [];
String startDate = '',endDate = '';
bool checkProject = false;