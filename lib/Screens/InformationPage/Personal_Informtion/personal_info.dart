import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_app/Screens/InformationPage/Personal_Informtion/global.dart';
import 'package:resume_app/utils/global.dart';

ImagePicker imagePicker = ImagePicker();
File? fileImage;
XFile? xFileImage;
GlobalKey<FormState> formKey = GlobalKey();
TextEditingController jobTitleCtrl = TextEditingController();
TextEditingController nameCtrl = TextEditingController();
TextEditingController addressCtrl = TextEditingController();
TextEditingController aboutUSCtrl = TextEditingController();
TextEditingController cityCtrl = TextEditingController();
TextEditingController nationalityCtrl = TextEditingController();
TextEditingController genderCtrl = TextEditingController();
TextEditingController emailCtrl = TextEditingController();
TextEditingController experienceCtrl = TextEditingController();
TextEditingController websiteCtrl = TextEditingController();
TextEditingController marriageCtrl = TextEditingController();
TextEditingController birthDateCtrl = TextEditingController();
TextEditingController phoneCtrl = TextEditingController();

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: blueColor,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: const Text(
            'Personal Information',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'roboto',
                letterSpacing: 0.9),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 22, 10, 10),
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 22, 15, 30),
              width: width,
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 9,
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.all(15),
                                height: 143,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        xFileImage =
                                            await imagePicker.pickImage(
                                                source: ImageSource.gallery);
                                        setState(() {
                                          fileImage = File(xFileImage!.path);
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: options('Gallery', Icons.image),
                                    ),
                                    GestureDetector(
                                        onTap: () async {
                                          xFileImage =
                                              await imagePicker.pickImage(
                                                  source: ImageSource.camera);
                                          setState(() {
                                            fileImage = File(xFileImage!.path);
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: options(
                                            'Camera', Icons.camera_alt)),
                                  ],
                                ),
                              );
                            });
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 27),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffC5C5C5),
                              offset: Offset(0, -1.5),
                              blurRadius: 5),
                          BoxShadow(
                              color: Color(0xffC5C5C5),
                              offset: Offset(0, 8),
                              blurRadius: 15),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white70,
                        radius: width * 0.165,
                        backgroundImage:
                            (fileImage != null) ? FileImage(fileImage!) : null,
                        child: Stack(
                          children: [
                            Center(
                              child: (fileImage == null)
                                  ? Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Image.asset(
                                        'assets/image/personal.png',
                                      ),
                                    )
                                  : null,
                            ),
                            Positioned(
                              bottom: -27,
                              right: 0,
                              child: Container(
                                height: height * 0.12,
                                width: width * 0.12,
                                decoration: BoxDecoration(
                                    color: blueColor, shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  buildRow(width, 'JOB TITLE'),
                  buildTextField(
                    1,
                    'ex: Designer/Android Developer',
                    TextInputType.text,
                    width,
                    jobTitleCtrl,
                  ),
                  buildRow(width, 'NAME'),
                  buildTextField(1, 'ex: Your Name Full Name',
                      TextInputType.text, width, nameCtrl),
                  text(width, 'ADDRESS'),
                  buildTextField(2, 'ex: ShivDarshan Society, ParvatGam, Surat',
                      TextInputType.text, width, addressCtrl),
                  text(width, 'ABOUT US'),
                  buildTextField(
                      3,
                      'A Strong believer in the ability of the architecture and research of the design thinking for strengthening our societies',
                      TextInputType.text,
                      width,
                      aboutUSCtrl),
                  buildRow(width, 'CITY'),
                  buildTextField(
                      1, 'ex: Surat', TextInputType.text, width, cityCtrl),
                  text(width, 'NATIONALITY'),
                  buildTextField(1, 'ex: Indian', TextInputType.text, width,
                      nationalityCtrl),
                  text(width, 'GENDER'),
                  Container(
                    padding: const EdgeInsets.only(right: 12),
                    height: 64,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(34),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildGender('Male', width),
                        buildGender('Female', width),
                        buildGender('Other', width),
                      ],
                    ),
                  ),
                  buildRow(width, 'EMAIL'),
                  buildTextField(
                    1,
                    'ex: youremail@gmail.com',
                    TextInputType.text,
                    width,
                    emailCtrl,
                  ),
                  text(width, 'YEAR OF EXPERIENCE'),
                  buildTextField(
                      1, 'ex: 6', TextInputType.text, width, experienceCtrl),
                  text(width, 'WEBSITE'),
                  buildTextField(1, 'ex: http://yourwebsite.com/',
                      TextInputType.text, width, websiteCtrl),
                  text(width, "MARITIAL STATUS"),
                  Container(
                    padding: const EdgeInsets.only(right: 12),
                    height: 64,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(34),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildMarriage('Single', width),
                        buildMarriage('Married', width),
                      ],
                    ),
                  ),
                  const SizedBox(height: 13),
                  text(width, 'DATE OF BIRTH'),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      setState(() async {
                        DateTime? datePicked = await showDatePicker(
                            barrierColor: Colors.black54,
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: DateTime.now(),
                            lastDate: DateTime.now());
                        if (datePicked != null) {
                          birthDate =
                              '${datePicked.day}/${datePicked.month}/${datePicked.year}';
                          birthDateCtrl.text = birthDate;
                        }
                      });
                    },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: TextField(
                        controller: birthDateCtrl,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'ex: 03-06-1998',
                          hintStyle: TextStyle(
                              fontSize: width * 0.044,
                              color: const Color(0xff666666)),
                          enabledBorder: buildOutlineInputBorder(1),
                          focusedBorder: buildOutlineInputBorder(2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 13),
                  buildRow(width, "PHONE"),
                  buildTextField(
                    1,
                    "ex: 9328871876",
                    TextInputType.number,
                    width,
                    phoneCtrl,
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ckPhone = true;
                            ckEmail = true;
                            checkEmpty = true;
                            if (jobTitleCtrl.text.isEmpty ||
                                nameCtrl.text.isEmpty ||
                                cityCtrl.text.isEmpty ||
                                emailCtrl.text.isEmpty ||
                                phoneCtrl.text.isEmpty) {
                              checkEmpty = false;
                              forEmptyField(context, 'Fill All Required Field');
                            }
                            if (emailCtrl.text.isNotEmpty) {
                              bool checkCapital = false;
                              bool checkSpeChar = false;
                              bool checkgmail = false;
                              for (int i = 0; i < emailCtrl.text.length; i++) {
                                if (emailCtrl.text[i] !=
                                    emailCtrl.text[i].toLowerCase()) {
                                  checkCapital = true;
                                }
                              }
                              for (int i = 0; i < emailCtrl.text.length; i++) {
                                int charCode = emailCtrl.text.codeUnitAt(i);
                                if ((charCode >= 32 && charCode <= 45) ||
                                    (charCode == 47) ||
                                    (charCode >= 58 && charCode <= 63) ||
                                    (charCode >= 91 && charCode <= 96) ||
                                    (charCode >= 123 && charCode <= 126)) {
                                  checkSpeChar = true;
                                }
                              }
                              if (!emailCtrl.text.contains('@gmail.com') ||
                                  emailCtrl.text.length <= 10 ||
                                  checkCapital ||
                                  checkSpeChar) {
                                ckEmail = false;
                                forEmptyField(
                                    context, 'Entered Email Is Not Valid!');
                              }
                            }
                            if (phoneCtrl.text.isNotEmpty) {
                              if (phoneCtrl.text.length < 10) {
                                ckPhone = false;
                                forEmptyField(context,
                                    'Entered Phone Number Is Not Valid!');
                              }
                            }
                            if (ckEmail && ckPhone && checkEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: CupertinoColors.systemGreen,
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    'Data Saved Successfully!',
                                    style: TextStyle(fontSize: 16),
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
                                      style: TextStyle(fontSize: width * 0.038),
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
                                        setState(() {
                                          gender = 'Male';
                                          marriage = '';
                                        });
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

  Row buildGender(String label, double width) {
    return Row(
      children: [
        Radio(
            activeColor: blueColor,
            value: label,
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value!;
              });
            }),
        Text(
          label,
          style: TextStyle(fontSize: width * 0.044),
        )
      ],
    );
  }

  Row buildMarriage(String label, double width) {
    return Row(
      children: [
        Radio(
            activeColor: blueColor,
            value: label,
            groupValue: marriage,
            onChanged: (value) {
              setState(() {
                marriage = value!;
              });
            }),
        Text(
          label,
          style: TextStyle(fontSize: width * 0.044),
        ),
      ],
    );
  }
}

List _controllers = [
  jobTitleCtrl,
  nameCtrl,
  addressCtrl,
  aboutUSCtrl,
  cityCtrl,
  nationalityCtrl,
  genderCtrl,
  emailCtrl,
  experienceCtrl,
  websiteCtrl,
  marriageCtrl,
  birthDateCtrl,
  phoneCtrl,
];

void _clearAllFields() {
  for (var controller in _controllers) {
    controller.clear();
  }
}
