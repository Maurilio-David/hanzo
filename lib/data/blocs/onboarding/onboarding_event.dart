part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();
  @override
  List<Object> get props => [];
}

class ControllerPage extends OnboardingEvent {
  final int page;

  const ControllerPage({required this.page});
}

class CompletedOnboarding extends OnboardingEvent {}
