import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterUi/screens/home.dart';

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

          //Returns home page when app is initialized
          if (snapshot.connectionState == ConnectionState.done) {
            return FlutterUi();
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
