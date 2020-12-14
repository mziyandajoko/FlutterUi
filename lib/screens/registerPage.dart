import 'package:flutter/material.dart';
import 'package:flutterUi/components/CustomInput.dart';
import 'package:flutterUi/components/customButton.dart';

import '../constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Future<void> _alertDialogBuilder() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Container(
              child: Text('an erro has occured'),
            ),
            actions: [
              FlatButton(
                child: Text('close'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  bool _registerUser = false;

  String _registerEmail;
  String _registerPassword;

  //input focusNode

  FocusNode _passwordFocusNode;
  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

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
                    onChanged: (value) {
                      _registerEmail = value;
                    },
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  CustomInput(
                    hintText: 'Password',
                    onChanged: (value) {
                      _registerPassword = value;
                    },
                    focusNode: _passwordFocusNode,
                    isPasswordField: true,
                  ),
                  CustomButton(
                    text: 'Register',
                    onPressed: () {
                      setState(() {
                        _registerUser = true;
                      });
                    },
                    isLoading: _registerUser,
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
