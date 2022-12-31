import "package:flutter/material.dart";

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/modules/Rooms/search.dart';
import 'package:localization/modules/Rooms/visualize.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import '../../Core/Locale/shared_pref.dart';
import '../../models/room.dart';
import 'add_room.dart';
import 'edit.dart';

class Rooms extends StatefulWidget {
  const Rooms({super.key});

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  void initState() {
    //CacheHelper.saveData(key: "Rooms", value: rooms);
    //rooms = CacheHelper.getData(key: "Rooms");
    super.initState();
  }

  List<Materialss> rooms = <Materialss>[
    Materialss(
        avatar: "assets/photos/classes.1f8b8228.png",
        Teachers: "2",
        name: "shady",
        students: "1"),
    Materialss(
        avatar: "assets/photos/classes.1f8b8228.png",
        Teachers: "2",
        name: "name2",
        students: "1"),
    Materialss(
        avatar: "assets/photos/classes.1f8b8228.png",
        Teachers: "2",
        name: "name3",
        students: "1"),
    Materialss(
        avatar: "assets/photos/classes.1f8b8228.png",
        Teachers: "2",
        name: "name4",
        students: "1")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(125.h),
        child: NewGradientAppBar(
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
                                delegate: CustomSearchDelegate());
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
                          ))
                      // TextFormField(
                      //   onTap: () {
                      //     // method to show the search bar
                      //     showSearch(
                      //         context: context,
                      //         // delegate to customize the search bar
                      //         delegate: CustomSearchDelegate());
                      //   },
                      //   decoration: InputDecoration(
                      //       fillColor: Colors.white,
                      //       enabledBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(25.0),
                      //         borderSide: const BorderSide(
                      //           color: Colors.white,
                      //           width: 2.0,
                      //         ),
                      //       ),
                      //       prefixIcon: const Icon(
                      //         Icons.search,
                      //         color: Colors.white,
                      //       )),
                      // ),
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.h, right: 10.w),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const AddRoom()));
                      },
                      child: const Text(
                        "+ Add new room",
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
            image: AssetImage("assets/photos/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (<Materialss>(context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text(rooms[index].name.toString()),
                  subtitle: Column(children: [
                    Text("Teachers: ${rooms[index].Teachers.toString()}",
                        style: TextStyle(fontSize: 12.sp)),
                    Text(
                      "Students: ${rooms[index].students.toString()}",
                      style: TextStyle(fontSize: 12.sp),
                    )
                  ]),
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(rooms[index].avatar.toString())),
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
                                      builder: (_) => Visualize()));
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const EditRoom()));
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
                                        'Are you sure you want to delete this room?'),
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
                                            rooms.remove(rooms[index]);
                                            CacheHelper.saveData(
                                                key: "Rooms", value: rooms);
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
