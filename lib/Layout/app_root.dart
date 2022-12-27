import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Core/Components/cache_keys.dart';
import 'homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      theme: ThemeData(
          iconTheme: IconThemeData(color: Color(0xFF363f93)),
          appBarTheme: AppBarTheme(color: Color(0xFF363f93)),
          primaryColor: Color(0xFF363f93)),
      debugShowCheckedModeBanner: false,
      locale: Locale.fromSubtags(
          languageCode: CacheKeysManger.getLanguageFromCache()),
      home: HomePage(),
    );
  }
}
