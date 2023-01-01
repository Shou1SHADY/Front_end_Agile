import 'package:flutter/material.dart';
import 'Core/Locale/shared_pref.dart';
import 'Core/Network/Dio.dart';
import 'Layout/app_root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  DioHelper.init();
  runApp(const MyApp());
} 

//Chef Account
//name:ssssssss
//email:dfddd@tttttt.gg
//pass :ssssssss

//Admin Account 
// "name":"kerraAdmin"
// "email":"kiro50@gmail.com"
// "password":"123456"