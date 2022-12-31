import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import "package:flutter/material.dart";
import 'package:localization/Core/Locale/shared_pref.dart';

import '../Core/Network/Constant.dart';
import '../Core/Network/Dio.dart';
import '../modules/Login.dart';
import 'app_root.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<String> uploadImage(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    var dio = Dio();
    var response = await DioHelper.postForm(url: LOGIN, data: formData);
    //await dio.post(LOGIN, data: formData);
    return response.data['id'];
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    String? ann1;
    String? ann2;
    if (CacheHelper.getData(key: "ann1") != null) {
      ann1 = CacheHelper.getData(key: "ann1");
    }

    if (CacheHelper.getData(key: "ann2") != null) {
      ann2 = CacheHelper.getData(key: "ann2");
    }
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 230,
          width: width * 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
            ),
            color: Color(0xFF363F93),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 82,
                  left: 0,
                  child: Container(
                    height: 90,
                    width: width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            topRight: Radius.circular(50))),
                  )),
              Positioned(
                  top: 115,
                  left: 30,
                  child: Text(
                    ann1 == null ? "JOIN US NOW" : ann1,
                    style: TextStyle(
                        color: Color(0xFF363F93),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        Container(
            height: 230,
            child: Stack(
              children: [
                Positioned(
                  top: 35,
                  left: 20,
                  child: Container(
                    height: 180.0,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            spreadRadius: 4.0,
                            color: Colors.grey.withOpacity(0.3),
                            offset: Offset(-10.0, 10.0),
                          )
                        ]),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 30,
                  child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Container(
                        height: 210,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/Violet.jpg"),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(15)),
                      )),
                ),
                Positioned(
                  top: 55,
                  left: 180,
                  child: Container(
                    height: 150,
                    width: 210,
                    child: Column(children: [
                      Text(
                        ann2 == null ? "ONCE IN A WHILE" : ann2,
                        style: TextStyle(
                            color: Color(0xFF363F93),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      Text("Don't miss it "),
                      SizedBox(height: 10),
                      Container(
                          padding: EdgeInsets.all(5),
                          child: Text("Enter the community NOW !"))
                    ]),
                  ),
                )
              ],
            )),
        Container(
          margin: EdgeInsets.only(top: 20, left: 50),
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
            color: Color(0xFF363F93),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color(0xFF363F93),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            onPressed: () async {
              // FilePickerResult? result = await FilePicker.platform.pickFiles();
              // late File file = File('your initial file');
              // ;
              // if (result != null) {
              //   file = File(result.files.single.path!);
              // } else {
              //   // User canceled the picker
              // }
              // uploadImage(file);
              NavigateToNextScreen(context);
            },
            child: Text(
              "JOIN",
              style: TextStyle(
                fontSize: 20,
              ),
            )),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(0xFF363F93),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
          onPressed: () {
            // setState(() {
            if (AppLocalizations.of(context)!.localeName == "ar") {
              CacheHelper.saveData(key: "lang", value: "en");
            } else {
              CacheHelper.saveData(key: "lang", value: "ar");
            }
            // });

            Navigator.push(context, MaterialPageRoute(builder: (_) => MyApp()));
          },
          child: Text(AppLocalizations.of(context)!.change_lang),
        ),
      ],
    ));
  }

  void NavigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
