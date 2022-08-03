// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';

class ResultPage extends StatefulWidget {
  int marks;
  ResultPage({Key? key, required this.marks}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState(marks);
}

class _ResultPageState extends State<ResultPage> {
  List<String> images = [
    "images/excellent.jpg",
    "images/good.jpg",
    "images/poor.jpg"
  ];
  late String message;
  late String image;
  @override
  void initState() {
    if (marks < 20) {
      image = images[2];
      message = "You should try hard..\n" + "You scored $marks";
    } else if (marks < 35) {
      image = images[1];
      message = "You can do better..\n" + "You scored $marks";
    } else {
      image = images[0];
      message = "You did very well..\n" + "You scored $marks";
    }
    super.initState();
  }

  int marks;
  _ResultPageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Material(
              elevation: 10.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(image: AssetImage(image)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 15.0),
                      child: Center(
                        child: Text(
                          message,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
