part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class UserLoaded extends HomeState {
  final UserDataModel userState;
  UserLoaded(this.userState);
}


