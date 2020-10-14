import 'package:flutter/material.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Views/Footer.dart';
import 'package:sltb/Views/Header.dart';
import 'package:sltb/Views/Login.dart';
import 'package:sltb/Views/SearchForSchedule.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Welcome to SLTB Express',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.08,
                            ),
                            Text(
                              'Our Services',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 17.0),
                            ),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.01,
                            ),
                            Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.arrow_forward),
                                  title: Text('Search Buses'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.arrow_forward),
                                  title: Text('Book Seats'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.arrow_forward),
                                  title: Text('Search Time Tables'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.arrow_forward),
                                  title: Text('Search Route Details'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.01,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Login()));
                                },
                                color: Colors.green,
                                child: Text(
                                  "Get Start",
                                  style: TextStyle(color: Colors.white),
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
