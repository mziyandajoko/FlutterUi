import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;

  const CustomInput({Key key, this.hintText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 18,
            )),
      ),
    );
  }
}