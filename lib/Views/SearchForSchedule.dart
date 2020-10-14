import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Models/LocationModel.dart';
import 'package:sltb/Models/ScheduleModel.dart';
import 'package:sltb/Views/Footer.dart';
import 'package:sltb/Views/Header.dart';
import 'package:sltb/Views/SearchForScheduleSummary.dart';
import 'package:sltb/Views/Waiting.dart';

class SearchForSchedule extends StatefulWidget {
  SearchForSchedule({Key key}) : super(key: key);

  @override
  _SearchForScheduleState createState() => _SearchForScheduleState();
}

class _SearchForScheduleState extends State<SearchForSchedule> {
  List<LocationModel> locations1 = [
    LocationModel(id: 1, name: 'Colombo Fort'),
    LocationModel(id: 2, name: 'Maradana'),
    LocationModel(id: 3, name: 'Panchikawatha'),
    LocationModel(id: 4, name: 'Kotahena'),
    LocationModel(id: 5, name: 'Armour Street'),
    LocationModel(id: 6, name: 'Borella'),
    LocationModel(id: 7, name: 'Townhall'),
    LocationModel(id: 8, name: 'Rajagiriya'),
    LocationModel(id: 9, name: 'Townhall'),
    LocationModel(id: 10, name: 'Dehiwala'),
    LocationModel(id: 11, name: 'Kalubowila'),
    LocationModel(id: 12, name: 'Kohuwala'),
    LocationModel(id: 13, name: 'Nugegoda'),
    LocationModel(id: 14, name: 'Pita Kotte'),
    LocationModel(id: 15, name: 'Etul Kotte'),
    LocationModel(id: 16, name: 'Battaramulla'),
    LocationModel(id: 17, name: 'Kotikawatte'),
    LocationModel(id: 18, name: 'Wellampitiya'),
    LocationModel(id: 19, name: 'Angoda'),
    LocationModel(id: 20, name: 'Slave Island'),
    LocationModel(id: 21, name: 'Karagampitiya'),
    LocationModel(id: 22, name: 'Nedimala'),
    LocationModel(id: 23, name: 'Maharagama'),
    LocationModel(id: 24, name: 'Mirihana'),
    LocationModel(id: 25, name: 'Horana'),
    LocationModel(id: 26, name: 'Pannipitiya'),
    LocationModel(id: 27, name: 'Piliyandala'),
    LocationModel(id: 28, name: 'Malabe'),
    LocationModel(id: 29, name: 'Havlock Town')
  ];

  List<DropdownMenuItem<int>> departureDropDownList = [];

  List<DropdownMenuItem<int>> arrivalDropDownList = [];

  int departureDropdownVal = 1;
  int arrivalDropdownVal = 1;

  DateTime selectedDate;

  bool check = true;

  @override
  Widget build(BuildContext context) {
    initializeLocations();

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
                            Text('Departure'),
                            SizedBox(
                              height: 10.0,
                            ),
                            DropdownButtonFormField(
                              items: departureDropDownList,
                              value: departureDropdownVal,
                              onChanged: (val) {
                                setState(() {
                                  departureDropdownVal = val;
                                });
                              },
                              isDense: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(FontAwesome.map_marker),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 0, 0, 20),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.03,
                            ),
                            Text('Arrival'),
                            SizedBox(
                              height: 10.0,
                            ),
                            DropdownButtonFormField(
                              items: arrivalDropDownList,
                              value: arrivalDropdownVal,
                              onChanged: (val) {
                                setState(() {
                                  arrivalDropdownVal = val;
                                });
                              },
                              isDense: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(FontAwesome.map_marker),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 0, 0, 20),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.03,
                            ),
                            Text('Journey Date'),
                            SizedBox(
                              height: 10.0,
                            ),
                            DateTimeFormField(
                                initialValue: DateTime.now(),
                                onDateSelected: (date) {
                                  selectedDate = date;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(FontAwesome.calendar),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 20),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)))),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.06,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextFormField(
                                  initialValue: null,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 0, 0, 20),
                                      hintText: 'Enter Promo Code',
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)))),
                            ),
                            SizedBox(
                              height: CommonModel.displayHeight * 0.04,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                height: 50.0,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.blue)),
                                  onPressed: () {
                                    String loc1 = '';
                                    String loc2 = '';

                                    for (LocationModel locModel in locations1) {
                                      if (locModel.id == departureDropdownVal) {
                                        loc1 = locModel.name;
                                      }
                                      if (locModel.id == arrivalDropdownVal) {
                                        loc2 = locModel.name;
                                      }
                                    }

                                    CommonModel.scheduleModel = ScheduleModel(
                                        location1: loc1,
                                        location2: loc2,
                                        date: DateFormat('yyyy-MM-dd')
                                            .format(selectedDate));

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                SearchForScheduleSummary()));
                                  },
                                  color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          "Search",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Waiting()));
                                },
                                child: Text(
                                  'Reserve the waiting order',
                                  style: TextStyle(color: Colors.red),
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

  void initializeLocations() {
    if (check == true) {
      selectedDate = DateTime.now();

      for (LocationModel locModel in locations1) {
        departureDropDownList.add(new DropdownMenuItem(
          child: Text(locModel.name.toString()),
          value: locModel.id,
        ));

        arrivalDropDownList.add(new DropdownMenuItem(
          child: Text(locModel.name.toString()),
          value: locModel.id,
        ));
      }
      check = false;
    }
  }
}
