import 'package:flutter/material.dart';
import 'package:resume_app/Screens/InformationPage/Education_Information/education_info.dart';
import 'package:resume_app/Screens/InformationPage/Education_Information/global.dart';
import 'package:resume_app/utils/global.dart';

GlobalKey<FormState> formKey = GlobalKey();
TextEditingController courseCtrl = TextEditingController();
TextEditingController clgNameCtrl = TextEditingController();
TextEditingController gradeCtrl = TextEditingController();
TextEditingController startDateCtrl = TextEditingController();
TextEditingController endDateCtrl = TextEditingController();

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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
            child: SingleChildScrollView(
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
                        leading: const Text(
                          'Education',
                          style: TextStyle(
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
                                    txtControllerList.remove(txtController);
                                  });
                                },
                                icon: const Icon(Icons.delete,
                                    color: Colors.black, size: 26)),
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
                        text(width, 'DEGREE/COURSE NAME'),
                        textField('ex:BCA', width, courseCtrl),
                        buildRow(width, 'COLLEGE/INSTITUE'),
                        buildtextFormField('ex:DRB College', width, clgNameCtrl,
                            (value) {
                          if (value!.isEmpty) {
                            forEmptyField(context, 'Field Must Be Required');
                            checkClgNameisEmpty = true;
                          }
                        }),
                        text(width, 'GRADE/PERCENTAGE'),
                        textField('ex: A++/78%', width, gradeCtrl),
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
                                startDate =
                                    '${datePicked.day}/${datePicked.month}/${datePicked.year}';
                                startDateCtrl.text = startDate;
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 13),
                            child: AbsorbPointer(
                              absorbing: true,
                              child: TextField(
                                controller: startDateCtrl,
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
                                    endDateCtrl.text = endDate;
                                  }
                                });
                              },
                              child: Container(
                                width: width * 0.55,
                                margin:
                                    const EdgeInsets.only(top: 5, bottom: 13),
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: TextField(
                                    controller: endDateCtrl,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      hintText: 'ex: 31-12-2003',
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
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                    value: checkbox,
                                    activeColor: blueColor,
                                    onChanged: (value) {
                                      setState(() {
                                        checkbox = value!;
                                        if(checkbox){
                                          endDateCtrl.text = 'Present';
                                        }
                                        else{
                                          endDateCtrl.text = '';
                                        }
                                      });
                                    }),
                                const Text(
                                  'Present',
                                  style: TextStyle(fontSize: 20),
                                )
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
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    TextEditingController txtController =
                        TextEditingController();
                    txtControllerList.add(txtController);
                  });
                },
                child: button(width, 'Add', Icons.add)),
            const SizedBox(
              width: 8,
            ),
            button(width, 'Save', Icons.check),
          ],
        ),
      ),
    );
  }
}

List txtControllerList = [txtController];
TextEditingController txtController = TextEditingController();

Container button(double width, String data, var icon) {
  return Container(
    padding: const EdgeInsets.all(10),
    height: 55,
    width: width * 0.28,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: blueColor,
      boxShadow: const [
        BoxShadow(offset: Offset(4, 4), blurRadius: 10, color: Colors.black54),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Text(
          data,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 19),
        ),
      ],
    ),
  );
}
