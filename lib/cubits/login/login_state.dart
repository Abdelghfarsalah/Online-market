part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class Loginloading extends LoginState {}

final class LoginSuccess extends LoginState {
  resposemodel model;
  LoginSuccess({required this.model});
}

final class Loginfauiler extends LoginState {}
final class getusersu extends LoginState {}

final class getuserfau extends LoginState {}
