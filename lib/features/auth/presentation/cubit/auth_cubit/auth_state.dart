part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {}
final class LoginFailure extends AuthState {
  final String error;

  LoginFailure({required this.error});
}

final class VerifyOtpLoading extends AuthState {}
final class VerifyOtpSuccess extends AuthState {}
final class VerifyOtpFailure extends AuthState {
  final String error;

  VerifyOtpFailure({required this.error});
}
