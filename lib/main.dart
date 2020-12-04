import 'package:flutter/material.dart';
import 'package:flutterUi/constants.dart';
import 'package:flutterUi/screens/landingPage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ShoeStore());
}

class ShoeStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          accentColor: kSecondaryColor,
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
      home: LandingPage(),
    );
  }
}
