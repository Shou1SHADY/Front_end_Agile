part of 'preparations_cubit.dart';

@immutable
abstract class PreparationsState2 {}

class PreparationsInitial extends PreparationsState2 {}

////////////////////////////////////////////

class LoadingDataUsers extends PreparationsState2 {}

class SuccessfulDataUsers extends PreparationsState2 {}

class ErrorDataUsers extends PreparationsState2 {
  String error;
  ErrorDataUsers({required this.error});
}
////////////////////////////////////////////