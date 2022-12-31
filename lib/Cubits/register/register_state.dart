part of 'register_cubit.dart';

@immutable
abstract class RegitserState {}

class RegisterInitial extends RegitserState {}

////////////////////////////////////////////

class LoadingDataUsers extends RegitserState {}

class SuccessfulDataUsers extends RegitserState {}

class ErrorDataUsers extends RegitserState {
  String error;
  ErrorDataUsers({required this.error});
}
////////////////////////////////////////////