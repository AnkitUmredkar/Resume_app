import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:resume_app/Screens/InformationPage/Achievement_Information/achievement_Info.dart';
import 'package:resume_app/Screens/InformationPage/Education_Information/global.dart';
import 'package:resume_app/Screens/InformationPage/Experience_Information/experience_info.dart';
import 'package:resume_app/Screens/InformationPage/Language_Information/language_info.dart';
import 'package:resume_app/Screens/InformationPage/Project_Information/project_info.dart';
import 'package:resume_app/Screens/InformationPage/Reference_Information/reference_info.dart';
import 'package:resume_app/Screens/InformationPage/Skill/skill_info.dart';
import 'package:resume_app/Screens/InformationPage/Strength_Information/strength_info.dart';
import '../InformationPage/Personal_Informtion/personal_info.dart';

class pdfScreen extends StatefulWidget {
  const pdfScreen({super.key});

  @override
  State<pdfScreen> createState() => _pdfScreenState();
}

class _pdfScreenState extends State<pdfScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PdfPreview(
          build: (format) => generatePdf(),
        ),
      ),
    );
  }
}

Future<Uint8List> generatePdf() async {
  final pdf = pw.Document();
  final image = (fileImage != null)
      ? pw.MemoryImage(fileImage!.readAsBytesSync())
      : await imageFromAssetBundle('assets/image/nullimg.png');
  final icon1 = await imageFromAssetBundle('assets/image/icons/icon1.png');
  final icon2 = await imageFromAssetBundle('assets/image/icons/icon2.png');
  final icon3 = await imageFromAssetBundle('assets/image/icons/icon3.png');
  final icon4 = await imageFromAssetBundle('assets/image/icons/icon4.png');
  final icon5 = await imageFromAssetBundle('assets/image/icons/icon5.png');
  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets.zero,
      build: (context) => pw.Stack(
        children: [
          //---------------------------->todo black Container
          pw.Container(
            height: 841.8,
            width: 230,
            padding: const pw.EdgeInsets.only(top: 210, left: 20, right: 5),
            decoration: const pw.BoxDecoration(
              color: PdfColor.fromInt(0xff181818),
            ),
            child: pw.Column(
              mainAxisSize: pw.MainAxisSize.min,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'CONTACT : ',
                  style: pw.TextStyle(
                      color: PdfColors.white,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 20),
                ),
                pw.SizedBox(height: 5),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 33,
                      width: 33,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration: const pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          color: PdfColor.fromInt(0xff05357D)),
                      child: pw.Image(icon1),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        addressCtrl.text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 33,
                      width: 33,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration: const pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          color: PdfColor.fromInt(0xff05357D)),
                      child: pw.Image(icon2),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        phoneCtrl.text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 33,
                      width: 33,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration: const pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          color: PdfColor.fromInt(0xff05357D)),
                      child: pw.Image(icon3),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        emailCtrl.text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 33,
                      width: 33,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration: const pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          color: PdfColor.fromInt(0xff05357D)),
                      child: pw.Image(icon4),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        nationalityCtrl.text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 33,
                      width: 33,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration: const pw.BoxDecoration(
                        shape: pw.BoxShape.circle,
                        color: PdfColor.fromInt(0xff05357D),
                      ),
                      child: pw.Image(icon5),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        birthDateCtrl.text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 2),
                pw.Divider(
                  color: PdfColors.blue,
                  thickness: 2,
                ),
                pw.Text(
                  'SKILLS',
                  style: pw.TextStyle(
                      color: PdfColors.white,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 20),
                ),
                pw.SizedBox(height: 2),
                ...List.generate(
                  skillCtrlList.length,
                  (index) => pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          skillCtrlList[index].text,
                          style: const pw.TextStyle(
                              color: PdfColors.white, fontSize: 16),
                        ),
                        pw.Text(
                          '${SliderRange[index].toInt()}% ',
                          style: const pw.TextStyle(
                              color: PdfColors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                pw.Divider(
                  color: PdfColors.blue,
                  thickness: 2,
                ),
                pw.Text(
                  'LANGUAGE',
                  style: pw.TextStyle(
                      color: PdfColors.white,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 20),
                ),
                pw.SizedBox(height: 2),
                ...List.generate(
                  languageCtrlList.length,
                  (index) => pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5),
                    child: pw.Text(
                      languageCtrlList[index].text,
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 16),
                    ),
                  ),
                ),
                pw.Divider(
                  color: PdfColors.blue,
                  thickness: 2,
                ),
                pw.Text(
                  'ACHIEVEMENTS',
                  style: pw.TextStyle(
                      color: PdfColors.white,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 20),
                ),
                pw.SizedBox(height: 2),
                ...List.generate(
                  awardCtrlList.length,
                  (index) => pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5),
                    child: pw.Text(
                      '${awardCtrlList[index]['awardNameCtrl'].text}\n${awardCtrlList[index]['dateCtrl'].text}',
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 16),
                    ),
                  ),
                ),
                pw.Divider(
                  color: PdfColors.blue,
                  thickness: 2,
                ),
                pw.Text(
                  'STRENGTH',
                  style: pw.TextStyle(
                      color: PdfColors.white,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 20),
                ),
                pw.SizedBox(height: 2),
                ...List.generate(
                  strengthCtrlList.length,
                  (index) => pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5),
                    child: pw.Text(
                      strengthCtrlList[index].text,
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //------------------------------------------->todo Name And JobTitle
          pw.Align(
            alignment: pw.Alignment.topRight,
            child: pw.Container(
              height: 125,
              width: 460,
              padding: const pw.EdgeInsets.fromLTRB(83, 10, 0, 0),
              margin: const pw.EdgeInsets.only(top: 45),
              decoration: const pw.BoxDecoration(
                color: PdfColor.fromInt(0xff05357D),
              ),
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      nameCtrl.text,
                      style: pw.TextStyle(
                          color: PdfColors.white,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 40),
                    ),
                    pw.SizedBox(height: 8),
                    pw.Text(
                      jobTitleCtrl.text,
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 25),
                    ),
                  ]),
            ),
          ),
          //------------------------------------------>todo Profile Image
          pw.Container(
            height: 170,
            width: 170,
            alignment: pw.Alignment.center,
            margin: const pw.EdgeInsets.only(top: 22, left: 20),
            decoration: pw.BoxDecoration(
              shape: pw.BoxShape.circle,
              border: pw.Border.all(
                color: const PdfColor.fromInt(0xff05357D),
                width: 5,
              ),
              color: const PdfColor.fromInt(0xff05357D),
              image: pw.DecorationImage(
                fit: pw.BoxFit.cover,
                image: image,
              ),
            ),
          ),
          pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Container(
              width: 600,
              padding: const pw.EdgeInsets.only(right: 5),
              margin: const pw.EdgeInsets.only(left: 248, top: 190),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'ABOUT ME ',
                    style: pw.TextStyle(
                        color: const PdfColor.fromInt(0xff181818),
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 20),
                  ),
                  pw.SizedBox(height: 6),
                  pw.Text(
                    aboutUSCtrl.text,
                    style: const pw.TextStyle(
                        color: PdfColor.fromInt(0xff181818), fontSize: 16),
                  ),
                  pw.SizedBox(height: 1),
                  pw.Divider(
                    thickness: 2.5,
                    color: const PdfColor.fromInt(0xff05357D),
                  ),
                  pw.SizedBox(height: 1),
                  pw.Text(
                    'EDUCATION',
                    style: pw.TextStyle(
                        color: const PdfColor.fromInt(0xff181818),
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 20),
                  ),
                  pw.SizedBox(height: 7),
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Stack(
                        children: [
                          pw.Container(
                            height: 80,
                            width: 4.5,
                            margin: const pw.EdgeInsets.only(left: 2.5, top: 8),
                            alignment: pw.Alignment.topCenter,
                            decoration: const pw.BoxDecoration(
                              color: PdfColor.fromInt(0xff05357D),
                            ),
                          ),
                          pw.Align(
                            alignment: pw.Alignment.topLeft,
                            child: pw.Container(
                              height: 10,
                              width: 10,
                              margin: const pw.EdgeInsets.only(top: 8),
                              decoration: const pw.BoxDecoration(
                                shape: pw.BoxShape.circle,
                                color: PdfColor.fromInt(0xff05357D),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...List.generate(
                        txtControllerList.length,
                        (index) => pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              '  ${txtControllerList[index]['clgNameCtrl'].text}',
                              style: pw.TextStyle(
                                  color: const PdfColor.fromInt(0xff05357D),
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16),
                            ),
                            pw.SizedBox(height: 1.2),
                            pw.Text(
                              '  ${txtControllerList[index]['courseCtrl'].text}',
                              style: const pw.TextStyle(
                                  color: PdfColor.fromInt(0xff181818),
                                  fontSize: 16),
                            ),
                            pw.SizedBox(height: 1.2),
                            pw.Text(
                              '  ${txtControllerList[index]['startDateCtrl'].text} - ${txtControllerList[index]['endDateCtrl'].text}',
                              style: const pw.TextStyle(
                                  color: PdfColor.fromInt(0xff181818),
                                  fontSize: 16),
                            ),
                            pw.SizedBox(height: 1.2),
                            pw.Text(
                              '  Grade - ${txtControllerList[index]['gradeCtrl'].text}',
                              style: const pw.TextStyle(
                                  color: PdfColor.fromInt(0xff181818),
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 1.2),
                  pw.Divider(
                    thickness: 2.5,
                    color: const PdfColor.fromInt(0xff05357D),
                  ),
                  pw.SizedBox(height: 1.2),
                  pw.Text(
                    'WORK EXPERIENCE',
                    style: pw.TextStyle(
                        color: const PdfColor.fromInt(0xff181818),
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 20),
                  ),
                  pw.SizedBox(height: 6),
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Stack(
                        children: [
                          pw.Container(
                            height: 80,
                            width: 4.5,
                            margin: const pw.EdgeInsets.only(left: 2.5, top: 8),
                            alignment: pw.Alignment.topCenter,
                            decoration: const pw.BoxDecoration(
                              color: PdfColor.fromInt(0xff05357D),
                            ),
                          ),
                          pw.Align(
                            alignment: pw.Alignment.topLeft,
                            child: pw.Container(
                              height: 10,
                              width: 10,
                              margin: const pw.EdgeInsets.only(top: 8),
                              decoration: const pw.BoxDecoration(
                                shape: pw.BoxShape.circle,
                                color: PdfColor.fromInt(0xff05357D),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...List.generate(
                        expControllerList.length,
                        (index) => pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              '  ${expControllerList[index]['jobPositonCtrl'].text}',
                              style: pw.TextStyle(
                                  color: const PdfColor.fromInt(0xff05357D),
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16),
                            ),
                            pw.SizedBox(height: 1.5),
                            pw.Text(
                              '  ${expControllerList[index]['cmpNameCtrl'].text}',
                              style: const pw.TextStyle(
                                  color: PdfColor.fromInt(0xff181818),
                                  fontSize: 16),
                            ),
                            pw.SizedBox(height: 1.5),
                            pw.Text(
                              '  ${expControllerList[index]['startDateCtrl'].text} - ${expControllerList[index]['endDateCtrl'].text}',
                              style: const pw.TextStyle(
                                  color: PdfColor.fromInt(0xff181818),
                                  fontSize: 16),
                            ),
                            pw.SizedBox(height: 1.5),
                            pw.Text(
                              '  ${expControllerList[index]['cityCtrl'].text}',
                              style: const pw.TextStyle(
                                  color: PdfColor.fromInt(0xff181818),
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 1.2),
                  pw.Divider(
                    thickness: 2.5,
                    color: const PdfColor.fromInt(0xff05357D),
                  ),
                  pw.SizedBox(height: 1.2),
                  pw.Text(
                    'PROJECTS',
                    style: pw.TextStyle(
                        color: const PdfColor.fromInt(0xff181818),
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 20),
                  ),
                  pw.SizedBox(height: 6),
                  // todo
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Stack(
                        children: [
                          pw.Container(
                            height: 80,
                            width: 4.5,
                            margin: const pw.EdgeInsets.only(left: 2.5, top: 8),
                            alignment: pw.Alignment.topCenter,
                            decoration: const pw.BoxDecoration(
                              color: PdfColor.fromInt(0xff05357D),
                            ),
                          ),
                          pw.Align(
                            alignment: pw.Alignment.topLeft,
                            child: pw.Container(
                              height: 10,
                              width: 10,
                              margin: const pw.EdgeInsets.only(top: 8),
                              decoration: const pw.BoxDecoration(
                                shape: pw.BoxShape.circle,
                                color: PdfColor.fromInt(0xff05357D),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...List.generate(
                        projectCtrlList.length,
                        (index) => pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              '  ${projectCtrlList[index]['titleCtrl'].text}',
                              style: pw.TextStyle(
                                  color: const PdfColor.fromInt(0xff05357D),
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16),
                            ),
                            pw.SizedBox(height: 1.2),
                            pw.Text(
                              '  ${projectCtrlList[index]['cmpNameCtrl'].text}',
                              style: const pw.TextStyle(
                                  color: PdfColor.fromInt(0xff181818),
                                  fontSize: 16),
                            ),
                            pw.Text(
                              '  ${projectCtrlList[index]['roleCtrl'].text}',
                              style: const pw.TextStyle(
                                  color: PdfColor.fromInt(0xff181818),
                                  fontSize: 16),
                            ),
                            pw.SizedBox(height: 1.2),
                            pw.Text(
                              '  ${projectCtrlList[index]['startDateCtrl'].text} - ${projectCtrlList[index]['endDateCtrl'].text}',
                              style: const pw.TextStyle(
                                  color: PdfColor.fromInt(0xff181818),
                                  fontSize: 16),
                            ),
                            pw.SizedBox(height: 1.2),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 1.2),
                  pw.Divider(
                    thickness: 2.5,
                    color: const PdfColor.fromInt(0xff05357D),
                  ),
                  pw.SizedBox(height: 1.2),
                  pw.Text(
                    'REFERENCE',
                    style: pw.TextStyle(
                        color: const PdfColor.fromInt(0xff181818),
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 20),
                  ),
                  pw.SizedBox(height: 6),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      rfrCtrlList.length,
                      (index) => pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            '  ${rfrCtrlList[index]['rfrNameCtrl'].text}',
                            style: pw.TextStyle(
                                color: const PdfColor.fromInt(0xff05357D),
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 15.4),
                          ),
                          pw.SizedBox(height: 1.2),
                          pw.Text(
                            '  ${rfrCtrlList[index]['rfrJobCtrl'].text}',
                            style: const pw.TextStyle(
                                color: PdfColor.fromInt(0xff181818),
                                fontSize: 15.4),
                          ),
                          pw.Text(
                            '  ${rfrCtrlList[index]['compNameCtrl'].text}',
                            style: const pw.TextStyle(
                                color: PdfColor.fromInt(0xff181818),
                                fontSize: 15.4),
                          ),
                          pw.SizedBox(height: 1.2),
                          pw.Text(
                            '  ${rfrCtrlList[index]['rfrPhoneCtrl'].text}',
                            style: const pw.TextStyle(
                                color: PdfColor.fromInt(0xff181818),
                                fontSize: 15.4),
                          ),
                          pw.SizedBox(height: 1.2),
                          pw.Text(
                            '  ${rfrCtrlList[index]['rfrEmailCtrl'].text}',
                            style: const pw.TextStyle(
                                color: PdfColor.fromInt(0xff181818),
                                fontSize: 15.4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
  return pdf.save();
}

//black color: const PdfColor.fromInt(0xff181818),
//blue color: const PdfColor.fromInt(0xff05357D),
