import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Views/CheckOut.dart';
import 'package:sltb/Views/Footer.dart';
import 'package:sltb/Views/Header.dart';
import 'package:sltb/Views/SearchForSchedule.dart';

class Waiting extends StatefulWidget {
  Waiting({Key key}) : super(key: key);

  @override
  _WaitingState createState() => _WaitingState();
}

class _WaitingState extends State<Waiting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.14), BlendMode.dstATop),
            image: AssetImage("assets/images/background.png"),
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Header.getHeader(context),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: CommonModel.displayWidth * 0.08,
                            right: CommonModel.displayWidth * 0.08),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Waiting List',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.02,
                            ),
                            Text('Name'),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.008,
                            ),
                            TextFormField(
                                initialValue: null,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 20),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)))),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.02,
                            ),
                            Text('Email'),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.008,
                            ),
                            TextFormField(
                                initialValue: null,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 20),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)))),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.02,
                            ),
                            Text('Contact Number'),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.008,
                            ),
                            TextFormField(
                                initialValue: null,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 20),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)))),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.02,
                            ),
                            Text('Number Of Seats'),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.008,
                            ),
                            TextFormField(
                                keyboardType: TextInputType.number,
                                initialValue: null,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 20),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)))),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.04,
                            ),
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 50.0,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.blue)),
                                  onPressed: () {
                                    Alert(
                                      context: context,
                                      type: AlertType.warning,
                                      title: "Warning",
                                      desc:
                                          "You will be notified when seats become available.",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "OK",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          width: 120,
                                        )
                                      ],
                                    ).show();
                                  },
                                  color: Colors.blue,
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Footer.getFooter(context)
          ],
        ),
      ),
    ));
  }
}
