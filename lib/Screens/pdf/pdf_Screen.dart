import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
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

Future<Uint8List> generatePdf() {
  final pdf = pw.Document();
  final image = pw.MemoryImage(fileImage!.readAsBytesSync());
  pdf.addPage(pw.Page(
    margin: pw.EdgeInsets.zero,
    build: (context) => pw.Stack(
      children: [
        pw.Container(
          margin: pw.EdgeInsets.zero,
          height: 841.8,
          width: 220,
          decoration: const pw.BoxDecoration(
            color: PdfColor.fromInt(0xff181818),
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.topRight,
          child: pw.Container(
            height: 135,
            width: 460,
            padding: const pw.EdgeInsets.fromLTRB(70, 4, 0, 4),
            margin: const pw.EdgeInsets.only(top: 56),
            decoration: const pw.BoxDecoration(
              color: PdfColor.fromInt(0xff05357D),),
          child: pw.Text(nameCtrl.text,style: pw.TextStyle(color: PdfColors.white,fontWeight: pw.FontWeight.bold,fontSize: 35),),
          ),
        ),
        pw.Container(
          height: 180,
          width: 180,
          margin: const pw.EdgeInsets.only(top: 32,left: 20),
          decoration: pw.BoxDecoration(
            shape: pw.BoxShape.circle,
            border: pw.Border.all(
              color: const PdfColor.fromInt(0xff05357D),
              width: 4,
            ),
            color: const PdfColor.fromInt(0xff05357D),
            image: (fileImage! != null)
                ? pw.DecorationImage(
              fit: pw.BoxFit.cover,
              image: image,
            )
                : null,
          ),
        ),

      ],
    ),
  ));

  return pdf.save();
}