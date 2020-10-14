import 'package:flutter/material.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Views/Footer.dart';
import 'package:sltb/Views/Header.dart';
import 'package:sltb/Views/Login.dart';
import 'package:sltb/Views/SearchForSchedule.dart';

class PopularBus extends StatefulWidget {
  PopularBus({Key key}) : super(key: key);

  @override
  _PopularBusState createState() => _PopularBusState();
}

class _PopularBusState extends State<PopularBus> {
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
                            left: CommonModel.displayWidth * 0.02,
                            right: CommonModel.displayWidth * 0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Popular Buses',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.03,
                            ),
                            Container(
                              height: CommonModel.displayHeight * 0.665,
                              child: ListView(
                                children: [
                                  getBookCard(),
                                  getBookCard(),
                                  getBookCard()
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
                      Text('Colombo'),
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
                      Text('Batticola'),
                    ],
                  ),
                ),
              ),
              Text('20% off until valid'),
              Text('01/10/2020'),
              Text('T & C Apply'),
              Divider(
                color: Colors.black,
              ),
              Align(
                alignment: Alignment.center,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => Booking()));
                  },
                  child: Text(
                    'Book',
                    style: TextStyle(color: Colors.white),
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
