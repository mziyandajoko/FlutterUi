import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool btnOutline;

  const CustomButton({Key key, this.text, this.onPressed, this.btnOutline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _btnOutline = btnOutline ?? true;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _btnOutline ? Colors.transparent : kPrimaryColor,
          border: Border.all(
            color: kPrimaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 25,
        ),
        child: Text(
          text ?? 'Sample Text',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _btnOutline ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
