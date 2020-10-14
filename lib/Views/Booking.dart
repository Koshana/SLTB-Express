import 'package:flutter/material.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Models/SeatModel.dart';
import 'package:sltb/Views/Confirmation1.dart';
import 'package:sltb/Views/Footer.dart';
import 'package:sltb/Views/Header.dart';
import 'package:sltb/Views/SearchForSchedule.dart';

class Booking extends StatefulWidget {
  Booking({Key key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  List<SeatModel> leftModels = [];
  List<SeatModel> rightModels = [];
  List<SeatModel> bottomModels = [];

  @override
  Widget build(BuildContext context) {
    initializeSeatModels();

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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [getLeft(), getRight()],
                            ),
                            getBottom(),
                            Divider(
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getInforCard('Reversed', Colors.red),
                                getInforCard('My Seat', Colors.green),
                                getInforCard('Available', Colors.white)
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
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
                                            builder: (_) => Confirmation1()));
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

  Widget getSqare(list, index) {
    SeatModel seatModel = list[index];

    return GestureDetector(
      onTap: () {
        setState(() {
          if (list[index].check != false) {
            if (list[index].check == true) {
              list[index].check = null;
            } else if (list[index].check == null) {
              list[index].check = true;

              CommonModel.selectedSeats.add(list[index]);
            }
          }
        });
      },
      child: Container(
        width: 40.0,
        decoration: BoxDecoration(
            color: (seatModel.check != null)
                ? ((seatModel.check == true) ? Colors.green : Colors.red)
                : Colors.white,
            border: Border.all(color: Colors.black)),
        padding: EdgeInsets.all(7.0),
        margin: EdgeInsets.all(4.0),
        child: Center(
          child: Text(seatModel.id.toString()),
        ),
      ),
    );
  }

  void initializeSeatModels() {
    for (var rows = 0; rows < 16; rows++) {
      leftModels.add(SeatModel(
        id: (rows + 1),
        check: null,
        price: 25.0,
      ));
    }
    for (var rows = 16; rows < 34; rows++) {
      rightModels.add(SeatModel(
        id: (rows + 1),
        check: null,
        price: 25.0,
      ));
    }
    for (var rows = 34; rows < 40; rows++) {
      bottomModels.add(SeatModel(
        id: (rows + 1),
        check: null,
        price: 25.0,
      ));
    }
  }

  Widget getLeft() {
    return Column(
      children: [
        Row(
          children: [
            getSqare(leftModels, 0),
            getSqare(leftModels, 1),
          ],
        ),
        Row(
          children: [
            getSqare(leftModels, 2),
            getSqare(leftModels, 3),
          ],
        ),
        Row(
          children: [
            getSqare(leftModels, 4),
            getSqare(leftModels, 5),
          ],
        ),
        Row(
          children: [
            getSqare(leftModels, 6),
            getSqare(leftModels, 7),
          ],
        ),
        Row(
          children: [
            getSqare(leftModels, 8),
            getSqare(leftModels, 9),
          ],
        ),
        Row(
          children: [
            getSqare(leftModels, 10),
            getSqare(leftModels, 11),
          ],
        ),
        Row(
          children: [
            getSqare(leftModels, 12),
            getSqare(leftModels, 13),
          ],
        ),
        Row(
          children: [
            getSqare(leftModels, 14),
            getSqare(leftModels, 15),
          ],
        ),
      ],
    );
  }

  Widget getRight() {
    return Column(
      children: [
        Row(
          children: [
            getSqare(rightModels, 0),
            getSqare(rightModels, 1),
          ],
        ),
        Row(
          children: [
            getSqare(rightModels, 2),
            getSqare(rightModels, 3),
          ],
        ),
        Row(
          children: [
            getSqare(rightModels, 4),
            getSqare(rightModels, 5),
          ],
        ),
        Row(
          children: [
            getSqare(rightModels, 6),
            getSqare(rightModels, 7),
          ],
        ),
        Row(
          children: [
            getSqare(rightModels, 8),
            getSqare(rightModels, 9),
          ],
        ),
        Row(
          children: [
            getSqare(rightModels, 10),
            getSqare(rightModels, 11),
          ],
        ),
        Row(
          children: [
            getSqare(rightModels, 12),
            getSqare(rightModels, 13),
          ],
        ),
        Row(
          children: [
            getSqare(rightModels, 14),
            getSqare(rightModels, 15),
          ],
        ),
        Row(
          children: [
            getSqare(rightModels, 16),
            getSqare(rightModels, 17),
          ],
        ),
      ],
    );
  }

  Widget getBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getSqare(bottomModels, 0),
        getSqare(bottomModels, 1),
        getSqare(bottomModels, 2),
        getSqare(bottomModels, 3),
        getSqare(bottomModels, 4),
        getSqare(bottomModels, 5),
      ],
    );
  }

  getInforCard(String s, Color color) {
    return Column(
      children: [
        Container(
          width: 60.0,
          decoration: BoxDecoration(
              color: color, border: Border.all(color: Colors.black)),
          padding: EdgeInsets.all(10.0),
        ),
        Text(s)
      ],
    );
  }
}
