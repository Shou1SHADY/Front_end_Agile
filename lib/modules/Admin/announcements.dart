import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/Core/Locale/shared_pref.dart';

class Announcements extends StatefulWidget {
  const Announcements({super.key});

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  Widget announcement(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 30),
      child: TextFormField(
        //  autovalidateMode: AutovalidateMode.always,
        controller: controller,

        validator: ((value) {
          if (value!.isEmpty ||
              !(RegExp(r'^[a-z A-Z]([\w])*$').hasMatch(value))) {
            return "Enter Correct Announcement";
          } else {
            return null;
          }
        }),
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.speaker,
            color: IconTheme.of(context).color,
          ),
          border: OutlineInputBorder(),
          hintText: "We had a golden hour last day",
          labelText: "Announcement",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/images/59284.png",
            height: 200.h,
            width: 200.w,
          ),
          announcement(_controller1),
          announcement(_controller2),
          SizedBox(
            height: 30.h,
          ),
          FloatingActionButton(
              child: Icon(Icons.east),
              backgroundColor: Colors.black45,
              onPressed: () {
                //////////////////////////////////////////
                CacheHelper.saveData(
                    key: "ann1", value: "${_controller1.value.text}");
                CacheHelper.saveData(
                    key: "ann2", value: "${_controller2.value.text}");

////////////////////////////////////////////////////////////////
                if (_formKey1.currentState!.validate()) {
                  SnackBar snackbar = SnackBar(
                      content: Text(
                          "ann1 ${_controller1.value.text} \n ann2 ${_controller2.value.text}"));

                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              }),
        ],
      ),
    ));
  }
}
