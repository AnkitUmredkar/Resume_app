import 'package:flutter/material.dart';
import 'package:resume_app/utils/global.dart';

TextEditingController objectiveCtrl = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey();

class ObjectiveInfo extends StatefulWidget {
  const ObjectiveInfo({super.key});

  @override
  State<ObjectiveInfo> createState() => _ObjectiveInfoState();
}

class _ObjectiveInfoState extends State<ObjectiveInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              objectiveCtrl.clear();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          toolbarHeight: 70,
          backgroundColor: blueColor,
          title: const Text(
            'Objective Details',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.9),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (objectiveCtrl.text != '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            'Data Save Successfully',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                    }
                  });
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.check,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Container(
              width: width,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      offset: Offset(0, 8))
                ],
                borderRadius: BorderRadius.circular(34),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: const BoxDecoration(
                      color: Color(0xff114471),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(34),
                        topLeft: Radius.circular(34),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Objective',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
                    child: TextField(
                      controller: objectiveCtrl,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(22)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
