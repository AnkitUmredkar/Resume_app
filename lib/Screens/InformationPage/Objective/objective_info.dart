import 'package:flutter/material.dart';
import 'package:resume_app/utils/global.dart';

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
          appBar: buildAppBar(context,'Objective Details'),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Container(
              height: 230,
              width: width,
              decoration: BoxDecoration(
                boxShadow: [
                  // BoxShadow(
                  //     color: Colors.grey,
                  //     blurRadius: 10,
                  //     offset: Offset(-7,7)
                  // ),
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(7,7)
                  )
                ],
                borderRadius: BorderRadius.circular(34),
                color: Colors.red
              ),
            ),
          ),
        ),
    );
  }
}
