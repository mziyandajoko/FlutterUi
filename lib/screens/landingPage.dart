import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterUi/screens/home.dart';
import 'package:flutterUi/screens/loginPage.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialazation = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialazation,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                //returns Error Message on connetion error
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          }

          //Returns login page when app is initialized
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      //returns Error Message on connetion error
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  );
                }

                // check active state for the user is it login
                if (snapshot.connectionState == ConnectionState.active) {
                  User _user = snapshot.data;

                  if (_user == null) {
                    //if user is not login
                    return LoginPage();
                  } else {
                    //if user succecfully login
                    return HomePage();
                  }
                }

                //Awaits AuthState
                return Scaffold(
                  body: Center(
                    child: Text('Checking Authentication'),
                  ),
                );
              },
            );
          }
          //Awaits connection with firebase
          return Scaffold(
            body: Center(
              child: Text('Loading Data'),
            ),
          );
        });
  }
}
