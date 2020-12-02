import 'package:flutter/material.dart';
import 'package:flutterUi/constants.dart';
import 'package:flutter_svg/svg.dart';

import 'productsList.dart';

class FlutterUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          'Shoe store',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart_with_item.svg"),
            onPressed: () {},
          ),
        ],
      ),
      body: ProductList(),
    );
  }
}
