import 'package:flutter/material.dart';
import 'package:resume_app/Screens/InformationPage/Education_Information/global.dart';
import 'package:resume_app/Screens/InformationPage/Personal_Informtion/global.dart';
import 'package:resume_app/utils/global.dart';

TextEditingController languageCtrl = TextEditingController();

class LanguageInfo extends StatefulWidget {
  const LanguageInfo({super.key});

  @override
  State<LanguageInfo> createState() => _LanguageInfoState();
}

class _LanguageInfoState extends State<LanguageInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context, 'Language Details'),
        body: SingleChildScrollView(
          child: Column(children: List.generate(
              languageCtrlList.length,
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
                            'Language ${index + 1}',
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
                                    languageCtrlList.removeAt(index);
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
                          textField(
                              'ex:English', width, languageCtrlList[index]),
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
                    TextEditingController languageCtrl =
                        TextEditingController();
                    languageCtrlList.add(languageCtrl);
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
                    for (int i = 0; i < languageCtrlList.length; i++) {
                      if (languageCtrlList[i].text.isEmpty) {
                        check = true;
                        break;
                      }
                    }
                    if (check) {
                      forEmptyField(context, 'Language Name Must be Required!');
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

List languageCtrlList = [];
bool check = false;
