import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Cubits/material/material_cubit.dart';

class Material2 extends StatefulWidget {
  const Material2({super.key});

  @override
  State<Material2> createState() => _Material2State();
}

class _Material2State extends State<Material2> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaterialCubit, MaterialState2>(
      listener: (context, state) {
        if (state is SuccessfulDataUsers) {
          Fluttertoast.showToast(
              msg: "data loaded successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        if (state is ErrorDataUsers) {
          Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        MaterialCubit cubit = MaterialCubit.get(context);
        //  cubit.materialsssss();
        return Scaffold(
            body: state is SuccessfulDataUsers
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/background.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: cubit.materials.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title:
                                  Text(cubit.materials[index].title.toString()),
                              subtitle: Column(children: [
                                // Text("Room name: ${kids[index].address}",
                                //     style: TextStyle(fontSize: 12.sp)),
                                // Text(
                                //   "Status: ${kids[index].status}",
                                //   style: TextStyle(fontSize: 12.sp),
                                // )
                              ]),
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(cubit
                                      .materials[index].imageUrl
                                      .toString())),
                              trailing: SizedBox(
                                width: 150,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
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
                                                        const Icon(
                                                            Icons.delete),
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        const Text(
                                                            'Confirmation'),
                                                      ],
                                                    ),
                                                    const Divider()
                                                  ],
                                                ),
                                                content: const Text(
                                                    'Are you sure you want to delete this material?'),
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
                                                      cubit.materials
                                                          .remove(index);
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
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ));
      },
    );
  }
}
