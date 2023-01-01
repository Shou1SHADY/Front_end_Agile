import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/Cubits/leader/leader_cubit.dart';
import 'package:localization/Cubits/material/material_cubit.dart';
import 'package:localization/Cubits/preparations/preparations_cubit.dart';
import 'package:localization/Cubits/register/register_cubit.dart';
//import"package:flutter_gen/gen_l10n/"
//import "package:flutter_gen_core/version.gen.dart";
import '../Core/Locale/cache_keys.dart';
import '../Core/components/cache_keys.dart';
import '../Cubits/auth/auth_cubit.dart';
import '../Cubits/dark_theme/dark_cubit.dart';
import 'homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => DarkCubit()..getTheme()),
          BlocProvider(create: (_) => MaterialCubit()..materialsssss()),
          BlocProvider(create: (_) => PreparationsCubit()..taaadirss()),
          BlocProvider(create: (_) => RegisterCubit()),
          BlocProvider(create: (_) => AuthCubit()),
          BlocProvider(create: (_) => LeaderCubit()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              darkTheme: darkTheme,
              theme: theme,
              localizationsDelegates: const [
                AppLocalizations.delegate, // Add this line
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
                Locale('ar', ''),
              ],
              // theme: ThemeData(
              //     iconTheme: IconThemeData(color: Color(0xFF363f93)),
              //     appBarTheme: AppBarTheme(color: Color(0xFF363f93)),
              //     primaryColor: Color(0xFF363f93)),
              locale: Locale.fromSubtags(
                  languageCode: CacheKeysManger.getLanguageFromCache()),
              home: HomePage(),
            );
          },
        ),
      ),
    );
  }
}
