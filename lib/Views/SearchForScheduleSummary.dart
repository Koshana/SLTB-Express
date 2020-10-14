import 'package:flutter/material.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Views/Booking.dart';
import 'package:sltb/Views/Footer.dart';
import 'package:sltb/Views/Header.dart';

class SearchForScheduleSummary extends StatefulWidget {
  SearchForScheduleSummary({Key key}) : super(key: key);

  @override
  _SearchForScheduleSummaryState createState() =>
      _SearchForScheduleSummaryState();
}

class _SearchForScheduleSummaryState extends State<SearchForScheduleSummary> {
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
                            left: CommonModel.displayWidth * 0.04,
                            right: CommonModel.displayWidth * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Table(
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 15.0, bottom: 10.0),
                                    child: Text('Departure'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: TextFormField(
                                        readOnly: true,
                                        initialValue:
                                            CommonModel.scheduleModel.location1,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 20),
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)))),
                                  )
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 15.0, bottom: 10.0),
                                    child: Text('Arrival'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: TextFormField(
                                        readOnly: true,
                                        initialValue:
                                            CommonModel.scheduleModel.location2,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 20),
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)))),
                                  )
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 15.0, bottom: 10.0),
                                    child: Text('Date'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: TextFormField(
                                        readOnly: true,
                                        initialValue:
                                            CommonModel.scheduleModel.date,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 20),
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)))),
                                  )
                                ]),
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            SingleChildScrollView(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  getBookCard(),
                                ],
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

  Widget getBookCard() {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/images/background.png',
                  width: MediaQuery.of(context).size.width,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Colombo'),
                          Text('07/03/2020'),
                          Text('08:30 AM'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Colombo'),
                          Text('07/03/2020'),
                          Text('08:30 AM'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('AC Luxary Corch'),
                          Text('Rs. 700/='),
                        ],
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        onPressed: () {
                          CommonModel.selectedSeats.clear();

                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Booking()));
                        },
                        child: Text(
                          'Book',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
