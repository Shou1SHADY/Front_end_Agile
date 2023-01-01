import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:localization/models/kid.dart';

import '../../Core/Locale/shared_pref.dart';

enum Gender { Male, Female }

class EditKid extends StatefulWidget {
  EditKid({super.key, required Kid kidView});

  @override
  State<EditKid> createState() => _EditKidState();
}

class _EditKidState extends State<EditKid> {
  Gender? _character = Gender.Male;

  TextEditingController dateInput = TextEditingController();
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
  List RoomMeals = [];
  List RoomSubjects = [];
  final _controller1 = TextEditingController();
  var subjects_controller = TextEditingController();
  var meal_controller = TextEditingController();

  Widget RoomPref(String Pref) {
    if (Pref == "Meals") {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          height: 50.h,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 210, 210, 210),
              borderRadius: BorderRadius.circular(70.r)),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: RoomMeals.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text("${RoomMeals[index]}"),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          RoomMeals.remove("${RoomMeals[index]}");
                        });
                      },
                    )
                  ],
                );
              }));
    } else if (Pref == "Sub") {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          height: 50.h,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 210, 210, 210),
              borderRadius: BorderRadius.circular(70.r)),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: RoomSubjects.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text("${RoomSubjects[index]}"),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          RoomSubjects.remove("${RoomSubjects[index]}");
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

  Widget RoomName() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: TextFormField(
        //  autovalidateMode: AutovalidateMode.always,
        controller: _controller1,
        maxLines: 1,
        validator: ((value) {
          if (value!.isEmpty ||
              !(RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value))) {
            return "Enter Correct Name";
          } else {
            return null;
          }
        }),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Student",
          labelText: "Student",
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
            image: AssetImage("assets/photos/background.png"),
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
                          Expanded(child: RoomName()),
                          Expanded(child: RoomName()),
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
                      const Divider(),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Row(children: [
                              const Text("Meals"),
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
                                        RoomMeals.add(meal_controller.text);
                                        meal_controller.clear();
                                        CacheHelper.saveData(
                                            key: "RoomMeals", value: RoomMeals);
                                      });
                                    },
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: "New Meal",
                                  labelText: "New Meal",
                                ),
                              ),
                            ),
                          ),
                          RoomPref("Meals"),
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
                              const Text("Subjects"),
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
                                        RoomSubjects.add(
                                            subjects_controller.text);
                                        subjects_controller.clear();
                                        CacheHelper.saveData(
                                            key: "RoomSub",
                                            value: RoomSubjects);
                                      });
                                    },
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: "New Subject",
                                  labelText: "New Subject",
                                ),
                              ),
                            ),
                          ),
                          RoomPref("Sub"),
                        ],
                      ),
////////
                      Divider(
                        thickness: 0.8.sp,
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(19.0),
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'Country',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  contentPadding: const EdgeInsets.all(5),
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
                            margin: const EdgeInsets.only(left: 30, right: 30),
                            child: TextFormField(
                              //  autovalidateMode: AutovalidateMode.always,
                              controller: _controller1,
                              maxLines: 1,
                              validator: ((value) {
                                if (value!.isEmpty ||
                                    !(RegExp(r'^[a-z A-Z 0-9]+$')
                                        .hasMatch(value))) {
                                  return "Enter Correct Name";
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
                    ],
                  )),
              SizedBox(
                height: 15.h,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  //  autovalidateMode: AutovalidateMode.always,
                  controller: _controller1,
                  maxLines: 1,
                  validator: ((value) {
                    if (value!.isEmpty ||
                        !(RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value))) {
                      return "Enter Correct Name";
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
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  //  autovalidateMode: AutovalidateMode.always,
                  controller: _controller1,
                  maxLines: 1,
                  validator: ((value) {
                    if (value!.isEmpty ||
                        !(RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value))) {
                      return "Enter Correct Name";
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
              ),
              SizedBox(
                height: 30.h,
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
                  onPressed: () {},
                  child: const Text("Update"))
            ],
          ),
        ),
      ),
    );
  }
}
