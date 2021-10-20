import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jupygenix/screens/intro_screen.dart';
import 'package:jupygenix/screens/view_add.dart';
import 'package:jupygenix/utils/colors.dart';
import 'package:jupygenix/utils/font.dart';
import 'package:jupygenix/screens/viewdata.dart';
import 'package:jupygenix/screens/add_data.dart';
import 'package:jupygenix/utils/sizes.dart';
import 'package:jupygenix/widget/calc.dart';
import 'package:jupygenix/widget/dialog_flow.dart';
import 'package:jupygenix/widget/file.dart';
import 'package:jupygenix/widget/map.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Page',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyMainPage(),
    );
  }
}

class MyMainPage extends StatefulWidget {
  MyMainPage({Key key = const Key("any_key")}) : super(key: key);

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Interview Questions', style: font(fBlack, 21, FontWeight.bold)),
          yMargin(50),
          Container(
            height: size.height * 0.078,
            width: size.width * 0.7,
            child: ElevatedButton(
                onPressed: () => Get.to(() => ViewData()),
                child: Text(
                  'View Questions',
                  style: font(fWhite, 20, boldFont),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(deepPink),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )))),
          ),
          yMargin(50),
          Container(
            height: size.height * 0.078,
            width: size.width * 0.7,
            child: ElevatedButton(
                onPressed: () => Get.to(() => AddData()),
                child: Text(
                  'Add Questions',
                  style: font(fWhite, 20, boldFont),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(deepPink),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )))),
          ),
          yMargin(50),
          Container(
            height: size.height * 0.078,
            width: size.width * 0.7,
            child: ElevatedButton(
                onPressed: () => Get.to(() => SimpleCalculator()),
                child: Text(
                  'Calculator',
                  style: font(fWhite, 20, boldFont),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(deepPink),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )))),
          ),
          yMargin(50),
          Container(
            height: size.height * 0.078,
            width: size.width * 0.7,
            child: ElevatedButton(
                onPressed: () => Get.to(() => FilePage()),
                child: Text(
                  'File',
                  style: font(fWhite, 20, boldFont),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(deepPink),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )))),
          ),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePageDialogflow()));
              },
              tooltip: 'Increment',
              child: Icon(Icons.account_circle_rounded),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapsPage()));
              },
              tooltip: 'Increment',
              child: Icon(Icons.near_me),
            ),
          ],
        ),
      ),
    );
  }
}
