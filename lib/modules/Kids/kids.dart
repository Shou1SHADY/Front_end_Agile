import 'package:badges/badges.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/modules/Kids/preview.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../../models/kid.dart';
import 'add_kid.dart';
import 'add_parent.dart';
import 'edit_kid.dart';
import 'kid_search.dart';

class Kids extends StatefulWidget {
  Kids({super.key});

  @override
  State<Kids> createState() => _KidsState();
}

class _KidsState extends State<Kids> {
  void _addTransaction(Kid kido) {
    setState(() {
      kids.add(kido);
    });
  }

  List<Kid> kids = <Kid>[
    Kid(
        avatar: "assets/images/486x486bb.png",
        firstName: "shady",
        status: "invited"),
    Kid(
        avatar: "assets/images/486x486bb.png",
        firstName: "name2",
        status: "active"),
    Kid(
        avatar: "assets/images/860454.png",
        firstName: "name3",
        status: "invited"),
    Kid(
        avatar: "assets/images/6963.jpg",
        firstName: "name4",
        status: "inactive")
  ];

  @override
  void initState() {
    //CacheHelper.saveData(key: "Kids", value: kids);
    //rooms = CacheHelper.getData(key: "Kids");
    super.initState();
  }

  Widget getFloating(int index) {
    if (index == 0) {
      return FloatingActionButton(
          child: Row(
            children: [
              Icon(Icons.add),
              Icon(Icons.family_restroom_sharp),
            ],
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AddParent()));
          });
    } else
      return SizedBox(
        height: 0.00001.h,
      );
  }

  // List<Kid> kids = <Kid>[
  //   Kid(
  //       avatar: "assets/photos/classes.1f8b8228.png",
  //       firstName: "shady",
  //       status: "invited"),
  //   Kid(
  //       avatar: "assets/photos/classes.1f8b8228.png",
  //       firstName: "name2",
  //       status: "active"),
  //   Kid(
  //       avatar: "assets/photos/classes.1f8b8228.png",
  //       firstName: "name3",
  //       status: "invited"),
  //   Kid(
  //       avatar: "assets/photos/classes.1f8b8228.png",
  //       firstName: "name4",
  //       status: "inactive")
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(125.h),
        child: NewGradientAppBar(
          actions: [
            Badge(
              position: BadgePosition.topEnd(top: 10, end: 10),
              badgeContent: const Text("1"),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_alert_outlined),
              ),
            ),
          ],

          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          //  automaticallyImplyLeading: true,
          gradient: const LinearGradient(colors: [Colors.red, Colors.blue]),
          elevation: 4,
          title: const Text(
            "Child Moments",
            style: TextStyle(color: Colors.white),
          ),
          // bottom: ,
          flexibleSpace: Container(
            margin: EdgeInsets.only(top: 65.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 70.h,
                    padding:
                        const EdgeInsets.only(right: 18.0, left: 18, top: 28),
                    child: InkWell(
                      onTap: () {
                        showSearch(
                            context: context,
                            //  delegate to customize the search bar
                            delegate: CustomSearchDelegate1(kids: kids));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 190.w),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                        /////////////////////////////////////
                        // onTap: () {
                        //   // method to show the search bar
                        //   showSearch(
                        //       context: context,
                        //       // delegate to customize the search bar
                        //       delegate: CustomSearchDelegate());
                        // },
                        ///////////////////////////////////////
                        // decoration: InputDecoration(
                        //     fillColor: Colors.white,
                        //     enabledBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(25.0),
                        //       borderSide: BorderSide(
                        //         color: Colors.white,
                        //         width: 2.0,
                        //       ),
                        //     ),
                        //     prefixIcon: Icon(
                        //       Icons.search,
                        //       color: Colors.white,
                        //     )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.h, right: 10.w),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    AddKid(addTran: _addTransaction)));
                      },
                      child: const Text(
                        "+ Add new Kid",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
          //actions: [],
        ),
      ),

      /////////////////////
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: kids.length,
          itemBuilder: (<Kid>(context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                getFloating(index),
                SizedBox(height: 10.h),
                ListTile(
                  title: Text(kids[index].firstName.toString()),
                  subtitle: Column(children: [
                    Text("Room Name: ${kids[index].lastName.toString()}",
                        style: TextStyle(fontSize: 12.sp)),
                    Text(
                      "Status: ${kids[index].status.toString()}",
                      style: TextStyle(fontSize: 12.sp),
                    )
                  ]),
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(kids[index].avatar.toString())),
                  trailing: SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Preview(
                                            kidView: kids[index],
                                          )));
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => EditKid(
                                            kidView: kids[index],
                                          )));
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.delete),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            const Text('Confirmation'),
                                          ],
                                        ),
                                        const Divider()
                                      ],
                                    ),
                                    content: const Text(
                                        'Are you sure you want to delete this Kid?'),
                                    actions: [
                                      TextButton(
                                        // Colors.black,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('CANCEL'),
                                      ),
                                      TextButton(
                                        //   textColor: Colors.black,
                                        onPressed: () {
                                          setState(() {
                                            kids.remove(kids[index]);
                                            //CacheHelper.saveData(
                                            // key: "Kids", value: kids);
                                          });

                                          Navigator.pop(context);
                                        },
                                        child: const Text('ACCEPT'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                ),
                const Divider(),
              ],
            );
          }),
        ),
      ),

      /////////////
    );
  }
}
