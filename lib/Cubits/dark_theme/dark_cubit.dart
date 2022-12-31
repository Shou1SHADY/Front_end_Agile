import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Core/Locale/shared_pref.dart';
part 'dark_state.dart';

class DarkCubit extends Cubit<DarkState> {
  DarkCubit() : super(DarkInitial());

  static DarkCubit get(context) => BlocProvider.of(context);

  bool status = false;

  void getTheme() {
    if (status == false) {
      emit(Light());
    } else {
      emit(Dark());
    }
  }
}
