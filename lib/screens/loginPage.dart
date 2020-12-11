import 'package:flutter/material.dart';
import 'package:flutterUi/components/CustomInput.dart';
import 'package:flutterUi/components/customButton.dart';
import 'package:flutterUi/constants.dart';

import 'registerPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  'Enter your Details to logIn',
                  textAlign: TextAlign.center,
                  style: kheaderBold,
                ),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: 'Email Address',
                  ),
                  CustomInput(
                    hintText: 'Password',
                  ),
                  CustomButton(
                    text: 'Login',
                    onPressed: () {},
                  ),
                ],
              ),
              CustomButton(
                  text: 'Create Your Account',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  btnOutline: false),
            ],
          ),
        ),
      ),
    );
  }
}
