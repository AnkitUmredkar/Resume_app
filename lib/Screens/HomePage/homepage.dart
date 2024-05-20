import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_app/utils/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: blueColor,
          title: const Text(
            'Resume Builder',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'roboto',
                letterSpacing: 0.9),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 22, 15, 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Information');
                  },
                  child: buildContainer(
                      width,
                      'Create New Resume',
                      'Create a professional and modern\n         new CV in few minutes.',
                      'Create',
                      'assets/image/img_1.png',
                      1),
                ),
                const SizedBox(height: 20),
                buildContainer(
                    width,
                    'View Resume',
                    'Many HR approved templates, you\n can change color theme and text\nsizing according to your job need',
                    'View',
                    'assets/image/img_2.png',
                    2),
                const SizedBox(height: 20),
                buildContainer(
                    width,
                    'Edit Your Resume',
                    'Edit your saved CVs information\n     by using easy CV builder',
                    'Edit',
                    'assets/image/img_3.png',
                    3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainer(double width, String heading, String details,
      String buttonName, String src, int check) {
    return Container(
      height: 180,
      width: width,
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(
            src,
            height: 90,
          ),
          SizedBox(
            width: width * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                heading,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.049),
              ),
              Text(
                details,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: width * 0.0345),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/Information');
                },
                child: Text(
                  buttonName,
                  style:
                      TextStyle(color: blueColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
