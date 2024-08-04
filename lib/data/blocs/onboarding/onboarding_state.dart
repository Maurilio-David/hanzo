part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();
  @override
  List<Object> get props => [];
}

class ShowOnboarding extends OnboardingState {
  final int page;

  const ShowOnboarding(this.page) : super();
}

class LoadingOnboarding extends OnboardingState {
  const LoadingOnboarding() : super();
}
