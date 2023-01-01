import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Cubits/preparations/preparations_cubit.dart';

class Preparation extends StatefulWidget {
  const Preparation({super.key});

  @override
  State<Preparation> createState() => _PreparationState();
}

class _PreparationState extends State<Preparation> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PreparationsCubit, PreparationsState2>(
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
        PreparationsCubit cubit = PreparationsCubit.get(context);
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
                      itemCount: cubit.ta7dirs.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Column(
                                children: [
                                  Text(cubit.ta7dirs[index].preparationDetails!
                                      .subject
                                      .toString()),
                                  Text(cubit.ta7dirs[index].chef!.name
                                      .toString())
                                ],
                              ),
                              subtitle: Column(children: [
                                Text(
                                    cubit.ta7dirs[index].chef!.email.toString())
                                // Text("Room name: ${kids[index].address}",
                                //     style: TextStyle(fontSize: 12.sp)),
                                // Text(
                                //   "Status: ${kids[index].status}",
                                //   style: TextStyle(fontSize: 12.sp),
                                // )
                              ]),
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(cubit
                                      .ta7dirs[index]
                                      .preparationDetails!
                                      .materiels![index]
                                      .imageUrl
                                      .toString())),
                              trailing: SizedBox(
                                width: 150,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      children: [
                                        Text(cubit.ta7dirs[index]
                                            .preparationDetails!.money
                                            .toString()),
                                        Text(cubit.ta7dirs[index]
                                            .preparationDetails!.meal
                                            .toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(cubit
                                            .ta7dirs[index]
                                            .preparationDetails!
                                            .materiels![index]
                                            .quantity
                                            .toString()),
                                        Text(cubit
                                            .ta7dirs[index]
                                            .preparationDetails!
                                            .materiels![index]
                                            .title
                                            .toString()),
                                      ],
                                    ),
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
