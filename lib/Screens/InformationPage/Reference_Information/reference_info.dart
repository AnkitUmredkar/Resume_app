import 'package:flutter/material.dart';
import 'package:resume_app/Screens/InformationPage/Education_Information/global.dart';
// import 'package:resume_app/Screens/InformationPage/Education_Information/global.dart';
import 'package:resume_app/Screens/InformationPage/Personal_Informtion/global.dart';
import 'package:resume_app/utils/global.dart';

class ReferenceInfo extends StatefulWidget {
  const ReferenceInfo({super.key});

  @override
  State<ReferenceInfo> createState() => _ReferenceInfoState();
}

class _ReferenceInfoState extends State<ReferenceInfo> {
  @override
  Widget build(BuildContext context){
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context, 'Reference Details'),
        body:SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: List.generate(
                rfrCtrlList.length,
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
                              'Reference ${index + 1}',
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
                                      rfrCtrlList.removeAt(index);
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
                            buildRow(width, 'RAFERENCE NAME'),
                            textField('ex:Mohit Sharma', width,
                                rfrCtrlList[index]['rfrNameCtrl']),
                            text(width, 'REFERENCE JOB TITLE'),
                            textField('ex:Android Developer', width,
                                rfrCtrlList[index]['rfrJobCtrl']),
                            text(width, 'REFERENCE COMPANY NAME'),
                            textField('L&T pvt. ltd', width,
                                rfrCtrlList[index]['compNameCtrl']),
                            text(width, 'REFERENCE EMAIL'),
                            textField('ex:referenceemail@gmail.com', width,
                                rfrCtrlList[index]['rfrEmailCtrl']),
                            text(width, 'REFERENCE PHONE NUMBER'),
                            textField('9328871876', width,
                                rfrCtrlList[index]['rfrPhoneCtrl']),
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
                    TextEditingController rfrNameCtrl = TextEditingController();
                    TextEditingController rfrJobCtrl = TextEditingController();
                    TextEditingController compNameCtrl = TextEditingController();
                    TextEditingController rfrEmailCtrl = TextEditingController();
                    TextEditingController rfrPhoneCtrl = TextEditingController();
                    rfrCtrlList.add(
                      {
                        'rfrNameCtrl': rfrNameCtrl,
                        'rfrJobCtrl': rfrJobCtrl,
                        'compNameCtrl': compNameCtrl,
                        'rfrEmailCtrl': rfrEmailCtrl,
                        'rfrPhoneCtrl': rfrPhoneCtrl,
                      },
                    );
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
                    for (int i = 0; i < rfrCtrlList.length; i++) {
                      if (rfrCtrlList[i]['rfrNameCtrl'].text.isEmpty || rfrCtrlList[i]['rfrPhoneCtrl'].text.isEmpty) {
                        check = true;
                        break;
                      }
                    }
                    if (check) {
                      forEmptyField(context, 'Reference Name OR Phone Number Must be Required!');
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
//--------------------------------->TODO Global Variable

List rfrCtrlList = [];
bool check = false,checkNumber = false;