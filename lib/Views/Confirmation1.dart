import 'package:flutter/material.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Views/Confirmation2.dart';
import 'package:sltb/Views/Footer.dart';
import 'package:sltb/Views/Header.dart';
import 'package:sltb/Views/SearchForSchedule.dart';

class Confirmation1 extends StatefulWidget {
  Confirmation1({Key key}) : super(key: key);

  @override
  _Confirmation1State createState() => _Confirmation1State();
}

class _Confirmation1State extends State<Confirmation1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: CommonModel().getMenu(context),
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
                            Text('Number Of Seats'),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.008,
                            ),
                            TextFormField(
                                initialValue:
                                    CommonModel.selectedSeats.length.toString(),
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
                            Text('Name of Booking Person'),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.008,
                            ),
                            TextFormField(
                                initialValue: CommonModel.userModel.name,
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
                            Text('NIC'),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.008,
                            ),
                            TextFormField(
                                initialValue: CommonModel.userModel.nic,
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
                            Text('From'),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.008,
                            ),
                            TextFormField(
                                initialValue:
                                    CommonModel.scheduleModel.location1,
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
                            Text('To'),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.008,
                            ),
                            TextFormField(
                                initialValue:
                                    CommonModel.scheduleModel.location2,
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
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.blue)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Confirmation2()));
                                  },
                                  color: Colors.blue,
                                  child: Text(
                                    "Continue",
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
