import 'package:carousel_slider/carousel_slider.dart';
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
//////////////////////////////////////////////////////
  Widget Slidee(int index) {
    PreparationsCubit cubit = PreparationsCubit.get(context);
    if (index == 0) {
      return CarouselSlider(
        options: CarouselOptions(
          height: 190.0.h,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: [
          "assets/images/Behind-the-Scenes.png",
          "assets/images/c72643b0c16a8e921a8d79670f20f7b3.jpg",
          "assets/images/oldtimer-tunnel-ad.jpg",
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(i))),

                // child: Text(
                //   'text $i',
                //   style: TextStyle(fontSize: 16.0),
                // )
              );
            },
          );
        }).toList(),
      );
    } else
      return SizedBox();
  }

//////////////////////////////////////////////////

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
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: cubit.ta7dirs.length,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  Slidee(index),
                                  SizedBox(height: 20.h),
                                  ListTile(
                                    title: Column(
                                      children: [
                                        Text(
                                            "Subject: ${cubit.ta7dirs[index].preparationDetails!.subject.toString()}"),
                                        Text(
                                            "Leader name: ${cubit.ta7dirs[index].chef!.name.toString()}")
                                      ],
                                    ),
                                    subtitle: Column(children: [
                                      Text(
                                          "Leader Email: ${cubit.ta7dirs[index].chef!.email.toString()}")
                                    ]),
                                    trailing: SizedBox(
                                      width: 160,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Money needed: ${cubit.ta7dirs[index].preparationDetails!.money.toString()}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                  "Meal prepared: ${cubit.ta7dirs[index].preparationDetails!.meal.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  "Materials quantity: ${cubit.ta7dirs[index].preparationDetails!.materiels![0].quantity.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  "Materials name: ${cubit.ta7dirs[index].preparationDetails!.materiels![0].title.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold)),
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
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ));
      },
    );
  }
}
