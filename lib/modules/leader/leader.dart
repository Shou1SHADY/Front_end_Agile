import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/Core/Locale/shared_pref.dart';
import 'package:localization/Cubits/leader/leader_cubit.dart';
import 'package:localization/modules/Kids/kids.dart';

class Leader extends StatefulWidget {
  String name;
  Leader({Key? key, required this.name}) : super(key: key);

  @override
  State<Leader> createState() => _LeaderState();
}

class _LeaderState extends State<Leader> {
  String? nmy;
  @override
  void initState() {
    nmy = widget.name;
    // if (CacheHelper.getData(key: "titles") != null) {
    //   items = CacheHelper.getData(key: "titles");
    // }

    super.initState();
  }

  bool flag_dropdown = false;
  var _formKey2 = GlobalKey<FormState>();
  final _controller0 = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();

  String dropdownvalue = "";

  // List of items in our dropdown menu

  Widget amount(TextInputType type, String? returnMsg, String hint,
      TextEditingController contr) {
    returnMsg ??= "";
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: TextFormField(
        //  autovalidateMode: AutovalidateMode.always,
        controller: contr,
        maxLines: 1,
        validator: ((value) {
          if (value!.isEmpty ||
              !(RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value))) {
            return returnMsg == "" ? "Enter Correct amount" : returnMsg;
          } else {
            return null;
          }
        }),

        keyboardType: type,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
          labelText: hint,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeaderCubit, LeaderState>(
      listener: (context, state) {},
      builder: (context, state) {
        LeaderCubit Leado = LeaderCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Kids()));
                    },
                    icon: const Icon(Icons.child_care_outlined))
              ],
              title: Text("${AppLocalizations.of(context)!.welcome} ${nmy}"),
              backgroundColor: const Color(0xFF363f93),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                // width: double.infinity,
                //height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Form(
                  key: _formKey2,
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/images/860454.png",
                          height: 200.h,
                          width: 200.w,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      // DropdownButtonFormField(
                      //   validator: ((value) {
                      //     if (flag_dropdown == false ||
                      //         !(RegExp(r'^[a-z A-Z 0-9]+$')
                      //             .hasMatch(value.toString()))) {
                      //       return "Make sure to choose a material";
                      //     } else {
                      //       return null;
                      //     }
                      //   }),
                      //   // Initial Value
                      //   value: dropdownvalue,

                      //   // Down Arrow Icon
                      //   icon: const Icon(Icons.keyboard_arrow_down),

                      //   // Array list of items
                      //   items: items.map((String items) {
                      //     return DropdownMenuItem(
                      //       value: items,
                      //       child: Text(items),
                      //     );
                      //   }).toList(),
                      //   // After selecting the desired option,it will
                      //   // change button value to selected value
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       flag_dropdown = true;
                      //       dropdownvalue = newValue!;
                      //     });
                      //   },
                      // ),,
                      amount(TextInputType.text, "", "Enter Material name",
                          _controller0),
                      amount(TextInputType.number, "",
                          AppLocalizations.of(context)!.money, _controller1),
                      amount(
                          TextInputType.text,
                          AppLocalizations.of(context)!.subject_corr,
                          AppLocalizations.of(context)!.subject,
                          _controller2),
                      amount(
                          TextInputType.text,
                          AppLocalizations.of(context)!.meal_corr,
                          AppLocalizations.of(context)!.meal,
                          _controller3),
                      amount(
                          TextInputType.number,
                          AppLocalizations.of(context)!.money_corr,
                          AppLocalizations.of(context)!.money_requi,
                          _controller4),
                      SizedBox(
                        height: 15.h,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Leado.Request(nmy!, _controller0, _controller1,
                                _controller2, _controller3, _controller4);
                            if (_formKey2.currentState!.validate()) {
                              // Leado.Request(
                              //     nmy.toString(),
                              //     _controller0,
                              //     _controller1,
                              //     _controller2,
                              //     _controller3,
                              //     _controller4);
                              // final snackbar = SnackBar(
                              //   content: Text(
                              //       "Email ${_controller1.value.text} "),
                              // );
                              // ScaffoldMessenger.of(context)
                              //     .showSnackBar(snackbar);
                              var snackBar = SnackBar(
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  color: Colors.green,
                                  title: "Submitted Successfully",
                                  message:
                                      ''' Subject: ${_controller3.value.text} \n Money = : ${_controller4.value.text}
                                                  ''',
                                  contentType: ContentType.failure,
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: Text(AppLocalizations.of(context)!.submit))
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
