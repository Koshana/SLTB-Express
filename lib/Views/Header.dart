import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Views/Home.dart';

class Header {
  static Widget getHeader(context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Home()));
                },
                child: Image.asset(
                  'assets/images/logow.png',
                  height: CommonModel.displayWidth * 0.15,
                ),
              ),
              Text(
                'SLTB Express',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
