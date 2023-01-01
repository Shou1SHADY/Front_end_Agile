import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/Locale/shared_pref.dart';
import '../../Core/Network/Constant.dart';
import '../../Core/Network/Dio.dart';
import '../../models/Login_response.dart';

part 'leader_state.dart';

class LeaderCubit extends Cubit<LeaderState> {
  LeaderCubit() : super(LeaderInitial());

  static LeaderCubit get(context) => BlocProvider.of(context);

  String reply = "";

  void Request(
      String userName,
      TextEditingController _materialName,
      TextEditingController _quantity,
      TextEditingController _subject,
      TextEditingController _meal,
      TextEditingController _moneyrequi) {
    int _quantityC = int.parse(_quantity.value.text);
    int _moneyrequiC = int.parse(_moneyrequi.value.text);
    // if (CacheHelper.getData(key: "email") != null &&
    //     CacheHelper.getData(key: "password") != null) {
    //   // print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
    //   emit(SuccessfulDataUsers());
    // }
    //  else {
    DioHelper.postData(url: LEADER, data: {
      "user": userName,
      "subject": _subject.value.text,
      "meal": _meal.value.text,
      "materiels": [
        {
          "materiel": {"title": _materialName.value.text},
          "quantity": _quantityC
        }
      ],
      "money": _moneyrequiC
    }).then(((value) {
      emit(LoadingDataUsers());
      if (value.statusCode == 200) {
        reply = value.data.toString();
        print("$reply");
        emit(SuccessfulDataUsers());
      }
    })).catchError((onError) {
      emit(ErrorDataUsers(error: "${onError.toString()}"));
    });
  }
}
