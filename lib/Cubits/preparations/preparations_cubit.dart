import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/Core/Locale/shared_pref.dart';
import 'package:localization/models/taadir_materials.dart';

import '../../Core/Network/Constant.dart';
import '../../Core/Network/Dio.dart';
import '../../models/taadir.dart';

part 'preparations_state.dart';

class PreparationsCubit extends Cubit<PreparationsState2> {
  PreparationsCubit() : super(PreparationsInitial());

  static PreparationsCubit get(context) => BlocProvider.of(context);

  List<Ta7dir> ta7dirs = [];

  void taaadirss() {
    DioHelper.getData(url: PREPS).then(((value) {
      emit(LoadingDataUsers());

      // print("OOOOOOOOOOOO8888OO");
      if (value.statusCode == 200) {
        print("OOOOOOOOOOOOOO");
        // CacheHelper.saveData(key: "email", value: "$_emailC");
        //CacheHelper.saveData(key: "password", value: "$_passC");
        //  for (int i = 0; i < value.data; i++) {}
        for (var i in value.data) {
          ta7dirs.add(Ta7dir.fromJson(i));
        }

        //  users = User.fromJson(value.data);
        emit(SuccessfulDataUsers());
      }
    })).catchError((onError) {
      emit(ErrorDataUsers(error: "${onError.toString()}"));
    });
  }
}
