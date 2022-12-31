import 'package:flutter/material.dart';

class ColorCustomButton extends StatelessWidget {
  String? buttomText;
  double? buttomTextSize;
  double? buttonSize;
  double? heightSize;
  double? borderSize;
  VoidCallback? onPressed;
  MaterialStatePropertyAll<Color>? myColor;

  ColorCustomButton({
    this.buttomText,
    this.buttomTextSize,
    this.buttonSize,
    this.onPressed,
    this.heightSize,
    this.borderSize,
    this.myColor,
  });

//   @override
//   State<CustomButton> createState() => _CustomButtonState();
// }

// class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: buttonSize,
      height: heightSize,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderSize!))),
          backgroundColor: myColor,
        ),
        onPressed: onPressed,
        child: Text(
          buttomText!,
          style: TextStyle(fontSize: buttomTextSize, color: Colors.white),
        ),
      ),
    );
  }
}
