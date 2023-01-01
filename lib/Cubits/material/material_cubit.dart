import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/Core/Locale/shared_pref.dart';
import 'package:localization/models/taadir_materials.dart';

import '../../Core/Network/Constant.dart';
import '../../Core/Network/Dio.dart';

part 'material_state.dart';

class MaterialCubit extends Cubit<MaterialState2> {
  MaterialCubit() : super(MaterialInitial());

  static MaterialCubit get(context) => BlocProvider.of(context);

  //User users = User();
  List<String> titles = [];
  List<MaterialTa7dir> materials = [];

  void materialsssss() {
    // if (CacheHelper.getData(key: "email") != null &&
    //     CacheHelper.getData(key: "password") != null) {
    //   // print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
    //   emit(SuccessfulDataUsers());
    // }
    //  else {

    DioHelper.getData(url: MATERIALS).then(((value) {
      emit(LoadingDataUsers());

      // print("OOOOOOOOOOOO8888OO");
      if (value.statusCode == 200) {
        print("OOOOOOOOOOOOOO");
        // CacheHelper.saveData(key: "email", value: "$_emailC");
        //CacheHelper.saveData(key: "password", value: "$_passC");
        //  for (int i = 0; i < value.data; i++) {}
        for (var i in value.data) {
          materials.add(MaterialTa7dir.fromJson(i));
        }
        for (var i in materials) {
          titles.add(i.title!);
        }
        CacheHelper.saveData(key: "titles", value: titles);

        //  users = User.fromJson(value.data);
        emit(SuccessfulDataUsers());
      }
    })).catchError((onError) {
      emit(ErrorDataUsers(error: "${onError.toString()}"));
    });
  }
}
