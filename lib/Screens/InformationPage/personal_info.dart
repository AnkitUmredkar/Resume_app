import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_app/Screens/InformationPage/global.dart';
import 'package:resume_app/utils/global.dart';

ImagePicker imagePicker = ImagePicker();
File? fileImage;
XFile? xFileImage;

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
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
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
                  const SizedBox(
                    height: 5,
                  ),
                  buildTextField(
                      1, 'ex: Designer/Android Developer', TextInputType.text),
                  const SizedBox(height: 13),
                  buildRow(width, 'NAME'),
                  const SizedBox(
                    height: 5,
                  ),
                  buildTextField(1, 'ex: Your Name', TextInputType.text),
                  const SizedBox(height: 13),
                  text(width, 'ADDRESS'),
                  const SizedBox(
                    height: 5,
                  ),
                  buildTextField(2, 'ex: ShivDarshan Society, ParvatGam, Surat',
                      TextInputType.text),
                  const SizedBox(height: 13),
                  text(width, 'ABOUT US'),
                  const SizedBox(
                    height: 5,
                  ),
                  buildTextField(
                      3,
                      'A Strong believer in the ability of the architecture and research of the design thinking for strengthening our societies',
                      TextInputType.text),
                  const SizedBox(height: 13),
                  buildRow(width, 'CITY'),
                  const SizedBox(height: 5),
                  buildTextField(1, 'ex: Surat', TextInputType.text),
                  const SizedBox(height: 13),
                  text(width, 'NATIONALITY'),
                  const SizedBox(height: 5),
                  buildTextField(1, 'ex: Indian', TextInputType.text),
                  const SizedBox(height: 13),
                  text(width, 'GENDER'),
                  const SizedBox(
                    height: 5,
                  ),
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
                        buildGender('Male'),
                        buildGender('Female'),
                        buildGender('Other'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 13),
                  buildRow(width, 'EMAIL'),
                  const SizedBox(height: 5),
                  buildTextField(
                      1, 'ex: youremail@gmail.com', TextInputType.text),
                  const SizedBox(height: 13),
                  text(width, 'YEAR OF EXPERIENCE'),
                  const SizedBox(height: 5),
                  buildTextField(1, 'ex: 6', TextInputType.text),
                  const SizedBox(height: 13),
                  text(width, 'WEBSITE'),
                  const SizedBox(height: 5),
                  buildTextField(
                      1, 'ex: http://yourwebsite.com/', TextInputType.text),
                  const SizedBox(height: 13),
                  text(width, "FATHER'S NAME"),
                  const SizedBox(height: 5),
                  buildTextField(
                      1, "ex: Your Father's Name", TextInputType.text),
                  const SizedBox(height: 13),
                  text(width, "MARITIAL STATUS"),
                  const SizedBox(height: 5),
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
                        buildGender('Single'),
                        buildGender('Married'),
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
                          birthDateController.text = birthDate;
                        }
                      });
                    },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: TextField(
                        controller: birthDateController,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'ex: 03-06-1998',
                          hintStyle: const TextStyle(
                              fontSize: 18, color: Color(0xff666666)),
                          enabledBorder: buildOutlineInputBorder(1),
                          focusedBorder: buildOutlineInputBorder(2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 13),
                  text(width, "PHONE"),
                  const SizedBox(height: 5),
                  buildTextField(1, "ex: 9328871876", TextInputType.number),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: buttons(width, 'Save'),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
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

  Row buildGender(String label) {
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
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
