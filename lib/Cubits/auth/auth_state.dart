part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

////////////////////////////////////////////

class LoadingDataUsers extends AuthState {}

class SuccessfulDataUsers extends AuthState {}

class ErrorDataUsers extends AuthState {
  String error;
  ErrorDataUsers({required this.error});
}
////////////////////////////////////////////