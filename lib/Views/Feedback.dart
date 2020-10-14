import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Models/FeedbackModel.dart';
import 'package:sltb/Views/Footer.dart';
import 'package:sltb/Views/Header.dart';
import 'package:sltb/Views/Login.dart';
import 'package:sltb/Views/SearchForSchedule.dart';

class FeedbackView extends StatefulWidget {
  FeedbackView({Key key}) : super(key: key);

  @override
  _FeedbackViewState createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  double rating = 1.0;

  List<Widget> ratings = [];

  TextEditingController feedbackText = TextEditingController();

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
                                'Feedback',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.03,
                            ),
                            Container(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(color: Colors.black)),
                                padding: EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Text('Share Your Experience'),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    RatingBar(
                                      initialRating: rating,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        this.rating = rating;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: TextFormField(
                                          controller: feedbackText,
                                          initialValue: null,
                                          minLines: 2,
                                          maxLines: 5,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10, 0, 0, 20),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0)))),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Center(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              side: BorderSide(
                                                  color: Colors.blue)),
                                          onPressed: () {
                                            setState(() {
                                              ratings.add(getRatingCard(
                                                  FeedbackModel(
                                                      rating: rating,
                                                      feedback:
                                                          feedbackText.text)));

                                              feedbackText.text = '';
                                            });
                                          },
                                          color: Colors.blue,
                                          child: Text(
                                            "Submit",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.03,
                            ),
                            Container(
                                height: CommonModel.displayHeight * 0.5,
                                child: ListView.builder(
                                    itemCount: ratings.length,
                                    itemBuilder:
                                        (BuildContext context, int Itemindex) {
                                      return ratings[Itemindex];
                                    })),
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

  Widget getRatingCard(FeedbackModel feedbackModel) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black)),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingBar(
            initialRating: feedbackModel.rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              this.rating = rating;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(feedbackModel.feedback),
          )
        ],
      ),
    );
  }
}
