import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Network/Constant.dart';
import '../../Core/Network/Dio.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  Future<String> uploadImage(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    var dio = Dio();
    var response = await DioHelper.postForm(url: UPLOAD, data: formData);
    //await dio.post(LOGIN, data: formData);
    if (response != null) {
      print("HURRRRRRRRRRRRRRRRRRRRRRRRRRRAY");
    }
    return response.data['id'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Reports")),
          backgroundColor: const Color(0xFF363f93),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 2.w, top: 100.h),
                  child: Text(
                    "Upload your Files here",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  )),
              Container(
                child: InkWell(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();
                    late File file = File('your initial file');
                    ;
                    if (result != null) {
                      file = File(result.files.single.path!);
                    } else {
                      print("ERRRRROR");
                      // User canceled the picker
                    }
                    uploadImage(file);
                  },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 70.w, vertical: 20.h),
                    height: 200.h,
                    width: 250.w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/download.png"))),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
