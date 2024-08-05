part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class SingIn extends AuthEvent {
  final String email;
  final String password;

  const SingIn({required this.email, required this.password});
}

class Register extends AuthEvent {
  const Register();
}

class Back extends AuthEvent {
  const Back();
}
