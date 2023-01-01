import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/kid.dart';
import '../../modules/Rooms/edit.dart';
import '../../modules/Rooms/visualize.dart';

class CustomSearchDelegate1 extends SearchDelegate {
  // Demo list to show querying
  List<Kid> kids;
  CustomSearchDelegate1({required this.kids});

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Kid> matchQuery = [];
    for (var fruit in kids) {
      if (fruit.firstName!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      } else if (fruit.address!.toString().contains(query)) {
        matchQuery.add(fruit);
      } else if (fruit.status!.toString().contains(query)) {
        matchQuery.add(fruit);
      }
    }

/////////////////////////////////////
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (<Room>(context, index) {
        return Column(
          children: [
            ListTile(
              title: Text(kids[index].firstName.toString()),
              subtitle: Column(children: [
                Text("Room name: ${kids[index].address}",
                    style: TextStyle(fontSize: 12.sp)),
                Text(
                  "Status: ${kids[index].status}",
                  style: TextStyle(fontSize: 12.sp),
                )
              ]),
              leading: CircleAvatar(
                  backgroundImage: AssetImage(kids[index].avatar.toString())),
              trailing: SizedBox(
                width: 150,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Visualize()));
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
                                      // setState(() {
                                      //   rooms.remove(rooms[index]);
                                      //   CacheHelper.saveData(
                                      //       key: "Rooms", value: rooms);
                                      // });

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
    );

//////////////////////////////////////
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Kid> matchQuery = [];
    for (var fruit in kids) {
      if (fruit.firstName!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      } else if (fruit.status!.toString().contains(query)) {
        matchQuery.add(fruit);
      }
    }

/////////////////////////////////////
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (<Room>(context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(kids[index].firstName.toString()),
                subtitle: Column(children: [
                  Text("RoomName: ${kids[index].country.toString()}",
                      style: TextStyle(fontSize: 12.sp)),
                  Text(
                    "Status: ${kids[index].status.toString()}",
                    style: TextStyle(fontSize: 12.sp),
                  )
                ]),
                leading: CircleAvatar(
                    backgroundImage: AssetImage(kids[index].avatar.toString())),
                trailing: SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Visualize()));
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
                                        // setState(() {
                                        //   rooms.remove(rooms[index]);
                                        //   CacheHelper.saveData(
                                        //       key: "Rooms", value: rooms);
                                        // });

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
    );
  }
}
