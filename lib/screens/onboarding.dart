import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jupygenix/screens/intro.dart';
import 'package:jupygenix/screens/intro_screen.dart';
import 'package:jupygenix/screens/view_add.dart';
import 'package:jupygenix/utils/colors.dart';
import 'package:jupygenix/utils/desc.dart';
import 'package:jupygenix/utils/font.dart';
import 'package:jupygenix/utils/sizes.dart';
import 'package:jupygenix/widget/dialog_flow.dart';
import 'package:jupygenix/widget/map.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intro Page',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key = const Key("any_key")}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Intro Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'App Created By:',
              style: font(fBlack, 20, FontWeight.normal),
            ),
            Text(
              '',
            ),
            Text(
              'Shirin Vohra and Sanurhanaan Shaikh',
              style: font(fBlack, 22, FontWeight.bold),
            ),
            Text(
              '',
            ),
            Text(
              '3118063 and 3118053',
              style: font(fBlack, 20, FontWeight.normal),
            ),
            Text(
              '',
            ),
            yMargin(size.height * 0.05),
            //SUBMIT FORM
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.078,
                  width: size.width * 0.7,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => Intro()),
                      child: Text(
                        'next',
                        style: font(fWhite, 20, boldFont),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(deepPink),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )))),
                ),
              ],
            )
          ],
        ),
      ),
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
