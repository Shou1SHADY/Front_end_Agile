import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../../Core/Locale/shared_pref.dart';

enum Gender { Male, Female }

class AddParent extends StatefulWidget {
  const AddParent({super.key});

  @override
  State<AddParent> createState() => _AddParentState();
}

class _AddParentState extends State<AddParent> {
  String id = "";
  String gender = "";
  Gender? _character = Gender.Male;
  final _formKey = GlobalKey<FormState>();
  String dropdownValue3 = "Shady";
  List<String> list2 = <String>['Shady', 'Saudi Arabia', 'three', 'Four'];
  TextEditingController CityC = TextEditingController();
  TextEditingController AddressC = TextEditingController();
  TextEditingController EmailC = TextEditingController();
  TextEditingController mobileC = TextEditingController();
  TextEditingController First = TextEditingController();
  TextEditingController Second = TextEditingController();

  Widget RoomName(String hint, TextEditingController contr) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: TextFormField(
        //  autovalidateMode: AutovalidateMode.always,
        controller: contr,
        maxLines: 1,
        validator: ((value) {
          if (value!.isEmpty ||
              !(RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value))) {
            return "Enter Correct Name";
          } else {
            return null;
          }
        }),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
          labelText: hint,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewGradientAppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          //  automaticallyImplyLeading: true,
          gradient: const LinearGradient(colors: [Colors.red, Colors.blue]),
          elevation: 4,
          title: const Text(
            "Add Parent",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/photos/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      Expanded(child: RoomName("FirstName", First)),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(child: RoomName("Last Name", Second)),
                      SizedBox(
                        width: 30.w,
                      ),
                    ],
                  ),
                  const Divider(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      children: [
                        const Text("Gender:"),
                        Radio<Gender>(
                          value: Gender.Male,
                          groupValue: _character,
                          onChanged: (Gender? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                        const Text("Female"),
                        Radio<Gender>(
                          value: Gender.Female,
                          groupValue: _character,
                          onChanged: (Gender? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                        const Text("Male"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 22.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'Country',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0.r)),
                                contentPadding: EdgeInsets.all(5.r),
                              ),
                              child: ButtonTheme(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                child: DropdownButton<String>(
                                  hint: const Text("Country"),
                                  isExpanded: true,
                                  value: dropdownValue3,
                                  elevation: 16,
                                  underline: DropdownButtonHideUnderline(
                                    child: Container(),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue3 = newValue!;
                                    });
                                  },
                                  items: list2.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(left: 0.w, right: 30.w),
                          child: TextFormField(
                            //  autovalidateMode: AutovalidateMode.always,
                            controller: CityC,
                            maxLines: 1,
                            validator: ((value) {
                              if (value!.isEmpty ||
                                  !(RegExp(r'^[a-z A-Z 0-9]+$')
                                      .hasMatch(value))) {
                                return "Enter Correct City name";
                              } else {
                                return null;
                              }
                            }),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "City",
                              labelText: "City",
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      //  autovalidateMode: AutovalidateMode.always,
                      controller: AddressC,
                      maxLines: 1,
                      validator: ((value) {
                        if (value!.isEmpty ||
                            !(RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value))) {
                          return "Enter Correct Address";
                        } else {
                          return null;
                        }
                      }),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Address",
                        labelText: "Address",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      //  autovalidateMode: AutovalidateMode.always,
                      controller: EmailC,
                      maxLines: 1,
                      validator: ((value) {
                        if (value!.isEmpty ||
                            !(RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value))) {
                          return "Enter Correct Email";
                        } else {
                          return null;
                        }
                      }),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        labelText: "Email",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      //  autovalidateMode: AutovalidateMode.always,
                      controller: mobileC,
                      maxLines: 1,
                      validator: ((value) {
                        if (value!.isEmpty ||
                            !(RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value))) {
                          return "Enter Correct mobile";
                        } else {
                          return null;
                        }
                      }),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "mobile",
                        labelText: "mobile",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Divider(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.normal),
                      ),
                      onPressed: () {
                        _formKey.currentState!.validate();

                        if (CacheHelper.getData(key: "schoolid") != null) {
                          id = CacheHelper.getData(key: "schoolid");
                        } else {
                          id = "6364f3b8ed482e001638ab90";
                        }

                        if (_character == Gender.Male) {
                          gender = "male";
                        } else {
                          gender = "female";
                        }
                        // cubit.addTeacher(id, dropdownValue3, CityC, AddressC,
                        //     EmailC, First, Second, mobileC, gender);
                      },
                      child: const Text("Add Teacher")),
                ],
              ),
            ),
          ),
        ));
  }
}
