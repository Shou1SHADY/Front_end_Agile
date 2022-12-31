import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Locale/shared_pref.dart';

class AddRoom extends StatefulWidget {
  const AddRoom({super.key});

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {
  @override
  void initState() {
    // Students = CacheHelper.getData(key: "Students");
    // Teachers = CacheHelper.getData(key: "Teachers");
    //RoomMeals = CacheHelper.getData(key: "RoomMeals");
    //RoomSubjects = CacheHelper.getData(key: "RoomSub");
    super.initState();
  }

  List Students = [];
  List Teachers = [];
  String dropdownValue = "Mr. Hossam";
  List<String> list = <String>['Mr. Hossam', 'Saudi Arabia', 'three', 'Four'];
  String dropdownValue2 = "Shady";
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
          hintText: "Room Name",
          labelText: "Room Name",
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
                        "Add Room",
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
                      RoomName(),
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
                      Container(
                        margin: EdgeInsets.only(right: 30.w, left: 30.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Teachers"),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              height: 35.h,
                              margin: EdgeInsets.only(right: 30.w, left: 30.w),
                              width: MediaQuery.of(context).size.width,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.5.sp, style: BorderStyle.solid),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0.r)),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: const Text(
                                    "Teachers",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  // underline: Container(
                                  //   height: 2,
                                  //   color: Colors.black,
                                  // ),
                                  value: dropdownValue,
                                  items: list.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValue = value!;
                                      CacheHelper.saveData(
                                          key: "Teachers", value: Teachers);
                                      Teachers.add(dropdownValue);
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            RoomPref("Teachers")
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.8.sp,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30.w, left: 30.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Teachers"),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              height: 35.h,
                              margin: EdgeInsets.only(right: 30.w, left: 30.w),
                              width: MediaQuery.of(context).size.width,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.5.sp, style: BorderStyle.solid),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0.r)),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  value: dropdownValue2,
                                  items: list2.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValue2 = value!;
                                      Students.add(dropdownValue2);
                                      CacheHelper.saveData(
                                          key: "Students", value: Students);
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            RoomPref("Students")
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 30.h,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {},
                  child: const Text("UpdateRoom"))
            ],
          ),
        ),
      ),
    );
  }
}
