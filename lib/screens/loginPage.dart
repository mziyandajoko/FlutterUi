import 'package:firebase_auth/firebase_auth.dart';
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
  bool _signInUser = false;
  String _signInEmail;
  String _signInPassword;

  // create new user account
  Future<String> _createAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _signInEmail,
        password: _signInPassword,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    //adds loading indicator
    setState(() {
      _signInUser = true;
    });
    // runs create account method
    String _signAccountFeedback = await _createAccount();
    if (_signAccountFeedback != null) {
      _alertDialogBuilder(_signAccountFeedback);
      //removes loading indicator
      setState(() {
        _signInUser = false;
      });
    } else {
      Navigator.pop(context);
    }
  }

// creates Alert dialog

  Future<void> _alertDialogBuilder(String error) async {
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
                  'Enter your Details to logIn',
                  textAlign: TextAlign.center,
                  style: kheaderBold,
                ),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: 'Email Address',
                    onChanged: (value) {
                      _signInEmail = value;
                    },
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  CustomInput(
                    hintText: 'Password',
                    onChanged: (value) {
                      _signInPassword = value;
                    },
                    focusNode: _passwordFocusNode,
                    isPasswordField: true,
                    onSubmitted: (value) {
                      _submitForm();
                    },
                  ),
                  CustomButton(
                    text: 'logIn',
                    onPressed: () {
                      _submitForm();
                    },
                    isLoading: _signInUser,
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
            ],
          ),
        ),
      ),
    );
  }
}
