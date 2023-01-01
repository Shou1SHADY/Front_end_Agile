import "package:flutter/material.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/models/adminTitles.dart';
import 'package:localization/modules/Admin/announcements.dart';
import 'package:localization/modules/Admin/preparations.dart';
import 'package:localization/modules/Admin/reports.dart';
import 'material.dart';

class AdminMain extends StatefulWidget {
  String nameA = "";
  AdminMain({super.key, required String nameA});

  @override
  State<AdminMain> createState() => _AdminMainState();
}

class _AdminMainState extends State<AdminMain> {
  List<AdminTitles> titles = <AdminTitles>[
    AdminTitles(color: Colors.black, title: "Preparations", sas: Preparation()),
    AdminTitles(color: Colors.blueAccent, title: "Reports", sas: Reports()),
    AdminTitles(
        color: Colors.orangeAccent,
        title: "Announcements",
        sas: Announcements()),
    AdminTitles(color: Colors.red, title: "Material", sas: Material2()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF363f93),
        title: Center(
          child:
              Text("${AppLocalizations.of(context)!.welcome} ${widget.nameA}"),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: titles.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => titles[index].sas));
                },
                child: Card(
                  color: titles[index].color,
                  child: Center(
                      child: Container(
                          child: Text(
                    titles[index].title,
                    style: TextStyle(color: Colors.white, fontSize: 22.sp),
                  ))),
                ),
              );
            }),
      ),
    );
  }
}
