import 'package:flutter/material.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Views/TermsAndConditions.dart';

class Footer {
  static Widget getFooter(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          children: [
            Container(
              width: CommonModel.displayWidth,
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/images/assistant.png',
                    width: CommonModel.displayWidth * 0.13,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sri Lanka Transport Board',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '24 x 7 Customer Hotline : 0772872877',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Customer Support Email : sltb@express.lk',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => TermsAndConditions()));
                        },
                        child: Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  static Widget getChatFooter(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.add),
                  ),
                  Expanded(
                      child: TextFormField(
                          initialValue: null,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 20),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))))),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.insert_emoticon),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.send),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: CommonModel.displayWidth,
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/images/assistant.png',
                    width: CommonModel.displayWidth * 0.13,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sri Lanka Transport Board',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '24 x 7 Customer Hotline : 0772872877',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Customer Support Email : sltb@express.lk',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
