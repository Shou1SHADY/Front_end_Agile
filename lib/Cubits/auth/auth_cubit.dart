import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/Locale/shared_pref.dart';
import '../../Core/Network/Constant.dart';
import '../../Core/Network/Dio.dart';
import '../../models/Login_response.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  User users = User();

  void LoginUsers(TextEditingController _emailC, TextEditingController _passC) {
    // if (CacheHelper.getData(key: "email") != null &&
    //     CacheHelper.getData(key: "password") != null) {
    //   // print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
    //   emit(SuccessfulDataUsers());
    // }
    //  else {
    DioHelper.postData(
            url: LOGIN,
            data: {"name": _emailC.value.text, "password": _passC.value.text})
        .then(((value) {
      emit(LoadingDataUsers());
      if (value.statusCode == 200) {
        CacheHelper.saveData(key: "email", value: "$_emailC");
        CacheHelper.saveData(key: "password", value: "$_passC");
        emit(SuccessfulDataUsers());
      }
    })).catchError((onError) {
      emit(ErrorDataUsers(error: "${onError.toString()}"));
    });
  }
}
