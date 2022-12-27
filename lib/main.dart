import 'package:flutter/material.dart';
import 'package:flutter_application_2/Core/Locale/shared_pref.dart';
import 'Layout/app_root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  runApp(const MyApp());
}
