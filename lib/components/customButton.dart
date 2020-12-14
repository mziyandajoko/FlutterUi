import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool btnOutline;
  final bool isLoading;

  const CustomButton(
      {Key key, this.text, this.onPressed, this.btnOutline, this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _btnOutline = btnOutline ?? true;
    bool _isloading = isLoading ?? false;
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
        child: Stack(
          children: [
            Visibility(
              visible: _isloading ? false : true,
              child: Center(
                child: Text(
                  text ?? 'Sample Text',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: _btnOutline ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isloading,
              child: Center(
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator())),
            ),
          ],
        ),
      ),
    );
  }
}
