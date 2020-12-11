import 'package:flutter/material.dart';
import 'package:flutterUi/components/CustomInput.dart';
import 'package:flutterUi/components/customButton.dart';

import '../constants.dart';

class RegisterPage extends StatelessWidget {
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
                  'Create A New Account',
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
                    text: 'Register',
                    onPressed: () {},
                  ),
                ],
              ),
              CustomButton(
                  text: 'Already have an accout Login',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  btnOutline: false),
            ],
          ),
        ),
      ),
    );
  }
}
