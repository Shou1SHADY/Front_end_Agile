import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/Locale/shared_pref.dart';
import '../../Core/Network/Constant.dart';
import '../../Core/Network/Dio.dart';
import '../../models/Login_response.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegitserState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  User users = User();

  void getUsers(TextEditingController _nameC, TextEditingController _emailC,
      TextEditingController _passC) {
    DioHelper.postData(url: SIGNUP, data: {
      "name": _nameC.value.text,
      "email": _emailC.value.text,
      "password": _passC.value.text
    }).then(((value) {
      emit(LoadingDataUsers());
      if (value.statusCode == 200) {
        //for (var i in value.data) {

        users = User.fromJson(value.data);

        CacheHelper.saveData(key: "email", value: "$_emailC");
        CacheHelper.saveData(key: "password", value: "$_passC");
        emit(SuccessfulDataUsers());

        //  }

      }
    })).catchError((onError) {
      emit(ErrorDataUsers(error: "${onError.toString()}"));
    });
  }
}
//}
