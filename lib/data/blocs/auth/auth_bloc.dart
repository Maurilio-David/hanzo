import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repositories/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final registerKey = GlobalKey<FormState>();
  final signinKey = GlobalKey<FormState>();
  final _repository = AuthRepostitory();
  bool logged = false;

  AuthBloc() : super(const InitialState()) {
    on<AuthEvent>(_mapEventToState);
  }

  setUserLogged(bool logged) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('userLogged', logged);
  }

  Future<bool> getUserLogged() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('userLogged') ?? false;
  }

  void _mapEventToState(AuthEvent event, Emitter<AuthState> emit) async {
    emit(const LoadingState());
    if (event is Register) {
      String? result = await _repository.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      if (result == 'success') {
        emit(const LoggedState());
      } else {
        emit(const ErrorState());
      }
    } else if (event is Back || event is Clean) {
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      emit(const InitialState());
    } else if (event is Login) {
      String? result = await _repository.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (result == 'success') {
        await setUserLogged(true);
      } else {
        emit(const ErrorState());
      }
    } else if (event is Logout) {
      await setUserLogged(false);
      emit(const InitialState());
    }
  }
}
