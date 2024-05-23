import 'package:flutter/material.dart';
import 'package:resume_app/Screens/InformationPage/Education_Information/global.dart';
import 'package:resume_app/Screens/InformationPage/Personal_Informtion/global.dart';
import 'package:resume_app/utils/global.dart';

GlobalKey<FormState> formKey = GlobalKey();
TextEditingController cmpNameCtrl = TextEditingController();
TextEditingController jobPositionCtrl = TextEditingController();
TextEditingController startDateCtrl = TextEditingController();
TextEditingController endDateCtrl = TextEditingController();

class ExperienceInfo extends StatefulWidget {
  const ExperienceInfo({super.key});

  @override
  State<ExperienceInfo> createState() => _ExperienceInfoState();
}

class _ExperienceInfoState extends State<ExperienceInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          appBar: buildAppBar(context, 'Experience Details'),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  children: List.generate(
                    expControllerList.length,
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
                                  'Experience ${index + 1}',
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
                                          expControllerList.removeAt(index);
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
                                buildtextFormField('ex:L&T pvt. ltd', width,
                                    expControllerList[index]['cmpNameCtrl'], (value) {
                                      if (value!.isEmpty) {
                                        forEmptyField(context,'Fill All Required Fields');
                                        setState(() {
                                          Index = index;
                                          cmpNameisNotEmptyList[index] = false;
                                        });
                                      }
                                      else{
                                        setState(() {
                                          Index = index;
                                          cmpNameisNotEmptyList[index] = true;
                                        });
                                      }
                                    }),
                                buildRow(width, 'JOB POSITION'),
                                buildtextFormField('ex:Flutter App Developer', width,
                                    expControllerList[index]['jobPositonCtrl'], (value) {
                                      if (value!.isEmpty) {
                                        forEmptyField(context,'Fill All Required Fields');
                                        setState(() {
                                          Index = index;
                                          jobPositionisNotEmptyList[index] = false;
                                        });
                                      }
                                      else{
                                        setState(() {
                                          Index = index;
                                          jobPositionisNotEmptyList[index] = true;
                                        });
                                      }
                                    }),
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
                                        expControllerList[index]['startDateCtrl']
                                            .text = startDateList[index];
                                      }
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5, bottom: 13),
                                    child: AbsorbPointer(
                                      absorbing: true,
                                      child: TextField(
                                        controller: expControllerList[index]
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
                                            expControllerList[index]['endDateCtrl']
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
                                            controller: expControllerList[index]
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
                                                  expControllerList[index]
                                                  ['endDateCtrl']
                                                      .text = 'Present';
                                                } else {
                                                  expControllerList[index]
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
                      TextEditingController cmpNameCtrl = TextEditingController();
                      TextEditingController jobPositionCtrl = TextEditingController();
                      TextEditingController startDateCtrl = TextEditingController();
                      TextEditingController endDateCtrl = TextEditingController();
                      expControllerList.add(
                        {
                          'cmpNameCtrl': cmpNameCtrl,
                          'jobPositonCtrl': jobPositionCtrl,
                          'startDateCtrl': startDateCtrl,
                          'endDateCtrl': endDateCtrl,
                        },
                      );
                      String startDate = '';
                      startDateList.add(startDate);
                      String endDate = '';
                      endDateList.add(endDate);
                      bool checkbox = false,cmpNameisNotEmpty = true,jobPositionisNotEmpty = true;
                      checkboxList.add(checkbox);
                      cmpNameisNotEmptyList.add(cmpNameisNotEmpty);
                      jobPositionisNotEmptyList.add(jobPositionisNotEmpty);
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
                      if (cmpNameisNotEmptyList[Index!] && jobPositionisNotEmptyList[Index!]) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Data Saved Successfully!',
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
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

// -------------------------->TODO All Global Variable and Lists

bool cmpNameisNotEmpty = true,jobPositionisNotEmpty = true,checkbox = false;
String startDate = '',endDate = '';
int? Index;

List cmpNameisNotEmptyList = [
  cmpNameisNotEmpty,
];

List jobPositionisNotEmptyList = [
  jobPositionisNotEmpty,
];

List checkboxList = [
  checkbox,
];

List startDateList = [
  startDate,
];

List endDateList = [
  endDate,
];

List expControllerList = [
  {
    'cmpNameCtrl': cmpNameCtrl,
    'jobPositonCtrl': jobPositionCtrl,
    'startDateCtrl': startDateCtrl,
    'endDateCtrl': endDateCtrl,
  },
];