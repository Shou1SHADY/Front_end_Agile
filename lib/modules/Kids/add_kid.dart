import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/modules/Kids/kids.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../Core/Locale/shared_pref.dart';
import 'package:intl/intl.dart';

import '../../models/kid.dart';

enum Gender { Male, Female }

class AddKid extends StatefulWidget {
  final Function addTran;
  const AddKid({super.key, required this.addTran});

  @override
  State<AddKid> createState() => _AddKidState();
}

class _AddKidState extends State<AddKid> {
  Kid kid = Kid();
  Gender? _character = Gender.Male;
  TextEditingController AddressC = TextEditingController();
  TextEditingController StudentIdC = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController EmailC = TextEditingController();
  TextEditingController mobileC = TextEditingController();
  TextEditingController ParentFirst = TextEditingController();
  TextEditingController ParentSecond = TextEditingController();
  TextEditingController ParentEC = TextEditingController();
  TextEditingController ParentMC = TextEditingController();
  @override
  void initState() {
    dateInput.text = "";
    // Students = CacheHelper.getData(key: "Students");
    // Teachers = CacheHelper.getData(key: "Teachers");
    //RoomMeals = CacheHelper.getData(key: "RoomMeals");
    //RoomSubjects = CacheHelper.getData(key: "RoomSub");
    super.initState();
  }

  ///////////////////////////////////////

  //////////////////////////////////////////////

  List Students = [];
  List Teachers = [];

  String dropdownValue3 = "Shady";
  List<String> list2 = <String>['Shady', 'Saudi Arabia', 'three', 'Four'];
  bool _visibility = false;
  final _formKey = GlobalKey<FormState>();
  bool _subjectsVisibility = false;
  // ignore: non_constant_identifier_names
  List Allergies = [];
  // ignore: non_constant_identifier_names
  List Medications = [];
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  var subjects_controller = TextEditingController();
  var meal_controller = TextEditingController();

  Widget RoomPref(String Pref) {
    if (Pref == "Allergies") {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          height: 50.h,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 210, 210, 210),
              borderRadius: BorderRadius.circular(70.r)),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Allergies.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text("${Allergies[index]}"),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          Allergies.remove("${Allergies[index]}");
                        });
                      },
                    )
                  ],
                );
              }));
    } else if (Pref == "Medications") {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          height: 50.h,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 210, 210, 210),
              borderRadius: BorderRadius.circular(70.r)),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Medications.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text("${Medications[index]}"),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          Medications.remove("${Medications[index]}");
                        });
                      },
                    )
                  ],
                );
              }));
    } else if (Pref == "Teachers") {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          height: 30.h,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 210, 210, 210),
              borderRadius: BorderRadius.circular(70.r)),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Teachers.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text("${Teachers[index]}"),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          Teachers.remove("${Teachers[index]}");
                        });
                      },
                    )
                  ],
                );
              }));
    } else {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          height: 30.h,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 210, 210, 210),
              borderRadius: BorderRadius.circular(70.r)),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Students.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text("${Students[index]}"),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          Students.remove("${Students[index]}");
                        });
                      },
                    )
                  ],
                );
              }));
    }
  }

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
    //String dropdownValue = list.first;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///////////////////////////AppBar///////////////////////////////////
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.red,
                        Colors.indigo,
                      ],
                    )),
                  ),
                  Positioned(
                      top: 50.h,
                      left: 130.w,
                      child: Text(
                        "Student",
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  )
                ],
              ),

              ///////////////////////////AppBar///////////////////////////////////
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 30.w,
                          ),
                          Expanded(child: RoomName("FirstName", _controller1)),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(child: RoomName("Last Name", _controller2)),
                          SizedBox(
                            width: 30.w,
                          ),
                        ],
                      ),
                      const Divider(),
                      ///////////////////////////
                      Container(
                          padding: const EdgeInsets.all(15),
                          height: MediaQuery.of(context).size.width / 3,
                          child: Center(
                              child: TextField(
                            controller: dateInput,
                            //editing controller of this TextField
                            decoration: const InputDecoration(
                                icon: Icon(
                                    Icons.calendar_today), //icon of text field
                                labelText: "Enter Date" //label text of field
                                ),
                            readOnly: true,
                            //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  dateInput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                          ))),

                      /////////////////////////////
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
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: TextFormField(
                          //  autovalidateMode: AutovalidateMode.always,
                          controller: AddressC,
                          maxLines: 1,
                          validator: ((value) {
                            if (value!.isEmpty ||
                                !(RegExp(r'^[a-z A-Z 0-9]+$')
                                    .hasMatch(value))) {
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
                          controller: StudentIdC,
                          maxLines: 1,
                          validator: ((value) {
                            if (value!.isEmpty ||
                                !(RegExp(r'^[a-z A-Z 0-9]+$')
                                    .hasMatch(value))) {
                              return "Enter Correct Student Id";
                            } else {
                              return null;
                            }
                          }),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Student Id",
                            labelText: "Student Id",
                          ),
                        ),
                      ),
                      const Divider(),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Row(children: [
                              const Text("Allergies"),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _visibility = !_visibility;
                                    });
                                  },
                                  icon: const Icon(Icons.add))
                            ]),
                          ),
                          Visibility(
                            visible: _visibility,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 8.h),
                              child: TextFormField(
                                controller: meal_controller,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.verified),
                                    onPressed: () {
                                      setState(() {
                                        Allergies.add(meal_controller.text);
                                        meal_controller.clear();
                                        CacheHelper.saveData(
                                            key: "Allergies", value: Allergies);
                                      });
                                    },
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: "Allergies",
                                  labelText: "Allergies",
                                ),
                              ),
                            ),
                          ),
                          RoomPref("Allergies"),
                        ],
                      ),
                      Divider(
                        thickness: 0.8.sp,
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Row(children: [
                              const Text("Medications"),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _subjectsVisibility =
                                          !_subjectsVisibility;
                                    });
                                  },
                                  icon: const Icon(Icons.add))
                            ]),
                          ),
                          Visibility(
                            visible: _subjectsVisibility,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 8.h),
                              child: TextFormField(
                                controller: subjects_controller,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.verified),
                                    onPressed: () {
                                      setState(() {
                                        Medications.add(
                                            subjects_controller.text);
                                        subjects_controller.clear();
                                        CacheHelper.saveData(
                                            key: "Medications",
                                            value: Medications);
                                      });
                                    },
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: "Medications",
                                  labelText: "Medications",
                                ),
                              ),
                            ),
                          ),
                          RoomPref("Medications"),
                        ],
                      ),
