import 'package:badges/badges.dart';

import 'package:flutter/material.dart';

import 'Custom_button.dart';

class CustomCircle extends StatelessWidget {
  String? boardText;
  String? myImage;

  CustomCircle(this.boardText, this.myImage);

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeContent: SizedBox(
        height: 50,
        width: 50,
        child: Image.asset(myImage!, fit: BoxFit.fill),
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.0, 1.0],
            colors: [
              Colors.deepPurple.shade400,
              Colors.deepPurple.shade200,
            ],
          ),
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(40),
        ),
        child: CustomButton(
          buttomText: boardText,
          heightSize: 100,
          buttonSize: 250,
          borderSize: 40,
        ),
      ),
    );
  }
}
