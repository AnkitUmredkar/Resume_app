import 'package:flutter/material.dart';
import 'package:resume_app/Screens/InformationPage/Education_Information/global.dart';
import 'package:resume_app/Screens/InformationPage/Personal_Informtion/global.dart';
import 'package:resume_app/utils/global.dart';

class EducationInfo extends StatefulWidget {
  const EducationInfo({super.key});

  @override
  State<EducationInfo> createState() => _EducationInfoState();
}

class _EducationInfoState extends State<EducationInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context, 'Education Details'),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
                children: List.generate(
              txtControllerList.length,
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
                            'Education ${index + 1}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.0538,
                                color: Colors.black),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    txtControllerList.removeAt(index);
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
                          buildRow(width, 'DEGREE/COURSE NAME'),
                          buildtextFormField('ex:BCA', width,
                              txtControllerList[index]['courseCtrl'], (value) {
                                if (value!.isEmpty) {
                                  forEmptyField(context,'Fill All Required Fields');
                                  setState(() {
                                    Index = index;
                                    clgNameisNotEmptyList[index] = false;
                                  });
                                }
                                else{
                                  setState(() {
                                    Index = index;
                                    clgNameisNotEmptyList[index] = true;
                                  });
                                }
                              }),
                          buildRow(width, 'COLLEGE/INSTITUE'),
                          buildtextFormField('ex:DRB College', width,
                              txtControllerList[index]['clgNameCtrl'], (value) {
                                if (value!.isEmpty) {
                                  forEmptyField(context,'Fill All Required Fields');
                                  setState(() {
                                    Index = index;
                                    clgNameisNotEmptyList[index] = false;
                                  });
                                }
                            else{
                              setState(() {
                                Index = index;
                                clgNameisNotEmptyList[index] = true;
                              });
                            }
                          }),
                          text(width, 'GRADE/PERCENTAGE'),
                          textField('ex: A++/78%', width,
                              txtControllerList[index]['gradeCtrl']),
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
                                  txtControllerList[index]['startDateCtrl']
                                      .text = startDateList[index];
                                }
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 13),
                              child: AbsorbPointer(
                                absorbing: true,
                                child: TextField(
                                  controller: txtControllerList[index]
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
                          Row(
                            children: [
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
                                      txtControllerList[index]['endDateCtrl']
                                          .text = endDate;
                                    }
                                  });
                                },
                                child: Container(
                                  width: width * 0.58,
                                  margin:
                                      const EdgeInsets.only(top: 5, bottom: 13),
                                  child: AbsorbPointer(
                                    absorbing: true,
                                    child: TextField(
                                      controller: txtControllerList[index]
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
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                      value: checkboxList[index],
                                      activeColor: blueColor,
                                      onChanged: (value) {
                                        setState(() {
                                          checkboxList[index] = value!;
                                          if (checkboxList[index]) {
                                            txtControllerList[index]
                                                    ['endDateCtrl']
                                                .text = 'Present';
                                          } else {
                                            txtControllerList[index]
                                                    ['endDateCtrl']
                                                .text = '';
                                          }
                                        });
                                      }),
                                  Text(
                                    'Present',
                                    style: TextStyle(fontSize: width * 0.0482),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    TextEditingController courseCtrl = TextEditingController();
                    TextEditingController clgNameCtrl = TextEditingController();
                    TextEditingController gradeCtrl = TextEditingController();
                    TextEditingController startDateCtrl =
                        TextEditingController();
                    TextEditingController endDateCtrl = TextEditingController();
                    txtControllerList.add(
                      {
                        'courseCtrl': courseCtrl,
                        'clgNameCtrl': clgNameCtrl,
                        'gradeCtrl': gradeCtrl,
                        'startDateCtrl': startDateCtrl,
                        'endDateCtrl': endDateCtrl,
                      },
                    );
                    String startDate = '';
                    startDateList.add(startDate);
                    String endDate = '';
                    endDateList.add(endDate);
                    bool checkbox = false,clgNameisNotEmpty = true;
                    checkboxList.add(checkbox);
                    clgNameisNotEmptyList.add(clgNameisNotEmpty);
                  });
                },
                child: button(width, 'Add', Icons.add)),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    bool response = formKey.currentState!.validate();
                    if (clgNameisNotEmptyList[Index!]) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            'Data Saved Successfully!',
                            style: TextStyle(fontSize: 16),
                          )));
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
