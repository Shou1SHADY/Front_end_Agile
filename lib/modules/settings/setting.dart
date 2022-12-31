import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Core/Locale/shared_pref.dart';
import '../../Cubits/dark_theme/dark_cubit.dart';
import '../../Layout/app_root.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  //bool status = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DarkCubit, DarkState>(
      listener: (context, state) {},
      builder: (context, state) {
        DarkCubit cubit = DarkCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text("Settings"),
          ),
          body: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 27.h, left: 10.w),
                    child: Text(
                      "Dark mode:",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20.sp),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    child: FlutterSwitch(
                      width: 75.0,
                      height: 35.0,
                      valueFontSize: 17.0,
                      toggleSize: 15.0,
                      value: cubit.status,
                      borderRadius: 30.0,
                      padding: 8.0,
                      showOnOff: true,
                      onToggle: (val) {
                        // print(val);
                        //cubit.status = val;
                        cubit.status = val;
                        cubit.getTheme();

                        state is Dark
                            ? AdaptiveTheme.of(context).setLight()
                            : AdaptiveTheme.of(context).setDark();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
