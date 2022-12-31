import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? hintText;
  String? labelText;
  TextInputType keyBoardType;
  bool securedText;
  Icon? myIcon;

  TextEditingController? controller;

  CustomTextField(
      {this.hintText,
      this.labelText,
      this.keyBoardType = TextInputType.text,
      this.securedText = false,
      this.myIcon,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (data) {
          if (data == '') {
            return 'Field is Required';
          }
          return null;
        },
        controller: controller,
        autofocus: true,
        keyboardType: keyBoardType,
        obscureText: securedText,
        decoration: InputDecoration(
          suffixIcon: myIcon,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: hintText,
          labelText: labelText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
