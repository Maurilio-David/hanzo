part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class LoadingState extends AuthState {
  const LoadingState() : super();
}

class InitialState extends AuthState {
  const InitialState() : super();
}

class LoggedState extends AuthState {
  const LoggedState() : super();
}

class ErrorState extends AuthState {
  const ErrorState() : super();
}
