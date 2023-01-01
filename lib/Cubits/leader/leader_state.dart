part of 'leader_cubit.dart';

@immutable
abstract class LeaderState {}

class LeaderInitial extends LeaderState {}

////////////////////////////////////////////

class LoadingDataUsers extends LeaderState {}

class SuccessfulDataUsers extends LeaderState {}

class ErrorDataUsers extends LeaderState {
  String error;
  ErrorDataUsers({required this.error});
}
////////////////////////////////////////////