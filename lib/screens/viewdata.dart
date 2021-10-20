import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jupygenix/screens/intro_screen.dart';
import 'package:jupygenix/screens/view_add.dart';
import 'package:jupygenix/utils/colors.dart';
import 'package:jupygenix/utils/desc.dart';
import 'package:jupygenix/utils/font.dart';
import 'package:jupygenix/screens/view_data.dart';
import 'package:jupygenix/screens/add_data.dart';
import 'package:jupygenix/utils/sizes.dart';
import 'package:jupygenix/widget/dialog_flow.dart';
import 'package:jupygenix/widget/map.dart';
import 'package:provider/single_child_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jupygenix/utils/colors.dart';
import 'package:jupygenix/utils/font.dart';
import 'package:jupygenix/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ViewData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questions Page',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyquesPage(),
    );
  }
}

class MyquesPage extends StatefulWidget {
  MyquesPage({Key key = const Key("any_key")}) : super(key: key);

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyquesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Interviews Questions"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              yMargin(10),
              StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.active) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          DocumentSnapshot? document =
                              snapshot.data?.docs[index];

                          Map<String, dynamic> data =
                              document?.data() as Map<String, dynamic>;

                          return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          '${index + 1}.',
                                          style: font(fBlack, 20, boldFont),
                                        ),
                                      ),
                                      xMargin(15),
                                      Text(
                                        data['ques'].toString(),
                                        style: font(fBlack, 20, boldFont),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                  yMargin(10),
                                  Container(
                                    margin: EdgeInsets.only(left: 30),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      data['ans'].toString(),
                                      textAlign: TextAlign.start,
                                      style: font(fBlack, 19, null),
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                    ),
                                  )
                                ],
                              ));
                        },
                        itemCount: snapshot.data!.docs.length,
                      );
                    }
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ])),
      ),
    );
  }
}