////////
                      Divider(
                        thickness: 0.8.sp,
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
                                        borderRadius:
                                            BorderRadius.circular(5.0.r)),
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
                                      items: list2
                                          .map<DropdownMenuItem<String>>(
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
                                controller: _controller1,
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
                    ],
                  )),
              SizedBox(
                height: 15.h,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  //  autovalidateMode: AutovalidateMode.always,
                  controller: EmailC,
                  maxLines: 1,
                  validator: ((value) {
                    if (value!.isEmpty ||
                        !(RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value))) {
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
                height: 25.h,
              ),
              const Divider(
                thickness: 3,
              ),
              SizedBox(
                height: 10.h,
              ),
              // Text(
              //   "Parents",
              //   style: TextStyle(fontSize: 20.sp),
              // ),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: 30.w,
              //     ),
              //     Expanded(child: RoomName("FirstName", ParentFirst)),
              //     SizedBox(
              //       width: 8.w,
              //     ),
              //     Expanded(child: RoomName("Last Name", ParentSecond)),
              //     SizedBox(
              //       width: 30.w,
              //     ),
              //   ],
              // ),
              // Container(
              //   margin: EdgeInsets.only(left: 30, right: 30, top: 20.h),
              //   child: TextFormField(
              //     //  autovalidateMode: AutovalidateMode.always,
              //     controller: ParentEC,
              //     maxLines: 1,
              //     validator: ((value) {
              //       if (value!.isEmpty ||
              //           !(RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value))) {
              //         return "Enter Correct Email";
              //       } else {
              //         return null;
              //       }
              //     }),
              //     decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       hintText: "Email",
              //       labelText: "Email",
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 8.h,
              // ),
              // Container(
              //   margin: const EdgeInsets.only(left: 30, right: 30),
              //   child: TextFormField(
              //     //  autovalidateMode: AutovalidateMode.always,
              //     controller: ParentMC,
              //     maxLines: 1,
              //     validator: ((value) {
              //       if (value!.isEmpty ||
              //           !(RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value))) {
              //         return "Enter Correct mobile";
              //       } else {
              //         return null;
              //       }
              //     }),
              //     decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       hintText: "mobile",
              //       labelText: "mobile",
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20.h,
              // ),

              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  //  autovalidateMode: AutovalidateMode.always,
                  controller: ParentEC,
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
                    setState(() {
                      kid.address = AddressC.value.text;
                      kid.firstName = _controller1.value.text;
                      //   kid.gender = _character as String?;
                      kid.avatar = "assets/images/486x486bb.png";
                      kid.status = "active";
                      widget.addTran(kid);
                      //  addTransaction()
                      //  print(Kids().kids.length);
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => Kids()));
                    });
                  },
                  child: const Text("Add Student")),
            ],
          ),
        ),
      ),
    );
  }
}
