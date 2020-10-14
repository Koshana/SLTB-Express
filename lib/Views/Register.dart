import 'package:flutter/material.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Models/UserModel.dart';
import 'package:sltb/Views/Footer.dart';
import 'package:sltb/Views/Header.dart';
import 'package:sltb/Views/Login.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool checkValue = false;

  final regKey = new GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                  Form(
                      key: regKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: CommonModel.displayWidth * 0.08,
                                right: CommonModel.displayWidth * 0.08),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: CommonModel.displayHeight * 0.01,
                                ),
                                Text('Name',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold)),
                                TextFormField(
                                  controller: nameController,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Empty Field';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: CommonModel.displayHeight * 0.02,
                                ),
                                Text('Passport / NIC No',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold)),
                                TextFormField(
                                  controller: nicController,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Empty Field';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: CommonModel.displayHeight * 0.02,
                                ),
                                Text('Mobile Phone No',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold)),
                                TextFormField(
                                  controller: mobileController,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Empty Field';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: CommonModel.displayHeight * 0.02,
                                ),
                                Text('Password',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold)),
                                TextFormField(
                                  obscureText: true,
                                  controller: passwordController,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Empty Field';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: CommonModel.displayHeight * 0.02,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 24.0,
                                      width: 24.0,
                                      child: Checkbox(
                                          value: checkValue,
                                          onChanged: (val) {
                                            setState(() {
                                              checkValue = val;
                                            });
                                          }),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                          'I agree to all the terms & conditions',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: CommonModel.displayHeight * 0.02,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: RaisedButton(
                                    onPressed: () {
                                      if (regKey.currentState.validate() &&
                                          checkValue == true) {
                                        CommonModel.userModel = UserModel(
                                          name: nameController.text,
                                          nic: nicController.text,
                                          mobile: mobileController.text,
                                          password: passwordController.text,
                                        );

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => Login()));
                                      }
                                    },
                                    color: Colors.green,
                                    child: Text(
                                      "Sign Up with SLTB",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ))
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
