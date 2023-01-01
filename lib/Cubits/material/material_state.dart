part of 'material_cubit.dart';

@immutable
abstract class MaterialState2 {}

class MaterialInitial extends MaterialState2 {}

////////////////////////////////////////////

class LoadingDataUsers extends MaterialState2 {}

class SuccessfulDataUsers extends MaterialState2 {}

class ErrorDataUsers extends MaterialState2 {
  String error;
  ErrorDataUsers({required this.error});
}
////////////////////////////////////////////