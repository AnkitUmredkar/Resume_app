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
              padding: const EdgeInsets.fromLTRB(15, 22, 15, 0),
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
                  buildTextField(1,'ex: Designer/Android Developer'),
                  const SizedBox(height: 12),
                  buildRow(width, 'NAME'),
                  const SizedBox(
                    height: 5,
                  ),
                  buildTextField(1,'ex: Your Name'),
                  const SizedBox(height: 12),
                  text(width, 'Address'),
                  const SizedBox(
                    height: 5,
                  ),
                  buildTextField(2,'ex: Shivdarshan Society, ParvatGam, Surat'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}