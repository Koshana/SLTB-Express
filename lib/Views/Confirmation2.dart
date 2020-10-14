import 'package:flutter/material.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Models/SeatModel.dart';
import 'package:sltb/Views/CheckOut.dart';
import 'package:sltb/Views/Footer.dart';
import 'package:sltb/Views/Header.dart';

class Confirmation2 extends StatefulWidget {
  Confirmation2({Key key}) : super(key: key);

  @override
  _Confirmation2State createState() => _Confirmation2State();
}

class _Confirmation2State extends State<Confirmation2> {
  double amount = 0.0;

  @override
  void initState() {
    super.initState();

    for (SeatModel seatModel in CommonModel.selectedSeats) {
      amount += seatModel.price;
    }

    setState(() {});
  }

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
                              height: CommonModel.displayHeight * 0.02,
                            ),
                            Text('Amount'),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.008,
                            ),
                            TextFormField(
                                initialValue: amount.toStringAsFixed(2),
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Checkout()));
                                  },
                                  color: Colors.blue,
                                  child: Text(
                                    "Checkout",
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
