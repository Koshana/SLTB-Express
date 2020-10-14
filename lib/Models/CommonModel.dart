import 'package:flutter/material.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';
import 'package:sltb/Models/ScheduleModel.dart';
import 'package:sltb/Models/SeatModel.dart';
import 'package:sltb/Models/UserModel.dart';
import 'package:sltb/Views/Chat.dart';
import 'package:sltb/Views/Feedback.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonModel {
  static double displayWidth;
  static double displayHeight;
  static UserModel userModel;
  static ScheduleModel scheduleModel;
  static List<SeatModel> selectedSeats = [];

  List getList(context) {
    var _fabMiniMenuItemList = [
      new FabMiniMenuItem.withText(
          new Icon(Icons.call), Colors.blue, 4.0, "Button menu", () async {
        await launch("tel://<+94779778269>");
      }, "Call", Colors.blue, Colors.white, true),
      new FabMiniMenuItem.withText(
          new Icon(Icons.chat_bubble), Colors.blue, 4.0, "Button menu",
          () async {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Chat()));
      }, "Chat", Colors.blue, Colors.white, true),
      new FabMiniMenuItem.withText(
          new Icon(Icons.feedback), Colors.blue, 4.0, "Button menu", () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => FeedbackView()));
      }, "Feedback", Colors.blue, Colors.white, true),
    ];

    return _fabMiniMenuItemList;
  }

  Widget getMenu(context) {
    return Container(
      margin: EdgeInsets.only(bottom: 80.0),
      child: new FabDialer(
        getList(context),
        Colors.black,
        new Icon(Icons.help),
      ),
    );
  }
}
