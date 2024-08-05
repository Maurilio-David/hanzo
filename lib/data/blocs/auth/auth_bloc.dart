import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hanzo/data/repositories/auth/auth_repostitory.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final registerKey = GlobalKey<FormState>();
  final _repostitory = AuthRepostitory();

  AuthBloc() : super(const InitialState()) {
    on(_mapEventToState);
  }

  void _mapEventToState(AuthEvent event, Emitter emit) async {
    emit(const LoadingState());
    if (event is Register) {
      String? result = await _repostitory.register(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text);
      if (result! == 'sucess') {
        emit(const LoggedState());
      } else {
        emit(const ErrorState());
      }
    }
    if (event is Back) {
      emit(const InitialState());
    }
  }
}
