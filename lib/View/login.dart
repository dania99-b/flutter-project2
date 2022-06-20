import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trippo/View/Country.dart';

import 'package:trippo/API/api.dart';
import 'package:trippo/View/home.dart';
import 'package:trippo/Models/loginModel.dart';
import 'package:trippo/View/register.dart';
import 'officerDashboard.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Future _Login() async {
    loginModel loginmodel =
        new loginModel(EmailController.text, PasswordController.text);

    var response = await CallApi().postdata(loginmodel.toJson(), 'login');
    var body = json.decode(response.body);
    // print(body);
    saveToSharedPreferences('token', body['token']);

    if (body['success']) {
      if (body['role'] == "user") {
        Navigator.push(
          this.context,
          new MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      } else if (body['role'] == "officer") {
        Navigator.push(
          this.context,
          new MaterialPageRoute(
            builder: (context) => OfficerDashBoard(),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Invalid email or password')));
    }
  }

  // showMsg(msg) {
  //   final snackbar = SnackBar(
  //     content: Text(msg),
  //     action: SnackBarAction(
  //       label: 'Close',
  //       onPressed: () {
  //         //some
  //       },
  //     ),
  //   );
  //   Scaffold.of(context).showSnackBar(snackbar);
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Image.asset(
            //TODO update this

            'assets/img.png',
            // color: Colors.blue.withOpacity(0.7),
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            //color: const Color.fromRGBO(255, 255, 255, 1.9),
            colorBlendMode: BlendMode.modulate,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.transparent.withOpacity(.5),
                  Colors.transparent.withOpacity(.1),
                ])),
          ),
          Form(
            key: _formkey,
            child: Padding(
              padding: EdgeInsets.only(bottom: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    //TODO update this
                    'Join Tripo App!',
                    style: TextStyle(
                      fontSize: 19.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      // textAlign: TextAlign.end,

                      //  autofillHints: TextInputType.emailAddress,
                      controller: EmailController,

                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          size: 20,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some` text';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      //   textAlign: TextAlign.center,
                      controller: PasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      // onSaved: ,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    margin: EdgeInsets.fromLTRB(150, 10, 150, 10),
                    child: Center(
                      child: FlatButton(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        onPressed: () {
                          _Login();
                          if (_formkey.currentState!.validate()) {
                            return;
                          } else {
                            print("unsuccessful");
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Center(
                        child: Text(
                      "Don't have an account",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Center(
                          child: Text(
                        "Create account",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
