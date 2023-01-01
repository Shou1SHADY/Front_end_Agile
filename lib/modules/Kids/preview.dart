import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/kid.dart';

class Preview extends StatefulWidget {
  Kid kidView;
  // List<Kid> views = <Kid>[
  //   Kid(avatar: "assets/photos/Bills-and-plans.510a8cba.png", name: "Name"),
  //   Kid(avatar: "assets/photos/Bills-and-plans.510a8cba.png", name: "Name"),
  //   Kid(avatar: "assets/photos/Bills-and-plans.510a8cba.png", name: "Name"),
  //   Kid(avatar: "assets/photos/Bills-and-plans.510a8cba.png", name: "Name"),
  // ];

  Preview({super.key, required this.kidView});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  bool reportisNull = true;
  String firstReport = "All";
  String dropdownValue = "2022-10-13";
  Widget PersonalInfo(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> list = <String>[
      "2022-10-13",
      '2022-11-13',
      '2022-12-13',
      '2022-10-14',
      "2022-1-15",
      "2022-10-16",
      "2022-10-17"
    ];
    List<String> reports = <String>[
      "All",
      "Food",
      "Photo",
      "Video",
      "Naps",
      "Mood",
      "Potty",
      "Note",
      "Bottle",
      "Supplies",
      "Learning"
    ];

    //////////////////////////////////////////////////////////////
    List tabs = [
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: 150,
              child: Column(children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(widget.kidView.avatar.toString()),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.kidView.firstName.toString()),
              ]),
            ),
            const Divider(),
            PersonalInfo(
                Icons.cake, "Birthday", widget.kidView.birthday.toString()),
            PersonalInfo(
                widget.kidView.gender == 'Male'
                    ? Icons.male_rounded
                    : Icons.female_rounded,
                "Gender",
                widget.kidView.gender.toString()),
            PersonalInfo(Icons.medical_services, "Allergies",
                widget.kidView.allergies.toString()),
            PersonalInfo(Icons.medication, "Medications",
                widget.kidView.medications.toString()),
            // PersonalInfo(Icons.family_restroom_sharp, "Parents",
            //     widget.kidView.parent!.firstName.toString()),
            // PersonalInfo(
            //     Icons.email, "Email", widget.kidView.parent!.email.toString()),
            // PersonalInfo(Icons.mobile_friendly_outlined, "Mobile",
            //     widget.kidView.parent!.phone.toString()),
            PersonalInfo(Icons.location_city, "Address",
                widget.kidView.address.toString()),
            // Divider()
            //   Container(
            //     padding: EdgeInsets.only(top: 20),
            //     height: 150,
            //     child: Column(children: [
            //       CircleAvatar(
            //         radius: 40,
            //         backgroundColor: Colors.amberAccent,
            //       ),
            //       SizedBox(
            //         height: 10,
            //       ),
            //       Text("data"),
            //     ]),
            //   ),
            //   Expanded(
            //     child: ListView.builder(
            //       itemCount: kidView.length,
            //       itemBuilder: ((context, index) {
            //         return ListTile(
            //           leading: CircleAvatar(
            //             backgroundImage: AssetImage(views[index].avatar.toString()),
            //           ),
            //           title: Text(views[index].name.toString()),
            //         );
            //       }),
            //     ),
            //   ),
          ],
        ),
      ),
      Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: 150,
            child: Column(children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(widget.kidView.avatar.toString()),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(widget.kidView.firstName.toString()),
            ]),
          ),
          const Divider(),
          Container(
            margin: EdgeInsets.only(top: 20.h),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 35.h,
                    margin: EdgeInsets.only(right: 30.w, left: 30.w),
                    //    width: MediaQuery.of(context).size.width,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side:
                            BorderSide(width: 0.5.sp, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
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
                        style: const TextStyle(color: Colors.deepPurple),
                        // underline: Container(
                        //   height: 2,
                        //   color: Colors.black,
                        // ),
                        value: dropdownValue,
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 35.h,
                    margin: EdgeInsets.only(right: 30.w, left: 30.w),
                    //  width: MediaQuery.of(context).size.width,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side:
                            BorderSide(width: 0.5.sp, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        value: firstReport,
                        style: const TextStyle(color: Colors.deepPurple),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          ///////////////////////////?
                          setState(() {
                            firstReport = value!;
                            //  //   Students.add(dropdownValue2);
                            //    // CacheHelper.saveData(key: "Students", value: Students);
                          });
                        },
                        items: reports
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            child: reportisNull
                ? const Text(
                    "No Activities for this day",
                    style: TextStyle(color: Colors.grey),
                  )
                : Column(
                    children: const [],
                  ),
          )
        ],
        // children: [
        //   Container(
        //     padding: EdgeInsets.only(top: 20),
        //     height: 150,
        //     child: Column(children: [
        //       CircleAvatar(
        //         radius: 40,
        //         backgroundColor: Colors.amberAccent,
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Text("data"),
        //     ]),
        //   ),
        //   Expanded(
        //     child: ListView.builder(
        //       itemCount: views.length,
        //       itemBuilder: ((context, index) {
        //         return ListTile(
        //           leading: CircleAvatar(
        //             backgroundImage: AssetImage(views[index].avatar.toString()),
        //           ),
        //           title: Text(views[index].name.toString()),
        //         );
        //       }),
        //     ),
        //   ),
        // ],
      ),
      Column(
          // children: [
          //   Container(
          //     padding: EdgeInsets.only(top: 20),
          //     height: 150,
          //     child: Column(children: [
          //       CircleAvatar(
          //         radius: 40,
          //         backgroundColor: Colors.amberAccent,
          //       ),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Text("data"),
          //     ]),
          //   ),
          //   Expanded(
          //     child: ListView.builder(
          //       itemCount: views.length,
          //       itemBuilder: ((context, index) {
          //         return ListTile(
          //           leading: CircleAvatar(
          //             backgroundImage: AssetImage(views[index].avatar.toString()),
          //           ),
          //           title: Text(views[index].name.toString()),
          //         );
          //       }),
          //     ),
          //   ),
          // ],
          )
    ];
//////////////////////////////////////////////////////////////////

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Child moments"),
            // title: Row(
            //   children: [
            //     CircleAvatar(
            //       backgroundColor: Colors.amberAccent,
            //     ),
            //     Text("data"),
            //   ],
            // ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "Personal Info",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Daily Rerpots",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Files",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
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
            child: TabBarView(
              children: [...tabs.map((e) => e)],
            ),
          )),
    );
  }
}
