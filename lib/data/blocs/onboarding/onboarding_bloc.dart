import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const ShowOnboarding(0)) {
    completedOnboarding() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboardingComplete', true);
    }

    on<ControllerPage>((event, emit) {
      emit(const LoadingOnboarding());
      emit(ShowOnboarding(event.page));
    });

    on<CompletedOnboarding>((event, emit) {
      completedOnboarding();
    });
  }
}
