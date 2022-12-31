import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/room.dart';
import '../../modules/Rooms/edit.dart';
import '../../modules/Rooms/visualize.dart';

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying

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
    List<Materialss> matchQuery = [];
    for (var fruit in rooms) {
      if (fruit.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      } else if (fruit.Teachers!.toString().contains(query)) {
        matchQuery.add(fruit);
      } else if (fruit.students!.toString().contains(query)) {
        matchQuery.add(fruit);
      }
    }

/////////////////////////////////////
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (<Materialss>(context, index) {
        return Column(
          children: [
            ListTile(
              title: Text(rooms[index].name.toString()),
              subtitle: Column(children: [
                Text("Teachers: ${rooms[index].Teachers}",
                    style: TextStyle(fontSize: 12.sp)),
                Text(
                  "Students: ${rooms[index].students}",
                  style: TextStyle(fontSize: 12.sp),
                )
              ]),
              leading: CircleAvatar(
                  backgroundImage: AssetImage(rooms[index].avatar.toString())),
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
    List<Materialss> matchQuery = [];
    for (var fruit in rooms) {
      if (fruit.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      } else if (fruit.Teachers!
          .toString()
          .toLowerCase()
          .contains(query.toString().toLowerCase())) {
        matchQuery.add(fruit);
      } else if (fruit.students!
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

/////////////////////////////////////
    return ListView.builder(
      itemCount: matchQuery.length,
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
                  backgroundImage: AssetImage(rooms[index].avatar.toString())),
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
  }
}
