import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Models/SeatModel.dart';
import 'package:sltb/Views/Footer.dart';
import 'package:sltb/Views/Header.dart';

class Checkout extends StatefulWidget {
  Checkout({Key key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final checkOutKey = new GlobalKey<FormState>();

  TextEditingController cardName = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardCvc = TextEditingController();
  TextEditingController cardExpDate = TextEditingController();

  double amount = 0.0;
  String date = '';

  DateTime selectedDate;

  @override
  void initState() {
    super.initState();

    for (SeatModel seatModel in CommonModel.selectedSeats) {
      amount += seatModel.price;
    }

    setState(() {
      date = DateFormat('yyyy-MM-dd').format(DateFormat('yyyy-MM-dd')
          .parse(CommonModel.scheduleModel.date)
          .add(Duration(days: 1)));
    });
  }

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
                      Form(
                        key: checkOutKey,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: CommonModel.displayWidth * 0.08,
                              right: CommonModel.displayWidth * 0.08),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: Colors.black)),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text('Payment Details'),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Amount'),
                                              SizedBox(height: 10.0),
                                              Text('Pay Before'),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(':'),
                                              SizedBox(height: 10.0),
                                              Text(':'),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Rs. ' +
                                                    amount.toStringAsFixed(2),
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 10.0),
                                              Text(date,
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border:
                                              Border.all(color: Colors.black)),
                                      padding: EdgeInsets.all(5.0),
                                      child: Image.asset(
                                          'assets/images/payment.png'),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: Colors.black)),
                                padding: EdgeInsets.all(20.0),
                                child: Container(
                                  height: CommonModel.displayHeight * 0.495,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Container(
                                            child: Image.asset(
                                              'assets/images/payment1.png',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text('Card Name'),
                                        SizedBox(
                                          height:
                                              CommonModel.displayHeight * 0.008,
                                        ),
                                        TextFormField(
                                            controller: cardName,
                                            maxLength: 20,
                                            validator: (val) {
                                              if (val.isEmpty) {
                                                return 'Please Enter Card name';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        10, 0, 0, 20),
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)))),
                                        Text('Card Number'),
                                        SizedBox(
                                          height:
                                              CommonModel.displayHeight * 0.008,
                                        ),
                                        TextFormField(
                                            controller: cardNumber,
                                            validator: (val) {
                                              if (val.isEmpty) {
                                                return 'Please Enter Card Number';
                                              }
                                              return null;
                                            },
                                            maxLength: 16,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        10, 0, 0, 20),
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)))),
                                        SizedBox(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('CVC'),
                                                SizedBox(
                                                  height: CommonModel
                                                          .displayHeight *
                                                      0.008,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  child: TextFormField(
                                                      validator: (val) {
                                                        if (val.isEmpty) {
                                                          return 'Please Enter CVC';
                                                        }
                                                        return null;
                                                      },
                                                      controller: cardCvc,
                                                      maxLength: 3,
                                                      decoration: InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(10,
                                                                      0, 0, 20),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)))),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text('Expiry Date'),
                                                SizedBox(
                                                  height: CommonModel
                                                          .displayHeight *
                                                      0.008,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  child: DateTimeFormField(
                                                      dateFormat: DateFormat(
                                                          'MM/yyyy'),
                                                      mode: DateFieldPickerMode
                                                          .date,
                                                      initialValue:
                                                          DateTime.now(),
                                                      onDateSelected: (date) {
                                                        selectedDate = date;
                                                      },
                                                      decoration: InputDecoration(
                                                          prefixIcon: Icon(
                                                              FontAwesome
                                                                  .calendar),
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(10,
                                                                      0, 0, 20),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)))),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        Center(
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            height: 45.0,
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  side: BorderSide(
                                                      color: Colors.green)),
                                              onPressed: () {
                                                if (checkOutKey.currentState
                                                    .validate()) {
                                                  Alert(
                                                    context: context,
                                                    type: AlertType.warning,
                                                    title: "Success",
                                                    desc: "Successfully Paid.",
                                                    buttons: [
                                                      DialogButton(
                                                        child: Text(
                                                          "OK",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        width: 120,
                                                      )
                                                    ],
                                                  ).show();
                                                }
                                              },
                                              color: Colors.green,
                                              child: Text(
                                                "Pay",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
