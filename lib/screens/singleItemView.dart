import 'package:flutter/material.dart';

class SingleItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Item View'),
      ),
      body: Container(
          child: Center(
        child: Text('No Item added Yet!'),
      )),
    );
  }
}
