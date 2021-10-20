// main.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jupygenix/utils/colors.dart';
import 'package:jupygenix/utils/font.dart';
import 'package:jupygenix/utils/sizes.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FilePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<FilePage> {
  // This will be displayed on the screen
  String _content = 'null';

  // Find the Documents path
  Future<String> _getDirPath() async {
    final _dir = await getApplicationDocumentsDirectory();
    return _dir.path;
  }

  // This function is triggered when the "Read" button is pressed
  Future<void> _readData() async {
    final _dirPath = await _getDirPath();
    final _myFile = File('$_dirPath/data.txt');
    final _data = await _myFile.readAsString(encoding: utf8);
    setState(() {
      _content = _data;
    });
  }

  // TextField controller
  final _textController = TextEditingController();
  // This function is triggered when the "Write" buttion is pressed
  Future<void> _writeData() async {
    final _dirPath = await _getDirPath();

    final _myFile = File('$_dirPath/data.txt');
    // If data.txt doesn't exist, it will be created automatically

    await _myFile.writeAsString(_textController.text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('File'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(''),
            yMargin(30),
            Text(
              'ENTER YOUR QUESTION',
              style: fontWithSpacing(black, 16, boldFont, 2),
            ),
            yMargin(30),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: lightGrey.withOpacity(0.5),
                filled: true,
              ),
            ),
            yMargin(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.078,
                  width: size.width * 0.7,
                  child: ElevatedButton(
                      onPressed: _writeData,
                      child: Text(
                        'Save to file',
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
            ),
            yMargin(30),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                child: SizedBox(
                  height: 70,
                ),
              ),
              Text(
                  _content != 'null'
                      ? _content
                      : 'Press the button to load your name',
                  style: TextStyle(fontSize: 22, color: Colors.pink)),
            ]),
            yMargin(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.078,
                  width: size.width * 0.7,
                  child: ElevatedButton(
                      onPressed: _readData,
                      child: Text(
                        'Read from the file',
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
            ),
          ],
        ),
      ),
    );
  }
}
