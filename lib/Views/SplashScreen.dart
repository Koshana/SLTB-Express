import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Views/Home.dart';
import 'package:sltb/Views/Login.dart';
import 'package:sltb/Views/WelcomeScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    CommonModel.displayHeight = MediaQuery.of(context).size.height;
    CommonModel.displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: CommonModel.displayWidth * 0.5,
                height: CommonModel.displayWidth * 0.5,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Text(
                  'Welcome to SLTB Express',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
