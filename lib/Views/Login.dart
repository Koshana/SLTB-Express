import 'package:flutter/material.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Views/Footer.dart';
import 'package:sltb/Views/Header.dart';
import 'package:sltb/Views/Home.dart';
import 'package:sltb/Views/Register.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginKey = new GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool credentialsCheck = true;

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
                      key: loginKey,
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
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    child: Text(
                                      'Create Account',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Register()));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: CommonModel.displayHeight * 0.04,
                                ),
                                Text('NIC'),
                                TextFormField(
                                  controller: usernameController,
                                  onChanged: (val) {
                                    credentialsCheck = true;
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Fill NIC';
                                    } else if (credentialsCheck == false) {
                                      return 'Invalid NIC';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: CommonModel.displayHeight * 0.04,
                                ),
                                Text('Password'),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  onChanged: (val) {
                                    credentialsCheck = true;
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Fill Password';
                                    } else if (credentialsCheck == false) {
                                      return 'Invalid Password';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: CommonModel.displayHeight * 0.04,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text('Forget Password'),
                                ),
                                SizedBox(
                                  height: CommonModel.displayHeight * 0.03,
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    if (loginKey.currentState.validate()) {
                                      if (usernameController.text ==
                                              CommonModel.userModel.nic &&
                                          passwordController.text ==
                                              CommonModel.userModel.password) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => Home()));
                                      } else {
                                        setState(() {
                                          credentialsCheck = false;
                                        });
                                      }
                                    }
                                  },
                                  color: Colors.green,
                                  child: Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
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
